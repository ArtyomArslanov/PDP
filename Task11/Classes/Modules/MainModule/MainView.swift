//
//  MainView.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import UIKit

protocol MainViewToPresenter: AnyObject{
    var presenter: MainPresenterToView? {get set}
}

class MainView: UIViewController, MainViewToPresenter  {
    var presenter: MainPresenterToView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.showHomeTabController(onView: self)

    }
  
    

    
}
