//
//  CoinbaseUserProtocol.swift
//  viper-tutorial
//
//  Created by Kelvin Lee on 10/4/18.
//  Copyright © 2018 Kelvin Lee. All rights reserved.
//

import UIKit

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingCoinbaseUser()
    func showAnotherController(navigationController:UINavigationController)
}

protocol PresenterToViewProtocol: class {
    func showCoinbaseUser(noticeArray:Array<CoinbaseUser>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> CoinbaseUserViewController
    func pushToCoinbaseAccountScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchCoinbaseUser()
}

protocol InteractorToPresenterProtocol: class {
    func coinbaseUserFetchedSuccess(coinbaseUserArray:Array<CoinbaseUser>)
    func coinbaseUserFetchFailed()
}
