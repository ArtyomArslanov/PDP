//
//  View.swift
//  Task11
//
//  Created by Tom on 22.10.2021.
//

import Foundation
import UIKit

protocol HomeViewToPresenter: AnyObject {
    var presenter: HomePresenterToView? {get set}
}
class HomeView: UITabBarController, HomeViewToPresenter{
    var presenter: HomePresenterToView?
   
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setBarColor()
        self.tabBar.itemPositioning = .fill
        self.view.backgroundColor = Colors.blueBackgroundColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
  //MARK: - Private funcs
    private func setBarColor(){
        tabBar.isTranslucent = false
        tabBar.barTintColor = Colors.blueBackgroundColor
         
        
    }
    
}
