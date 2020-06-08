
import UIKit

public protocol ReusableNibView: AnyObject {

    static var identifier: String { get }
    static var nibBundle: Bundle { get }
    static var nibName: String { get }
}

public extension ReusableNibView {

    static var identifier: String {
        return String(describing: self)
    }

    static var nibBundle: Bundle {
        return Bundle(for: self)
    }

    static var nibName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(
            nibName: nibName,
            bundle: nibBundle)
    }
}

public extension ReusableNibView where Self: UIView {

    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
