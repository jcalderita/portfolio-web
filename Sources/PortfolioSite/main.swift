import ImageOptimizer
import Saga

try await ImageOptimizer().run()

try await Saga()
    .i18n()
    .registerBlog()
    .registerLegal()
    .registerAppendices()
    .createAllPages()
    .highlightCode()
    .injectCopyButtons()
    .cleanupUnhashedAssets()
    .run()
