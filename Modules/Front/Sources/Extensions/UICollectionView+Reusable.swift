//
// Created by Marcin Biolik on 11/07/2018.
// Copyright © 2018 DAZN. All rights reserved.
//

import UIKit

public extension UICollectionView {

    func dequeueReusableCell<T: UICollectionViewCell>(
        for indexPath: IndexPath,
        ofType cellType: T.Type = T.self,
        customIdentifier: String? = nil) -> T where T: ReusableView {

        let identifier = customIdentifier ?? cellType.identifier

        guard let cell = tryToDequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath) as? T else {

            register(
                cellType,
                forCellWithReuseIdentifier: identifier)

            return dequeueReusableCell(
                for: indexPath,
                ofType: cellType,
                customIdentifier: identifier)
        }

        return cell
    }

    func dequeueReusableCell<T: UICollectionViewCell>(
        for indexPath: IndexPath,
        ofType cellType: T.Type = T.self,
        customIdentifier: String? = nil) -> T where T: ReusableNibView {

        let identifier = customIdentifier ?? cellType.identifier

        guard let cell = tryToDequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath) as? T else {

            register(
                cellType.nib,
                forCellWithReuseIdentifier: identifier)

            return dequeueReusableCell(
                for: indexPath,
                ofType: cellType,
                customIdentifier: identifier)
        }

        return cell
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
        ofKind elementKind: String,
        for indexPath: IndexPath,
        ofType viewType: T.Type = T.self,
        customIdentifier: String? = nil) -> T where T: ReusableView {

        let identifier = customIdentifier ?? viewType.identifier

        guard let view = tryToDequeueReusableSupplementaryView(
            ofKind: elementKind,
            withReuseIdentifier: viewType.identifier,
            for: indexPath) as? T else {

            register(
                viewType,
                forSupplementaryViewOfKind: elementKind,
                withReuseIdentifier: identifier)

            return dequeueReusableSupplementaryView(
                ofKind: elementKind,
                for: indexPath,
                ofType: viewType,
                customIdentifier: identifier)
        }

        return view
    }

    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(
        ofKind elementKind: String,
        for indexPath: IndexPath,
        ofType viewType: T.Type = T.self,
        customIdentifier: String? = nil) -> T where T: ReusableNibView {

        let identifier = customIdentifier ?? viewType.identifier

        guard let view = tryToDequeueReusableSupplementaryView(
            ofKind: elementKind,
            withReuseIdentifier: identifier,
            for: indexPath) as? T else {

            register(
                viewType.nib,
                forSupplementaryViewOfKind: elementKind,
                withReuseIdentifier: viewType.identifier)

            return dequeueReusableSupplementaryView(
                ofKind: elementKind,
                for: indexPath,
                ofType: viewType,
                customIdentifier: identifier)
        }

        return view
    }
}
