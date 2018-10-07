//
//  CoinbaseUserInteractor.swift
//  viper-tutorial
//
//  Created by Kelvin Lee on 10/4/18.
//  Copyright © 2018 Kelvin Lee. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import p2_OAuth2

class CoinbaseUserInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?

    var sessionManager = SessionManager()
    var oauth2 = OAuthManager.shared.coinbaseOAuth2
    
    func fetchCoinbaseUser() {
        let retrier = OAuth2RetryHandler(oauth2: oauth2)
        sessionManager.adapter = retrier
        sessionManager.retrier = retrier
        
        let provider = MoyaProvider<CoinbaseServices>(manager: sessionManager)
        provider.request(.getUser) { (result) in
            debugPrint("get coinbase user:\(result)")
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let user = try filteredResponse.map(CoinbaseUser.self, atKeyPath: "data", using: decoder, failsOnEmptyData: false)
                    debugPrint("Coinbase user:\(user.name)")
                    self.presenter?.coinbaseUserFetchedSuccess(coinbaseUserArray: [user])
                }
                catch let error {
                    debugPrint("Coinbase user error:\(error)")
                }
            case let .failure(error):
                debugPrint("Coinbase user failure error:\(error)")
                break
            }
        }
        oauth2.logger = OAuth2DebugLogger(.trace)
    }
}
