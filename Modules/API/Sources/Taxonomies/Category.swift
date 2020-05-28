

import Foundation

public final class Category {

    public var code = ""

    let parents = [String]()
    let children = [String]()

    public var mainName = "" // name in the language of the app, for sorting
    public var indexedNames = "" // all names concatenated, for search

}
