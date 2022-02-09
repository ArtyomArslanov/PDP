//
//  Interactor.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

protocol LpInteractorToPresenter{
    var presenter: LpPresenterToInteractor? {get set}
}
class LpInteractor: LpInteractorToPresenter{
    var presenter: LpPresenterToInteractor?
    
    //toDo: fill with func and vars as other Interactors
}
