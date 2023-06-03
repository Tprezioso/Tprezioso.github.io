import Foundation
import Publish
import Plot
import SplashPublishPlugin

// This type acts as the configuration for your website.
struct SwiftTom: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case about
        case portfolio
        case contact
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://tprezioso.github.io/SwiftTom/")!
    var name = "SwiftTom"
    var description = ""
    var language: Language { .english }
    var imagePath: Path? { nil }
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
    .deploy(using: .gitHub("tprezioso/swifttom")
    ),
    .generateSiteMap()
    
  ])
    
    
//    .publish(withTheme: .myTheme)
