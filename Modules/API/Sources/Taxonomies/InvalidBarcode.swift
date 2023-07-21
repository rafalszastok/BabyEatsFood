

import Foundation

public final class InvalidBarcode {

    public var barcode = ""

    public convenience init(barcode: String) {
        self.init()
        self.barcode = barcode
    }

}
