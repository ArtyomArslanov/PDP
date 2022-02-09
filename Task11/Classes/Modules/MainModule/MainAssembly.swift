//
//  Assembly.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation
import UIKit


class MainAssembly{
  
    static func assemble() -> MainView {
        let rout = MainRout()
        let view = MainView()
        let interactor = MainInteractor()
        
        let presenter = MainPresenter(rout: rout, interactor: interactor, view: view)
        
        view.presenter = presenter
        rout.presenter = presenter
        interactor.presenter = presenter
        return view
        
    }
}
