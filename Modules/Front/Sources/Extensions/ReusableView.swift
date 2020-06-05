//
// Created by Marcin Biolik on 09/07/2018.
// Copyright © 2018 DAZN. All rights reserved.
//

public protocol ReusableView: AnyObject {

    static var identifier: String { get }
}

public extension ReusableView {

    static var identifier: String {
        return String(describing: self)
    }
}
