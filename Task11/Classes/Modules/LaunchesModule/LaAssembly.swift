//
//  Assembly.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit


class LaAssembly{
    static func assemble() -> LaViewToPresenter{
        let view = LaView()
        let rout = LaRout()
        let interactor = LaInteractor()
        
        let presenter = LaPresenter(rout: rout, view: view, interactor: interactor)
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
