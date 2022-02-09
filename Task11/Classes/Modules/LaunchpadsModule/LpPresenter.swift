//
//  Presenter.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

protocol LpPresenterToView: AnyObject{
    var view: LpViewToPresenter? {get set}
}
protocol LpPresenterToInteractor: AnyObject{
    var interactor: LpInteractorToPresenter? {get set}
}
protocol LpPresenterToRout: AnyObject{
    var rout: LpRouterToPresenter? {get set}
}

class LpPresenter: LpPresenterToRout, LpPresenterToView, LpPresenterToInteractor{
    
    var interactor: LpInteractorToPresenter?
    var rout: LpRouterToPresenter?
    var view: LpViewToPresenter?

    
    init(rout: LpRouterToPresenter, view: LpViewToPresenter, interactor: LpInteractorToPresenter) {
        self.view = view
        self.rout = rout
        self.interactor = interactor
    }
}
