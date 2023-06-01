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
    var url = URL(string: "https://your-website-url.com")!
    var name = "SwiftTom"
    var description = ""
//    var description = "Hi! My name is Tom, I am a self taught programmer that has been programming since 2015. This blog is to help teach swift programming topics to anyone who wants to learn how to program in swift. Topics covered on this blog will range from beginner to experienced. Come join me in learning all about the amazing programming language that is swift!"
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
    .generateSiteMap()
  ])
    
    
//    .publish(withTheme: .myTheme)
