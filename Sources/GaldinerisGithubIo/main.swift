import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct GaldinerisGithubIo: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case about
        case projects
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://galdineris.github.io")!
    var name = "Rafael Galdino"
    var description = "Personal portfolio of an iOS Developer"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try GaldinerisGithubIo().publish(withTheme: .galdineris)
