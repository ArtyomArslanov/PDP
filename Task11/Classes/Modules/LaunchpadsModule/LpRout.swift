//
//  Rout.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

protocol LpRouterToPresenter{
    var presenter: LpPresenterToRout? {get set}
}
class LpRout: LpRouterToPresenter{
    var presenter: LpPresenterToRout?
}
