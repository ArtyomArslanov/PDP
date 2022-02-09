//
//  Assembly.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit

protocol HomeAssemblyProtocol{
    
}

class HomeAssembly{
    
    static func assemble() -> HomeViewToPresenter{
        
        let rout = HomeRout()
        let view = HomeView()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, interactor: interactor, rout: rout)
        
        rout.presenter = presenter
        interactor.presenter = presenter
        rout.presenter = presenter
        
        return view
    }
    
}
