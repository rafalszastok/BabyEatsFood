//
//  ProductDetailsViewController.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import UIKit
import Kingfisher

final class ProductDetailsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!

    var viewModel: ProductDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
    }
}

extension ProductDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageUrl = viewModel.images[indexPath.row]
        let collectionViewCell: ProductDetailsImageCollectionViewCell =
            collectionView.dequeueReusableCell(for: indexPath)
        collectionViewCell.imageView.kf.setImage(with: imageUrl)
        return collectionViewCell
    }

}
