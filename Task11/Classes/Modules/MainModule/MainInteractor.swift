//
//  Interactor.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit
protocol MainInteractorToPresenter: AnyObject{
    var presenter: MainPresenterToInteractor? {get set}
   
}
class MainInteractor: MainInteractorToPresenter{
    weak var presenter: MainPresenterToInteractor?
    
}
