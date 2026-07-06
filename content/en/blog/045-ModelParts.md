---
title: Model Parts
slug: model-parts
date: 2026-07-08
description: How to centralize indexes, foreign keys, and unique constraints in the model itself so migrations and tests speak the same language.
tags: Swift, Server, DataBase
cover: ModelParts
coverDescription: Jorge as a tailor holding a sports jersey in front of a mannequin, with garments stacked on a chair beside him, representing how the pieces of a model (indexes, foreign keys, unique constraints) are assembled to shape the final database structure.
publish: true
---
---
## My Problem 🤔

When I write migrations with <span class="high">Fluent</span>, indexes, foreign keys, and unique constraints are defined inside the migration's <span class="high">prepare</span> method. They belong to the migration, not to the model.

```swift
func prepare(on db: Database) async throws {
    try await db.schema("products")
        .id()
        .field(.externalId, .string, .required)
        .field(.categoryId, .uuid, .references("categories", "id", onDelete: .cascade, onUpdate: .cascade))
        .unique(on: .externalId)
        .create()
}
```

The problem is that this information **isn't readable outside the migration**. It's part of a method that runs once and exposes nothing to the rest of the code. When I want to write an integration test that verifies the migration created the right indexes, where do I get the expected names from? I have to repeat them as strings in the test. And when I want to verify that the foreign keys exist, same thing: hardcoded strings, coupled to whatever lives inside <span class="high">prepare</span>.

My model knows which table it represents. My model knows which fields it has. But it knows nothing about its own database structure: indexes, references, uniqueness. That information belongs to the migration, and the only way to access it is by running it.

---

## My Solution 🧩

My idea is to turn the model into the **single source of truth** for all the structural metadata of its table. I created a <span class="high">SchemaDescribable</span> protocol that extends <span class="high">Fluent</span>'s <span class="high">Model</span> with three static properties: indexes, foreign keys, and unique constraints.

```swift
protocol SchemaDescribable: Model {
    static var indexes: [IndexDefinition] { get }
    static var foreignKeys: [ForeignKeyDefinition] { get }
    static var uniques: [UniqueDefinition] { get }
}
```

Each kind of constraint has its own type with factory methods that make the declaration readable and safe. I declare the conformance in the database layer, not in the shared model:

```swift
extension ProductModel: SchemaDescribable {
    static var indexes: [IndexDefinition] {
        [
            .btree("idx_products_sku", [.sku]),
            .btree("idx_products_category_id", [.categoryId]),
            .btree("idx_products_brand_id", [.brandId]),
            .btree("idx_products_supplier_id", [.supplierId]),
            .btree("idx_products_warehouse_id", [.warehouseId]),
            .btree("idx_products_parent_id", [.parentId]),
            .lower("idx_products_name_prefix", .name),
        ]
    }

    static var foreignKeys: [ForeignKeyDefinition] {
        [
            .references(.parentId, on: ProductModel.self),
            .references(.categoryId, on: CategoryModel.self),
            .references(.brandId, on: BrandModel.self),
            .references(.supplierId, on: SupplierModel.self),
            .references(.warehouseId, on: WarehouseModel.self),
        ]
    }

    static var uniques: [UniqueDefinition] { [.on(.externalId)] }
}
```

Each model explicitly declares all its <span class="high">B-Tree</span> indexes, its foreign keys, and its unique constraints. Factory methods like <span class="high">.btree</span>, <span class="high">.lower</span>, <span class="high">.references</span>, and <span class="high">.on</span> make the declaration compact and hard to get wrong.

With the definitions in the model, the migration just applies them. An <span class="high">addConstraints(for:)</span> method on <span class="high">SchemaBuilder</span> adds the foreign keys and unique constraints, and <span class="high">createIndexes</span> generates the indexes — all from what the model declares:

```swift
struct CreateProducts: AsyncMigration, MigrationProtocol {
    typealias ModelType = ProductModel
    let target: DeployTarget

    func prepare(on db: Database) async throws {
        try await db.schema(model)
            .id(default: true)
            .field(.externalId, .string, .required)
            .field(.name, .string, .required)
            .field(.sku, .string, .required)
            .field(.price, .double, .required)
            .field(.weight, .double)
            .field(.stock, .int)
            .field(.parentId, .uuid)
            .field(.categoryId, .uuid)
            .field(.brandId, .uuid)
            .field(.supplierId, .uuid)
            .field(.warehouseId, .uuid)
            .timestamps(default: true)
            .addConstraints(for: model)
            .create()

        try await createIndexes(on: db)
    }

    func revert(on db: Database) async throws {
        try await db.schema(model).delete()
    }
}
```

The migration no longer contains any constraint definition. It only declares the fields and delegates the entire structure of indexes, foreign keys, and uniques to the model through <span class="high">addConstraints(for:)</span> and <span class="high">createIndexes</span>. The <span class="high">MigrationProtocol</span> protocol provides these methods thanks to the <span class="high">typealias ModelType</span>, which connects the migration to its model and gives access to the <span class="high">SchemaDescribable</span> definitions.

---

## My Result 🎯

Now indexes, foreign keys, and unique constraints are **properties of the model**, not code buried in a migration. Any part of my project can read them.

The most immediate benefit is clean migrations. But the one that pays off down the line is that **tests can talk directly to the model** — in an upcoming article we'll see how I use this to write integration tests that verify the database structure without a single hardcoded string.

- **A single place** to read all the structural metadata of each model
- **Migrations without repetition** — <span class="high">addConstraints(for: model)</span> applies everything in one step
- **Localized changes** — adding an index or FK only touches the model's conformance

The key is recognizing that a model isn't just a container of fields: it's also the complete description of its table. <span class="high">SchemaDescribable</span> makes explicit what used to be implicit — and belonged only to the migration.


**Keep coding, keep running** 🏃‍♂️

---
