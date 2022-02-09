//
//  Rout.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

protocol RocketsPresenterToRout: AnyObject{
    var rout: RocketsRouterToPresenter? {get set}
}

class RocketsRout: RocketsRouterToPresenter{
    
    
    var presenter: RocketsPresenterToRout?
    
    
}
