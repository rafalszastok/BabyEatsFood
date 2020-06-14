//
//  CircleLayerFactory.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 14/06/2020.
//

import Foundation

enum CircleLayerFactory {

    static func makeRing(
        inRect rect: CGRect,
        lineWidth: CGFloat,
        strokeColor: UIColor) -> CAShapeLayer {

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

        return shapeLayer
    }

    static func makeLabel(
        inRect rect: CGRect,
        forProgress progress: CGFloat) -> CATextLayer {

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
        return textLayer

    }

    static func makeCircleAndValue(
        inRect rect: CGRect,
        progress: CGFloat,
        scoreCircleSize: CGSize,
        lineWidth: CGFloat,
        circleProgressColor: UIColor) -> CALayer {

        let progresAngle = CGFloat.pi * 2 * progress
        let radius = rect.width / 2 - lineWidth / 2
        let progresPosition = CGPoint(
            x: rect.center.x + sin(progresAngle) * radius,
            y: rect.center.y - cos(progresAngle) * radius)
        let progresRect = CGRect(center: progresPosition, size: scoreCircleSize)

        let layer = CALayer()

        let circleLayer = makeCircle(
            inRect: progresRect,
            fillColor: circleProgressColor,
            strokeColor: UIColor.white,
            lineWidth: 2)
        layer.addSublayer(circleLayer)

        let labelRect = progresRect.inset(
            by: UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0))
        let labelLayer = makeLabel(inRect: labelRect, forProgress: progress)
        layer.addSublayer(labelLayer)

        return layer
    }

    static func makeCircle(
        inRect rect: CGRect,
        fillColor: UIColor,
        strokeColor: UIColor,
        lineWidth: CGFloat) -> CAShapeLayer {

        let circlePath = UIBezierPath(ovalIn: rect)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth

        return shapeLayer
    }

    static func makeProgress(
        inRect rect: CGRect,
        lineWidth: CGFloat,
        progress: CGFloat,
        strokeColor: UIColor)
        -> CAShapeLayer {

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

//        for i in 1...100 {
//            var fixedProgress = progress - (lineWidth / circumference)
//            fixedProgress *= CGFloat(i) / 100.0
//            let endAngle = (-CGFloat.pi / 2) + (CGFloat.pi * 2 * fixedProgress)
//            DispatchQueue.main.asyncAfter(
//                deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(10*i),
//                execute: {
//                    let newCirclePath = UIBezierPath(
//                        arcCenter: rect.center,
//                        radius: radius,
//                        startAngle: startAngle,
//                        endAngle: endAngle,
//                        clockwise: true)
//                    shapeLayer.path = newCirclePath.cgPath
//                    shapeLayer.setNeedsLayout()
//            })
//        }

        shapeLayer.path = circlePath.cgPath
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth

        return shapeLayer
    }
}
