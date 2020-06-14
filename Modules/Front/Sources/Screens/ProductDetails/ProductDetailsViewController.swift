//
//  ProductDetailsViewController.swift
//  API
//
//  Created by Rafal Szastok on 04/06/2020.
//

import Kingfisher
import UIKit

final class ProductDetailsViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backgroundProductView: UIView!

    @IBOutlet var healthScoreView: CircleScoreView!
    @IBOutlet var environmentScoreView: CircleScoreView!

    var viewModel: ProductDetailsViewModel!

    private var indexOfCellBeforeDragging = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = viewModel.title
        setupUI()
        setupCollectionView()
        setupScores()
    }

    private func setupUI() {
        backgroundProductView.layer.cornerRadius = 10
        backgroundProductView.layer.shadowRadius = 10
        backgroundProductView.layer.shadowColor = UIColor.systemGray2.cgColor
        backgroundProductView.layer.shadowOffset = CGSize.zero
        backgroundProductView.layer.shadowOpacity = 1.0
    }

    private func setupCollectionView() {

        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = collectionView.frame.size
        collectionViewFlowLayout.minimumInteritemSpacing = 0
        collectionViewFlowLayout.minimumLineSpacing = 0
        collectionViewFlowLayout.scrollDirection = .horizontal

        collectionView.collectionViewLayout = collectionViewFlowLayout
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func setupScores() {
        healthScoreView.model = CircleScoreModel(
            image: UIImage(named: "healthcare-and-medical"),
            circleProgressColor: ColorPalette.caribbeanGreen.asUIColor,
            circleFillerColor: ColorPalette.whisper.asUIColor,
            percentage: 0.95,
            lineWidth: 10)

        environmentScoreView.model = CircleScoreModel(
            image: UIImage(named: "world"),
            circleProgressColor: ColorPalette.brinkPink.asUIColor,
            circleFillerColor: ColorPalette.whisper.asUIColor,
            percentage: 0.35,
            lineWidth: 10)
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

extension ProductDetailsViewController: UICollectionViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        let pageWidth = view.frame.width
        let proportionalOffset = collectionView.contentOffset.x / pageWidth
        indexOfCellBeforeDragging = Int(round(proportionalOffset))
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Stop scrolling
        targetContentOffset.pointee = scrollView.contentOffset

        // Calculate conditions
        let pageWidth = view.frame.width
        let collectionViewItemCount = viewModel.images.count
        let proportionalOffset = collectionView.contentOffset.x / pageWidth
        let indexOfMajorCell = Int(round(proportionalOffset))
        let swipeVelocityThreshold: CGFloat = 0.5
        let hasEnoughVelocityToSlideToTheNextCell = indexOfCellBeforeDragging + 1 < collectionViewItemCount && velocity.x > swipeVelocityThreshold
        let hasEnoughVelocityToSlideToThePreviousCell = indexOfCellBeforeDragging - 1 >= 0 && velocity.x < -swipeVelocityThreshold
        let majorCellIsTheCellBeforeDragging = indexOfMajorCell == indexOfCellBeforeDragging
        let didUseSwipeToSkipCell = majorCellIsTheCellBeforeDragging && (hasEnoughVelocityToSlideToTheNextCell || hasEnoughVelocityToSlideToThePreviousCell)

        if didUseSwipeToSkipCell {
            // Animate so that swipe is just continued
            let snapToIndex = indexOfCellBeforeDragging + (hasEnoughVelocityToSlideToTheNextCell ? 1 : -1)
            let toValue = pageWidth * CGFloat(snapToIndex)
            UIView.animate(
                withDuration: 0.3,
                delay: 0,
                usingSpringWithDamping: 1,
                initialSpringVelocity: velocity.x,
                options: .allowUserInteraction,
                animations: {
                    scrollView.contentOffset = CGPoint(x: toValue, y: 0)
                    scrollView.layoutIfNeeded()
                },
                completion: nil)
        } else {
            // Pop back (against velocity)
            let indexPath = IndexPath(row: indexOfMajorCell, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
        }
    }
}
