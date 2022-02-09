//
//  Interactor.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

protocol HomeInteractorToPresenter{
    var presenter: HomePresenterToInteractor? {get set}
}
class HomeInteractor: HomeInteractorToPresenter{
    var presenter: HomePresenterToInteractor?
}
