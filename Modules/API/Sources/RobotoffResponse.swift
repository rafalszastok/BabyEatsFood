
import ObjectMapper

class RobotoffQuestion: Mappable {
    var barcode = ""
    var type = ""
    var value = ""
    var question = ""
    var insightId = ""
    var insightType = ""
    var sourceImageUrl = ""

    required init?(map: Map) {}

    func mapping(map: Map) {
        barcode <- map[OFFJson.BarcodeKey]
        type <- map[OFFJson.TypeKey]
        value <- map[OFFJson.ValueKey]
        question <- map[OFFJson.QuestionKey]
        insightId <- map[OFFJson.InsightIdKey]
        insightType <- map[OFFJson.InsightTypeKey]
        sourceImageUrl <- map[OFFJson.SourceImageUrlKey]
    }
}

public final class RobotoffResponse: Mappable {
    var questions = [RobotoffQuestion]()

    public required init?(map: Map) {}

    public func mapping(map: Map) {
        questions <- map[OFFJson.QuestionsKey]
    }
}
