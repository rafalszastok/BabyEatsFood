
import UIKit

public extension UITableView {

    func dequeueReusableCell<T: UITableViewCell>(ofType cellType: T.Type = T.self) -> T
        where T: ReusableView {

        guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier) as? T else {

            register(cellType, forCellReuseIdentifier: cellType.identifier)
            return dequeueReusableCell(ofType: cellType)
        }

        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(ofType cellType: T.Type = T.self) -> T
        where T: ReusableNibView {

        guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier) as? T else {

            register(cellType.nib, forCellReuseIdentifier: cellType.identifier)
            return dequeueReusableCell(ofType: cellType)
        }

        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(ofType viewType: T.Type = T.self) -> T
        where T: ReusableView {

        guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.identifier) as? T else {

            register(viewType, forHeaderFooterViewReuseIdentifier: viewType.identifier)
            return dequeueReusableHeaderFooterView(ofType: viewType)
        }

        return view
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(ofType viewType: T.Type = T.self) -> T
        where T: ReusableNibView {

        guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.identifier) as? T else {

            register(viewType.nib, forHeaderFooterViewReuseIdentifier: viewType.identifier)
            return dequeueReusableHeaderFooterView(ofType: viewType)
        }

        return view
    }
}
