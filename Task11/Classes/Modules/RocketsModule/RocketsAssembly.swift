//
//  Assembly.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit


class RocketsAssembly{
    static func assemble() -> RocketsViewToPresenter{
        let view = RocketsView()
        let rout = RocketsRout()
        let interactor = RocketsInteractor()
        
        let presenter = RocketsPresenter(rout: rout, view: view, interactor: interactor)
        view.presenter = presenter
        rout.presenter = presenter
        
        interactor.presenter = presenter
        interactor.networkManager = NetworkManager()
        interactor.tableDataManager = TableModelsForDecodedDataManager()
        interactor.screenDataManager = ScreenModelsForDecodedDataManager()
        
        view.setTabBarItem() // Call it for creating tabBarItem before displaying View

        return view
    }
    
 
}
