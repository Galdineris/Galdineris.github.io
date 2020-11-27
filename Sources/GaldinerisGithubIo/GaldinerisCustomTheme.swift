//
//  GaldinerisCustomTheme.swift
//  
//
//  Created by Rafael Galdino on 23/11/20.
//

import Foundation
import Publish
import Plot

extension Theme where Site == GaldinerisGithubIo {
    static var galdineris: Self {
        Theme(htmlFactory: GaldinerisCustomTheme(),
              resourcePaths: ["Resources/GaldinerisTheme/styles.css"])
    }

    private struct GaldinerisCustomTheme: HTMLFactory {
        func makeIndexHTML(for index: Index, context: PublishingContext<GaldinerisGithubIo>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: index, on: context.site),
                .body(
                    .style(##"background: #f0f0f0"##),
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .itemList(
                            for: context.allItems(
                                sortedBy: \.date,
                                order: .descending
                            ),
                            on: context.site
                        ),
                        .footer(for: context.site)
                    )
                )
            )
        }

        func makeSectionHTML(for section: Section<Site>,
                             context: PublishingContext<Site>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: section, on: context.site),
                .body(
                    .header(for: context, selectedSection: section.id),
                    .wrapper(
                        .p(.contentBody(section.body)),
                        .itemList(for: section.items, on: context.site),
                        .footer(for: context.site)
                    )
                )
            )
        }

        func makeItemHTML(for item: Item<Site>,
                          context: PublishingContext<Site>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: item, on: context.site),
                .body(
                    .class("item-page"),
                    .header(for: context, selectedSection: item.sectionID),
                    .wrapper(
                        .article(
                            .div(
                                .class("content"),
                                .contentBody(item.body)
                            ),
                            .span("Frameworks and Technologies used: "),
                            .tagList(for: item, on: context.site),
                            .footer(for: context.site)
                        )
                    )
                )
            )
        }

        func makePageHTML(for page: Page,
                          context: PublishingContext<Site>) throws -> HTML {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(.contentBody(page.body),
                             .footer(for: context.site))
                )
            )
        }

        func makeTagListHTML(for page: TagListPage,
                             context: PublishingContext<Site>) throws -> HTML? {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .h1("Browse all tags"),
                        .ul(
                            .class("all-tags"),
                            .forEach(page.tags.sorted()) { tag in
                                .li(
                                    .class("tag"),
                                    .p(
                                        .text(tag.string)
                                    )
                                )
                            }
                        ),
                        .footer(for: context.site)
                    )
                )
            )
        }

        func makeTagDetailsHTML(for page: TagDetailsPage,
                                context: PublishingContext<Site>) throws -> HTML? {
            HTML(
                .lang(context.site.language),
                .head(for: page, on: context.site),
                .body(
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .h1(
                            "Tagged with ",
                            .span(.class("tag"), .text(page.tag.string))
                        ),
                        .itemList(
                            for: context.items(
                                taggedWith: page.tag,
                                sortedBy: \.date,
                                order: .descending
                            ),
                            on: context.site
                        )
                    )
                )
            )
        }
    }
}


