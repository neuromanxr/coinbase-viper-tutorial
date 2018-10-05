//
//  CoinbaseUserViewController.swift
//  viper-tutorial
//
//  Created by Kelvin Lee on 10/4/18.
//  Copyright © 2018 Kelvin Lee. All rights reserved.
//

import UIKit

class CoinbaseUserViewController: UIViewController {
    
    weak var uiTableView: UITableView!
    
    var presentor:ViewToPresenterProtocol?
    var coinbaseUserArrayList:Array<CoinbaseUser> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presentor?.startFetchingCoinbaseUser()
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CoinbaseUserViewController: PresenterToViewProtocol {
    func showCoinbaseUser(noticeArray: Array<CoinbaseUser>) {
        self.coinbaseUserArrayList = noticeArray
        self.uiTableView.reloadData()
//        hideProgressIndicator(view: self.view)
    }
    
    func showError() {
        
    }
}

extension CoinbaseUserViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
