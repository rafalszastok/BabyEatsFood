//
//  SecondViewController.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 19/05/2020.
//  Copyright © 2020 Rafal Szastok. All rights reserved.
//

import OpenFoodFactsNetwork
import Kingfisher
import UIKit

final class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let viewController = PresentingViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+DispatchTimeInterval.seconds(5), execute: {
                [unowned viewController] in
                viewController.dismiss(animated: false, completion: nil)
            })
        })
    }
}

final class PresentingViewController: UIViewController {

    var equalizerArray: [AnimatedImageView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange

        for x in [50, 100, 150, 200, 250] {
            for y in [-50, -100, -150, -200, -250] {
                let frame = CGRect(x: x, y: y, width: 30, height: 30)
                let equalizer = AnimatedImageView()
                equalizer.translatesAutoresizingMaskIntoConstraints = false
                setup(equalizer: equalizer, frame: frame)
                equalizerArray.append(equalizer)
            }
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for equalizer in equalizerArray {
            equalizer.startAnimating()
        }
    }

    private func setup(equalizer: AnimatedImageView, frame: CGRect) {

        equalizer.needsPrescaling = false

        if let path = Bundle.main.path(
            forResource: "levels_light@3x",
            ofType: "gif") {
            equalizer.kf.setImage(with: URL(fileURLWithPath: path))
        }
        view.addSubview(equalizer)

        let x = frame.origin.x
        let y = frame.origin.y
        let height = frame.size.height
        let width = frame.size.width

        NSLayoutConstraint
            .activate([
                equalizer.heightAnchor.constraint(equalToConstant: height),
                equalizer.widthAnchor.constraint(equalToConstant: width),
                equalizer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: x),
                equalizer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: y)
            ])

        equalizer.isHidden = false
    }
}
