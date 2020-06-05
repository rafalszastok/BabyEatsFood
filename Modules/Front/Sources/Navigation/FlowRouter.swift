//
//  FlowRouter.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 04/06/2020.
//

import UIKit
import API
import Combine

final class FlowRouter {
    let window: UIWindow
    let mainServicesContainer = MainServicesContainer()
    var subscriptions = Set<AnyCancellable>()
    
    init(window: UIWindow) {
        self.window = window
        bind()
    }

    func presentHomePage() {
        window.rootViewController = HomeTabbarPresenter.make(with: mainServicesContainer)
        window.makeKeyAndVisible()
    }

    func present(product: Product) {
        let viewController = ProductDetailsPresenter.make(
            with: mainServicesContainer,
            product: product)
        window.rootViewController?.present(viewController, animated: true)
    }

    private func bind() {
        mainServicesContainer
            .homeNavigationService
            .productSelectedPublisher
            .sink(receiveValue: present(product:))
            .store(in: &subscriptions)
    }
}
