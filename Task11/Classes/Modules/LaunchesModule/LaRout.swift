//
//  Rout.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation


protocol LaPresenterToRout: AnyObject{
    var rout: LaRouterToPresenter! {get set}
}
class LaRout: LaRouterToPresenter{
    var presenter: LaPresenterToRout?
}
