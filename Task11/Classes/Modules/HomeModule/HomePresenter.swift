//
//  Presenter.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit
protocol HomePresenterToView{
    var view: HomeViewToPresenter? {get set}
    
    
    
}
protocol HomePresenterToInteractor: AnyObject{
    var interactor: HomeInteractorToPresenter? {get set}
}
protocol HomePresenterToRout: AnyObject{
    var rout: HomeRoutToPresenter? {get set}
}

class HomePresenter: HomePresenterToRout, HomePresenterToView, HomePresenterToInteractor{
    var rout: HomeRoutToPresenter?
    
    weak var view: HomeViewToPresenter?
    
    var interactor: HomeInteractorToPresenter?
    
    init(view:HomeViewToPresenter, interactor: HomeInteractorToPresenter, rout: HomeRoutToPresenter) {
        self.rout = rout
        self.interactor = interactor
        self.view = view
    }
    
    
}
