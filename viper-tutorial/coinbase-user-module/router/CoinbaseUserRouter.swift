//
//  CoinbaseUserRouter.swift
//  viper-tutorial
//
//  Created by Kelvin Lee on 10/4/18.
//  Copyright © 2018 Kelvin Lee. All rights reserved.
//

import UIKit

class CoinbaseUserRouter: PresenterToRouterProtocol {
    static func createModule() -> CoinbaseUserViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CoinbaseUserViewController") as! CoinbaseUserViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = CoinbaseUserPresenter()
        let interactor: PresenterToInteractorProtocol = CoinbaseUserInteractor()
        let router:PresenterToRouterProtocol = CoinbaseUserRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToCoinbaseUserScreen(navigationConroller: UINavigationController) {
        let coinbaseUserModule = CoinbaseUserRouter.createModule()
        navigationConroller.pushViewController(coinbaseUserModule, animated: true)
    }
}
