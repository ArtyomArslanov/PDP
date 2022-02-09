//
//  Presenter.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit
protocol MainPresenterToInteractor: AnyObject {
    var interactor: MainInteractorToPresenter? {get set}
}
protocol MainPresenterToView: AnyObject {
    var view: MainViewToPresenter? {get set}
    func showHomeTabController(onView view: MainViewToPresenter)
}

protocol MainPresenterToRout: AnyObject {
    var rout: MainRoutToPresenter? {get set}
}

class MainPresenter: MainPresenterToRout, MainPresenterToView, MainPresenterToInteractor{
    var rout: MainRoutToPresenter?
    weak var view: MainViewToPresenter?
    var interactor: MainInteractorToPresenter?
    
    init(rout: MainRoutToPresenter, interactor: MainInteractorToPresenter, view: MainViewToPresenter) {
        
        self.rout = rout
        self.view = view
        self.interactor = interactor
    }
    
    func showHomeTabController(onView view: MainViewToPresenter){
        self.rout?.showHomeTabController(onView: view)
    }
}
