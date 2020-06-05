//
//  ProductDetailsViewController.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import UIKit

final class ProductDetailsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    var viewModel: ProductDetailsViewModel!
}

extension ProductDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ProductImage",
            for: indexPath)
        return collectionViewCell
    }

}
