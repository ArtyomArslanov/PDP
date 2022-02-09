//
//  CommonNavVC.swift
//  Task11
//
//  Created by Tom on 25.10.2021.
//

import UIKit

class CommonNavVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    private func hideNavigationBar(){
        self.isNavigationBarHidden = true
    }

}
