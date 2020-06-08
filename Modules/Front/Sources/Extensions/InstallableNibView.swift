
import UIKit

public protocol InstallableNibView: ReusableNibView {}

public extension InstallableNibView where Self: UIView {

    func installNibContent() {
        let elements = Self.nib.instantiate(withOwner: self)
        for case let view as UIView in elements {
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.frame = bounds
            addSubview(view)
        }
    }
}
