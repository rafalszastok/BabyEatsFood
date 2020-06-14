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

        drawRing(
            inRect: rect,
            lineWidth: model.lineWidth,
            strokeColor: model.circleFillerColor)

        drawProgress(
            inRect: rect,
            lineWidth: model.lineWidth,
            progress: model.progress,
            strokeColor: model.circleProgressColor)

        drawCircleAndValue(
            inRect: rect,
            progress: model.progress,
            scoreCircleSize: model.scoreCircleSize,
            lineWidth: model.lineWidth,
            circleProgressColor: model.circleProgressColor)
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

    private func drawProgress(
        inRect rect: CGRect,
        lineWidth: CGFloat,
        progress: CGFloat,
        strokeColor: UIColor) {

        let startAngle = -CGFloat.pi / 2
        let radius = rect.width / 2 - lineWidth / 2
        let circumference = radius * CGFloat.pi * 2

        let fixedProgress = progress - (lineWidth / circumference)
        let endAngle = (-CGFloat.pi / 2) + (CGFloat.pi * 2 * fixedProgress)

        let circlePath = UIBezierPath(
            arcCenter: rect.center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth

        layer.addSublayer(shapeLayer)
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

    private func drawLabel(
        inRect rect: CGRect,
        forProgress progress: CGFloat) {

        let valueAsString = String(Int(progress * 100))
        let textLayer = CATextLayer()
        textLayer.frame = rect
        textLayer.fontSize = 12
        textLayer.font = UIFont.systemFont(ofSize: 14)
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.string = valueAsString
        textLayer.alignmentMode = .center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.isWrapped = true
        layer.addSublayer(textLayer)

    }

    private func drawCircleAndValue(
        inRect rect: CGRect,
        progress: CGFloat,
        scoreCircleSize: CGSize,
        lineWidth: CGFloat,
        circleProgressColor: UIColor) {

        let progresAngle = CGFloat.pi * 2 * progress
        let radius = rect.width / 2 - lineWidth / 2
        let progresPosition = CGPoint(
            x: rect.center.x + sin(progresAngle) * radius,
            y: rect.center.y - cos(progresAngle) * radius)
        let progresRect = CGRect(center: progresPosition, size: scoreCircleSize)

        drawCircle(
            inRect: progresRect,
            fillColor: circleProgressColor,
            strokeColor: UIColor.white,
            lineWidth: 2)

        let labelRect = progresRect.inset(
            by: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        drawLabel(inRect: labelRect, forProgress: progress)
    }

    private func drawCircle(
        inRect rect: CGRect,
        fillColor: UIColor,
        strokeColor: UIColor,
        lineWidth: CGFloat) {

        let circlePath = UIBezierPath(ovalIn: rect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth

        layer.addSublayer(shapeLayer)
    }
}
