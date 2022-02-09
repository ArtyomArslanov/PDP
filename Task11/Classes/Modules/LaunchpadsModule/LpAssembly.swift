//
//  Assembly.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit


class LpAssembly{
    static func assemble() -> LpViewToPresenter{
        let view = LpView()
        let rout = LpRout()
        let interactor = LpInteractor()
    
        let presenter = LpPresenter(rout: rout, view: view, interactor: interactor)
        
        rout.presenter = presenter
        interactor.presenter = presenter
        view.presenter = presenter
        
        view.setTabBarItem() // Call it for creating tabBarItem before displaying View
        
        
        return view
    }
    

}

