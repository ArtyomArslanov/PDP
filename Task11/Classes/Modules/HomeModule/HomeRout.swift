//
//  Rout.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

protocol HomeRoutToPresenter{
    var presenter: HomePresenterToRout? {get set}
}
class HomeRout: HomeRoutToPresenter{
    var presenter: HomePresenterToRout?
}
