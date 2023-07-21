//
//  ProductDetailsImageCollectionViewCell.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 05/06/2020.
//

import UIKit

final class ProductDetailsImageCollectionViewCell: UICollectionViewCell, ReusableView {
    let imageView = UIImageView()

    private func setupUI() {

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        let constraints = [
            leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            topAnchor.constraint(equalTo: imageView.topAnchor),
            bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

}
