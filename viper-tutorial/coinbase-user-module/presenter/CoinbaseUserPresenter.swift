//
//  CoinbaseUserPresenter.swift
//  viper-tutorial
//
//  Created by Kelvin Lee on 10/4/18.
//  Copyright © 2018 Kelvin Lee. All rights reserved.
//

import UIKit

class CoinbaseUserPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func startFetchingCoinbaseUser() {
        interactor?.fetchCoinbaseUser()
    }
    
    func showAnotherController(navigationController: UINavigationController) {
        router?.pushToCoinbaseAccountScreen(navigationConroller: navigationController)
    }
}

extension CoinbaseUserPresenter: InteractorToPresenterProtocol {
    func coinbaseUserFetchFailed() {
        view?.showError()
    }
    
    func coinbaseUserFetchedSuccess(coinbaseUserArray: Array<CoinbaseUser>) {
        view?.showCoinbaseUser(noticeArray: coinbaseUserArray)
    }
}
