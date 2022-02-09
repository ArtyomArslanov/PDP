//
//  View.swift
//  Task11
//
//  Created by Tom on 22.10.2021.
//

import Foundation
import UIKit
protocol LpViewToPresenter {
    var presenter: LpPresenterToView? {get set}
}
class LpView: CommonNavVC, LpViewToPresenter{
    //MARK: - Properties
    var presenter: LpPresenterToView?
    
    
    //MARK: - Overriden funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
    }
    
    
    //MARK: - Public funcs
    func setTabBarItem(){
       self.tabBarItem = UITabBarItem(title: nil, image: Images.launchepadsItemImage, selectedImage: Images.launchepadsItemImageSelected)
       self.tabBarItem.title = "Launches"
       self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.tabBarItemTintColor], for: .normal)
       self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], for: .selected)
   }
    
    //MARK: - Private funcs
  
}
