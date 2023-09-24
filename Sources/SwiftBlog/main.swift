import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
public struct SwiftBlog: Website {
    public enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
        case portfolio
        case contact
    }

    public struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    public var url = URL(string: "https://tprezioso.github.io/")!
    public var name = "Another Swift Blog"
    public var description = "Another Swift Blog"
    public var language: Language { .english }
    public var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try SwiftBlog().publish(using: [
    .copyResources(),
    .installPlugin(.splash(withClassPrefix: "")),
    .addMarkdownFiles(),
    .sortItems(by: \.date, order: .descending),
    .generateHTML(withTheme: .myTheme),
    .unwrap(RSSFeedConfiguration.default) { config in
        .generateRSSFeed(
          including: [.posts],
            config: config
        )
    },
    .generateSiteMap(),
    .deploy(using: .gitHub("tprezioso/Tprezioso.github.io"))
  ])

public extension Theme where Site == SwiftBlog {
    /// The default "Foundation" theme that Publish ships with, a very
    /// basic theme mostly implemented for demonstration purposes.
    static var myTheme: Self {
        Theme(
            htmlFactory: MyThemeHTMLFactory(),
            resourcePaths: ["Resources/MyTheme/styles.css"]
        )
    }
}
