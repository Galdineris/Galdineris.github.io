//
//  Node+Extension.swift
//  
//
//  Created by Rafael Galdino on 26/11/20.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }

    static var spacer: Node {
        .p(.text(" "))
    }

    static func clearfix(_ nodes: Node...) -> Node {
        .div(.class("clearfix"), .group(nodes))
    }

    //MARK: header
    static func header<T: Website>(
        for context: PublishingContext<T>,
        selectedSection: T.SectionID?
    ) -> Node {
        let sectionIDs = T.SectionID.allCases
        return .header(
            .wrapper(
                .a(
                    .class("site-name"),
                    .href("/"),
                    .img(
                        .class("profile_pic"),
                        .src(Path("GaldinerisTheme/memoji.png"))
                    ),
                    .p(.text(context.site.name))
                ),
                .p(.text(context.site.description)),
                socials(),
                .if(sectionIDs.count > 0,
                    .nav(
                        .ul(.forEach(sectionIDs) { section in
                            .li(.a(
                                .class(section == selectedSection ? "selected" : ""),
                                .href(context.sections[section].path),
                                .text(context.sections[section].title)
                            ))
                        })
                    )
                )
            ),
            .footer(for: context.site)
        )
    }
    // MARK: Item list
    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return
            .div(.class("portfolio"),
                .forEach(items) { item in
                    let imagePath: Path = item.imagePath ?? "GaldinerisTheme/memoji.png"
                    return .div(.class("portfolio_card"),
                        img(.class("portfolio_card_image"),
                            .src(imagePath)
                        ),
                        .a(.class("portfolio_card_overlay"),
                           .img(.class("portfolio_card_overlay_image"), .src(imagePath)),
                             .div(.class("portfolio_card_overlay_text"),
                                  .p(.text(item.content.title)),
                                  .p(.text(item.content.description))
                             ),
                             .href(item.path)
                        )
                    )
                }
            )
    }

    static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
        return .ul(.class("tag-list"), .forEach(item.tags) { tag in
            .li(.p(
                .text(tag.string)
            ))
        })
    }

    static func footer<T: Website>(for site: T) -> Node {
        return .footer(
            .p(
                .text("Made by \(site.name)")
            ),
            .p(
                .text("Generated using "),
                .a(
                    .text("Publish"),
                    .href("https://github.com/johnsundell/publish")
                )
            )
        )
    }
    static func socials() -> Node {
        return .ul(
            .class("socials"),
            .li(
                .class("socials_item"),
                .githubIcon
            ),
            .li(
                .class("socials_item"),
                .linkedInIcon
            )
        )
    }
}

// MARK: head
extension Node where Context == HTML.DocumentContext {
    static func head<T: Website>(
        for location: Location,
        on site: T,
        titleSeparator: String = " | ",
        stylesheetPaths: [Path] = ["/styles.css"],
        rssFeedPath: Path? = .defaultForRSSFeed,
        rssFeedTitle: String? = nil
    ) -> Node {
        var title = location.title

        if title.isEmpty {
            title = site.name
        } else {
            title.append(titleSeparator + site.name)
        }

        var description = location.description

        if description.isEmpty {
            description = site.description
        }

        return .head(
            .encoding(.utf8),
            .siteName(site.name),
            .url(site.url(for: location)),
            .title(title),
            .script(.src("https://kit.fontawesome.com/a584ca7c24.js"),
                    .attribute(named: "crossorigin", value: "anonymous")),
            .link(.rel(.stylesheet),
                  .href("https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"),
                  .integrity("sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"),
                  .attribute(named: "crossorigin", value: "anonymous")),
            .description(description),
            .twitterCardType(location.imagePath == nil ? .summary : .summaryLargeImage),
            .forEach(stylesheetPaths, { .stylesheet($0) }),
            .viewport(.accordingToDevice),
            .unwrap(site.favicon, { .favicon($0) }),
            .unwrap(rssFeedPath, { path in
                let title = rssFeedTitle ?? "Subscribe to \(site.name)"
                return .rssFeedLink(path.absoluteString, title: title)
            }),
            .unwrap(location.imagePath ?? site.imagePath, { path in
                let url = site.url(for: path)
                return .socialImageLink(url)
            })
        )
    }
}
