//
//  CircleScoreView.swift
//  API
//
//  Created by Rafal Szastok on 13/06/2020.
//

import UIKit

struct CircleScoreModel {
    let image: UIImage?
    let circleProgressColor: UIColor
    let circleFillerColor: UIColor
    let progress: CGFloat
    let lineWidth: CGFloat
    let scoreCircleRadius: CGFloat

    var scoreCircleSize: CGSize {
        return CGSize(width: 2 * scoreCircleRadius, height: 2 * scoreCircleRadius)
    }
}

final class CircleScoreView: UIView {
    let imageInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    lazy var imageView = UIImageView()

    var model: CircleScoreModel? {
        didSet {
            setNeedsDisplay()
            imageView.image = model?.image
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let model = model else {
            return
        }

        let ringLayer = CircleLayerFactory.makeRing(
            inRect: rect,
            lineWidth: model.lineWidth,
            strokeColor: model.circleFillerColor)
        layer.addSublayer(ringLayer)

        let progressLayer = CircleLayerFactory.makeProgress(
            inRect: rect,
            lineWidth: model.lineWidth,
            progress: model.progress,
            strokeColor: model.circleProgressColor)
        layer.addSublayer(progressLayer)

        let valueLayer = CircleLayerFactory.makeCircleAndValue(
            inRect: rect,
            progress: model.progress,
            scoreCircleSize: model.scoreCircleSize,
            lineWidth: model.lineWidth,
            circleProgressColor: model.circleProgressColor)
        layer.addSublayer(valueLayer)
    }

    private func setup() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        let constraints = [
            imageView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: imageInsets.left),
            trailingAnchor.constraint(
                equalTo: imageView.trailingAnchor, constant: imageInsets.right),
            imageView.topAnchor.constraint(
                equalTo: topAnchor, constant: imageInsets.top),
            bottomAnchor.constraint(
                equalTo: imageView.bottomAnchor, constant: imageInsets.bottom)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func drawRing(
        inRect rect: CGRect,
        lineWidth: CGFloat,
        strokeColor: UIColor) {

        let radius = rect.width / 2 - lineWidth / 2

        let circlePath = UIBezierPath(
            arcCenter: rect.center,
            radius: radius,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth

        layer.addSublayer(shapeLayer)
    }
}
