
public protocol ReusableView: AnyObject {

    static var identifier: String { get }
}

public extension ReusableView {

    static var identifier: String {
        return String(describing: self)
    }
}
