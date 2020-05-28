

import Foundation

public final class IngredientsAnalysisConfig {
    public var code = ""
    public var type = ""
    public var icon = ""
    public var color = ""

    convenience init(code: String, type: String, icon: String, color: String) {
        self.init()

        self.code = code
        self.type = type
        self.icon = icon
        self.color = color
    }

}
