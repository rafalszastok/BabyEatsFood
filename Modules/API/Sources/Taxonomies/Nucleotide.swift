
import Foundation

public final class Nucleotide: Decodable {

    public var code = ""

    public var mainName = "" // name in the language of the app, for sorting
    public var indexedNames = "" // all names concatenated, for search
}
