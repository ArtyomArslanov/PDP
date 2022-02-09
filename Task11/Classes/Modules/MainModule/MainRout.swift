//
//  Rout.swift
//  Task11
//
//  Created by Tom on 21.10.2021.
//

import Foundation

import UIKit
protocol MainRoutToPresenter {
    var presenter: MainPresenterToRout? { get set }
    func showHomeTabController(onView view: MainViewToPresenter)
    
}
class MainRout: MainRoutToPresenter{
    weak var presenter: MainPresenterToRout?
    
    func showHomeTabController(onView view: MainViewToPresenter) {
        guard let viewVC = view as? UIViewController else { return }
        guard let homeTabBarView = getViewOfHomeModule() as? UITabBarController else {return}
        homeTabBarView.viewControllers = getTabViewControllers()
        homeTabBarView.modalPresentationStyle = .fullScreen
        viewVC.present(homeTabBarView, animated: true, completion: nil)
        
    }
    
    //MARK: - Private funcs
    private func getTabViewControllers() -> [UINavigationController]{
        guard let rocketsView = getViewOfRocketsModule() as? UINavigationController else {return []}
        guard let launchesView = getViewOfLaunchesModule() as? UINavigationController else {return []}
        guard let launchpadsView = getViewOfLaunchpadsModule() as? UINavigationController else {return []}
        return [rocketsView, launchesView, launchpadsView]
    }
    private func getViewOfHomeModule() -> HomeViewToPresenter{
        let homeViewToReturn = HomeAssembly.assemble()
        return homeViewToReturn
    }
    private func getViewOfLaunchesModule() -> LaViewToPresenter{
        return LaAssembly.assemble()
    }
    
    private func getViewOfLaunchpadsModule() -> LpViewToPresenter{
        return LpAssembly.assemble()
    }
    
    private func getViewOfRocketsModule() -> RocketsViewToPresenter{
        
        return RocketsAssembly.assemble()
        
    }
   
}
