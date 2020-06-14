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
    let percentage: CGFloat
    let lineWidth: CGFloat
}

final class CircleScoreView: UIView {
    let imageInsets = UIEdgeInsets(top: 22, left: 22, bottom: 22, right: 22)
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
        drawCircle(
            inRect: rect,
            lineWidth: model.lineWidth,
            percent: 1.0,
            strokeColor: model.circleFillerColor)

        drawCircle(
            inRect: rect,
            lineWidth: model.lineWidth,
            percent: model.percentage,
            strokeColor: model.circleProgressColor)
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

    private func drawCircle(
        inRect rect: CGRect,
        lineWidth: CGFloat,
        percent: CGFloat,
        strokeColor: UIColor) {

        let startAngle = -CGFloat.pi / 2
        let endAngle = (-CGFloat.pi / 2) + (CGFloat.pi * 2 * percent)
        let circlePath = UIBezierPath(
            arcCenter: rect.center,
            radius: rect.width / 2 - lineWidth / 2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath

        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth

        layer.addSublayer(shapeLayer)
    }
}

extension CGRect {
    func by(insets: UIEdgeInsets) -> CGRect {
        return CGRect(
            x: origin.x + insets.left,
            y: origin.y + insets.top,
            width: width - insets.left - insets.right,
            height: height - insets.top - insets.bottom)
    }

    var center: CGPoint {
        return CGPoint(
            x: origin.x / 2 + width / 2,
            y: origin.y / 2 + height / 2)
    }
}
