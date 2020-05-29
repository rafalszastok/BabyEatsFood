

import Foundation
import ObjectMapper

public final class ProductsResponse: Mappable {
    var query = ""
    var totalProducts = 0
    var page = 0
    var pageSize = "0"
    var products = [Product]()
    var product: Product?

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        totalProducts <- map[OFFJson.CountKey]
        page <- map[OFFJson.PageKey]
        pageSize <- map[OFFJson.PageSizeKey]
        products <- map[OFFJson.ProductsKey]
        product <- map[OFFJson.ProductKey]
    }
}
