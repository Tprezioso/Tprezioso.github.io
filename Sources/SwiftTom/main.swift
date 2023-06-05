import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
public struct SwiftTom: Website {
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
    public var url = URL(string: "https://tprezioso.github.io/SwiftTom/")!
    public var name = "SwiftTom"
    public var description = ""
    public var language: Language { .english }
    public var imagePath: Path? { Path("images/tom.jpg") }
}


// Define your Theme here

// This will generate your website using the built-in Foundation theme:
try SwiftTom().publish(using: [
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
    .deploy(using: .gitHub("tprezioso/swifttom"))
  ])


public extension Theme where Site == SwiftTom {
    /// The default "Foundation" theme that Publish ships with, a very
    /// basic theme mostly implemented for demonstration purposes.
    static var myTheme: Self {
        Theme(
            htmlFactory: MyThemeHTMLFactory<SwiftTom>(),
            resourcePaths: ["Resources/MyTheme/styles.css"]
        )
    }
}
