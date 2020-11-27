//
//  File.swift
//  
//
//  Created by Rafael Galdino on 24/11/20.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static var githubIcon: Node {
        .a(
            .href("https://www.linkedin.com/in/rafael-galdino/"),
            .class("socials_item_link"),
            .target(.blank),
            .i(.class("fab fa-github-square"))
        )
    }

    static var linkedInIcon: Node {
        .a(
            .href("https://www.linkedin.com/in/rafael-galdino/"),
            .class("socials_item_link"),
            .target(.blank),
            .i(.class("fab fa-linkedin"))
        )
    }

    static var twitterIcon: Node {
        .a(
            .href("https://twitter.com/galdineris/"),
            .class("socials_item_link"),
            .target(.blank),
            .i(.class("fab fa-twitter-square"))
        )
    }
    
    static var gallifreyanSVG: Node {
        return Node<HTML.BodyContext>.raw(##"<svg aria-hidden="true" data-prefix="fab" data-icon="github" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000" data-fa-i2svg=""><defs/><g><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 950 500 A 450 450 0 1 1 949.9997750000188 499.55000007499973" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 433.70613204139687 900.3892045454545 A 187.5 187.5 0 1 1 687.0784499054821 712.4340308387277" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 687.0784499054821 737.5659691612723 A 187.5 187.5 0 0 1 566.2938679586032 900.3892045454545" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 433.70613204139687 900.3892045454545 A 73.125 73.125 0 0 1 566.2938679586032 900.3892045454545" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="currentColor" paint-order="stroke fill markers" d=" M 476.66337888843077 881.1465626502805 A 4.875 4.875 0 1 1 476.66337645093097 881.1416876510931"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 504.875 873.75 A 4.875 4.875 0 1 1 504.8749975625002 873.7451250008125"/><path fill="#000000" stroke="currentColor" paint-order="stroke fill markers" d=" M 533.0866211115692 881.1465626502805 A 4.875 4.875 0 1 1 533.0866186740694 881.1416876510931"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 660.1242444888462 871.0617444888462 A 14.0625 14.0625 0 1 1 660.1242374575968 871.04768199119" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 687.078449905482 737.5659691612723 A 56.25 56.25 0 1 1 687.078449905482 712.4340308387277" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 674.4375 725 A 14.0625 14.0625 0 1 1 674.4374929687506 724.9859375023437" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 514.0625 537.5 A 14.0625 14.0625 0 1 1 514.0624929687506 537.4859375023437" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 430 725 A 56.25 56.25 0 1 1 429.99997187500236 724.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 410.55166996906354 699.8787267502919 A 4.875 4.875 0 1 1 410.55166753156374 699.8738517511044"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 419.25 725 A 4.875 4.875 0 1 1 419.2499975625002 724.9951250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 410.55166996906354 750.1212732497081 A 4.875 4.875 0 1 1 410.55166753156374 750.1163982505207"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 487.4340308387277 462.07844990548205 A 187.5 187.5 0 0 1 487.4340308387277 87.92155009451795" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 512.5659691612723 87.92155009451795 A 187.5 187.5 0 0 1 512.5659691612723 462.07844990548205" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 487.4340308387277 462.07844990548205 A 56.25 56.25 0 1 1 512.5659691612723 462.07844990548205" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 514.0625 435.375 A 14.0625 14.0625 0 1 1 514.0624929687506 435.36093750234375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 682.5 275 A 56.25 56.25 0 1 1 682.4999718750023 274.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 599.1983300309365 300.12127324970805 A 4.875 4.875 0 1 1 599.1983275934367 300.11639825052055"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 590.5 275 A 4.875 4.875 0 1 1 590.4999975625002 274.9951250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 599.1983300309365 249.87872675029195 A 4.875 4.875 0 1 1 599.1983275934367 249.87385175110444"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 512.5659691612723 87.92155009451795 A 56.25 56.25 0 1 1 487.4340308387277 87.92155009451795" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 529.9962732497081 174.6766699690635 A 4.875 4.875 0 1 1 529.9962708122083 174.671794969876"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 504.875 183.375 A 4.875 4.875 0 1 1 504.8749975625002 183.3701250008125"/><path fill="#000000" stroke="none" paint-order="stroke fill markers" d=" M 479.75372675029195 174.6766699690635 A 4.875 4.875 0 1 1 479.75372431279214 174.671794969876"/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 514.0625 142.75 A 14.0625 14.0625 0 1 1 514.0624929687506 142.73593750234375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 430 275 A 56.25 56.25 0 1 1 429.99997187500236 274.943750009375" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 439.78072370375986 296.5259430705363 A 14.0625 14.0625 0 1 1 439.78071667251044 296.51188057288005" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 670.2401515505438 683.5173423565135 L 503.3866461464539 156.39860923789337" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 579.0912525436956 743.3904885437244 L 358.2059959712948 329.05965629520404" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 595.9125585656968 682.0622211798445 L 277.7586593221776 891.2911786556452" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/><path fill="none" stroke="currentColor" paint-order="fill stroke markers" d=" M 456.51344837406583 371.5711221072612 L 651.5500513434708 76.28714683433151" stroke-miterlimit="10" stroke-width="3.75" stroke-dasharray=""/></g></svg>"##)
    }
}
