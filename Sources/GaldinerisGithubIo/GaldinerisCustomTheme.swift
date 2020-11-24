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
                    .header(for: context, selectedSection: nil),
                    .wrapper(
                        .h2(
                            .class("description"),
                            .text(context.site.description)
                        ),
                        .h2("Projects"),
                        .itemList(
                            for: context.allItems(
                                sortedBy: \.date,
                                order: .descending
                            ),
                            on: context.site
                        )
                    ),
                    .footer(for: context.site)
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
                        .itemList(for: section.items, on: context.site)
                    ),
                    .footer(for: context.site)
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
                            .tagList(for: item, on: context.site)
                        )
                    ),
                    .footer(for: context.site)
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
                    .wrapper(.contentBody(page.body)),
                    .footer(for: context.site)
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
                        )
                    ),
                    .footer(for: context.site)
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
                    ),
                    .footer(for: context.site)
                )
            )
        }
    }
}

private extension Node where Context == HTML.BodyContext {
    //MARK: Divs
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }

    static func clearfix(_ nodes: Node...) -> Node {
        .div(.class("clearfix"), .group(nodes))
    }

    //MARK: Custom Elements
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
                    .span(
                        .class("profile_pic"),
                        Node<HTML.BodyContext>.raw(##"<svg aria-hidden="true" data-prefix="fab" data-icon="github" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000" data-fa-i2svg=""><defs/><g><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 950 500 A 450 450 0 1 1 949.9997750000188 499.55000007499973" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 433.70613204139687 900.3892045454545 A 187.5 187.5 0 1 1 687.0784499054821 712.4340308387277" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 687.0784499054821 737.5659691612723 A 187.5 187.5 0 0 1 566.2938679586032 900.3892045454545" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 433.70613204139687 900.3892045454545 A 73.125 73.125 0 0 1 566.2938679586032 900.3892045454545" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="currentColor" paint-order="stroke fill markers" d=" M 476.66337888843077 881.1465626502805 A 4.875 4.875 0 1 1 476.66337645093097 881.1416876510931"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 504.875 873.75 A 4.875 4.875 0 1 1 504.8749975625002 873.7451250008125"/><path fill="#000000" stroke="currentColor" paint-order="stroke fill markers" d=" M 533.0866211115692 881.1465626502805 A 4.875 4.875 0 1 1 533.0866186740694 881.1416876510931"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 660.1242444888462 871.0617444888462 A 14.0625 14.0625 0 1 1 660.1242374575968 871.04768199119" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 687.078449905482 737.5659691612723 A 56.25 56.25 0 1 1 687.078449905482 712.4340308387277" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 674.4375 725 A 14.0625 14.0625 0 1 1 674.4374929687506 724.9859375023437" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 514.0625 537.5 A 14.0625 14.0625 0 1 1 514.0624929687506 537.4859375023437" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 430 725 A 56.25 56.25 0 1 1 429.99997187500236 724.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 410.55166996906354 699.8787267502919 A 4.875 4.875 0 1 1 410.55166753156374 699.8738517511044"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 419.25 725 A 4.875 4.875 0 1 1 419.2499975625002 724.9951250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 410.55166996906354 750.1212732497081 A 4.875 4.875 0 1 1 410.55166753156374 750.1163982505207"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 487.4340308387277 462.07844990548205 A 187.5 187.5 0 0 1 487.4340308387277 87.92155009451795" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 512.5659691612723 87.92155009451795 A 187.5 187.5 0 0 1 512.5659691612723 462.07844990548205" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 487.4340308387277 462.07844990548205 A 56.25 56.25 0 1 1 512.5659691612723 462.07844990548205" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 514.0625 435.375 A 14.0625 14.0625 0 1 1 514.0624929687506 435.36093750234375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 682.5 275 A 56.25 56.25 0 1 1 682.4999718750023 274.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 599.1983300309365 300.12127324970805 A 4.875 4.875 0 1 1 599.1983275934367 300.11639825052055"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 590.5 275 A 4.875 4.875 0 1 1 590.4999975625002 274.9951250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 599.1983300309365 249.87872675029195 A 4.875 4.875 0 1 1 599.1983275934367 249.87385175110444"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 512.5659691612723 87.92155009451795 A 56.25 56.25 0 1 1 487.4340308387277 87.92155009451795" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 529.9962732497081 174.6766699690635 A 4.875 4.875 0 1 1 529.9962708122083 174.671794969876"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 504.875 183.375 A 4.875 4.875 0 1 1 504.8749975625002 183.3701250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 479.75372675029195 174.6766699690635 A 4.875 4.875 0 1 1 479.75372431279214 174.671794969876"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 514.0625 142.75 A 14.0625 14.0625 0 1 1 514.0624929687506 142.73593750234375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 430 275 A 56.25 56.25 0 1 1 429.99997187500236 274.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 439.78072370375986 296.5259430705363 A 14.0625 14.0625 0 1 1 439.78071667251044 296.51188057288005" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 670.2401515505438 683.5173423565135 L 503.3866461464539 156.39860923789337" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 579.0912525436956 743.3904885437244 L 358.2059959712948 329.05965629520404" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 595.9125585656968 682.0622211798445 L 277.7586593221776 891.2911786556452" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 456.51344837406583 371.5711221072612 L 651.5500513434708 76.28714683433151" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/></g></svg>"##)
                          ),
                    .br(),
                    .text(context.site.name)
                ),
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
            )
        )
    }

    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    )),
                    .p(
                        .text(item.description),
                        .br(),
                        .br()
                    ),
                    .tagList(for: item, on: site)
                ))
            }
        )
    }

    static func tagList<T: Website>(for item: Item<T>, on site: T) -> Node {
        return .ul(.class("tag-list"), .text("Frameworks and Technologies: "), .forEach(item.tags) { tag in
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
            ),
            .p(.a(
                .text("RSS feed"),
                .href("/feed.rss")
            ))
        )
    }
    static func profilePicture(named name:String) -> Node {
        return .div(

            )
    }

    static func socials() -> Node {
        return .ul(
            .class("socials"),
            .li(
                .class("socials_item"),
                .a(
                    .href("https://github.com/galdineris/"),
                    .class("socials_item_link"),
                    .target(.blank),
                    Node<HTML.AnchorContext>.raw(#"<svg aria-hidden="true" data-prefix="fab" data-icon="github" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" data-fa-i2svg=""><path fill="currentColor" d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"></path></svg>"#)
                )
            ),
            .li(
                .class("socials_item"),
                .a(
                    .href("https://www.linkedin.com/in/rafael-galdino/"),
                    .class("socials_item_link"),
                    .target(.blank),
                    Node<HTML.AnchorContext>.raw(#"<svg aria-hidden="true" data-prefix="fab" data-icon="linkedin" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M416 32H31.9C14.3 32 0 46.5 0 64.3v383.4C0 465.5 14.3 480 31.9 480H416c17.6 0 32-14.5 32-32.3V64.3c0-17.8-14.4-32.3-32-32.3zM135.4 416H69V202.2h66.5V416zm-33.2-243c-21.3 0-38.5-17.3-38.5-38.5S80.9 96 102.2 96c21.2 0 38.5 17.3 38.5 38.5 0 21.3-17.2 38.5-38.5 38.5zm282.1 243h-66.4V312c0-24.8-.5-56.7-34.5-56.7-34.6 0-39.9 27-39.9 54.9V416h-66.4V202.2h63.7v29.2h.9c8.9-16.8 30.6-34.5 62.9-34.5 67.2 0 79.7 44.3 79.7 101.9V416z"></path></svg>"#)
                )
            )
        )
    }
}

/*
<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="1000" height="1000"><defs/><g><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 950 500 A 450 450 0 1 1 949.9997750000188 499.55000007499973" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 433.70613204139687 900.3892045454545 A 187.5 187.5 0 1 1 687.0784499054821 712.4340308387277" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 687.0784499054821 737.5659691612723 A 187.5 187.5 0 0 1 566.2938679586032 900.3892045454545" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 433.70613204139687 900.3892045454545 A 73.125 73.125 0 0 1 566.2938679586032 900.3892045454545" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 476.66337888843077 881.1465626502805 A 4.875 4.875 0 1 1 476.66337645093097 881.1416876510931"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 504.875 873.75 A 4.875 4.875 0 1 1 504.8749975625002 873.7451250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 533.0866211115692 881.1465626502805 A 4.875 4.875 0 1 1 533.0866186740694 881.1416876510931"/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 660.1242444888462 871.0617444888462 A 14.0625 14.0625 0 1 1 660.1242374575968 871.04768199119" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 687.078449905482 737.5659691612723 A 56.25 56.25 0 1 1 687.078449905482 712.4340308387277" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 674.4375 725 A 14.0625 14.0625 0 1 1 674.4374929687506 724.9859375023437" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 514.0625 537.5 A 14.0625 14.0625 0 1 1 514.0624929687506 537.4859375023437" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 430 725 A 56.25 56.25 0 1 1 429.99997187500236 724.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 410.55166996906354 699.8787267502919 A 4.875 4.875 0 1 1 410.55166753156374 699.8738517511044"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 419.25 725 A 4.875 4.875 0 1 1 419.2499975625002 724.9951250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 410.55166996906354 750.1212732497081 A 4.875 4.875 0 1 1 410.55166753156374 750.1163982505207"/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 487.4340308387277 462.07844990548205 A 187.5 187.5 0 0 1 487.4340308387277 87.92155009451795" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 512.5659691612723 87.92155009451795 A 187.5 187.5 0 0 1 512.5659691612723 462.07844990548205" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 487.4340308387277 462.07844990548205 A 56.25 56.25 0 1 1 512.5659691612723 462.07844990548205" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 514.0625 435.375 A 14.0625 14.0625 0 1 1 514.0624929687506 435.36093750234375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 682.5 275 A 56.25 56.25 0 1 1 682.4999718750023 274.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 599.1983300309365 300.12127324970805 A 4.875 4.875 0 1 1 599.1983275934367 300.11639825052055"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 590.5 275 A 4.875 4.875 0 1 1 590.4999975625002 274.9951250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 599.1983300309365 249.87872675029195 A 4.875 4.875 0 1 1 599.1983275934367 249.87385175110444"/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 512.5659691612723 87.92155009451795 A 56.25 56.25 0 1 1 487.4340308387277 87.92155009451795" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 529.9962732497081 174.6766699690635 A 4.875 4.875 0 1 1 529.9962708122083 174.671794969876"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 504.875 183.375 A 4.875 4.875 0 1 1 504.8749975625002 183.3701250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 479.75372675029195 174.6766699690635 A 4.875 4.875 0 1 1 479.75372431279214 174.671794969876"/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 514.0625 142.75 A 14.0625 14.0625 0 1 1 514.0624929687506 142.73593750234375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 430 275 A 56.25 56.25 0 1 1 429.99997187500236 274.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 439.78072370375986 296.5259430705363 A 14.0625 14.0625 0 1 1 439.78071667251044 296.51188057288005" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 670.2401515505438 683.5173423565135 L 503.3866461464539 156.39860923789337" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 579.0912525436956 743.3904885437244 L 358.2059959712948 329.05965629520404" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 595.9125585656968 682.0622211798445 L 277.7586593221776 891.2911786556452" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="black" paint-order="fill stroke markers" d=" M 456.51344837406583 371.5711221072612 L 651.5500513434708 76.28714683433151" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/></g></svg>
*/
