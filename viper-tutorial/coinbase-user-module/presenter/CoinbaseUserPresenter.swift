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
        
    }
    
    func showAnotherController(navigationController: UINavigationController) {
        
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
