//
//  RocketTableEntity.swift
//  Task11
//
//  Created by Tom on 27.10.2021.
//

import Foundation


struct RocketTableEntity: TableModel{
  
    let mainImageUrl: URL
    let name: String
    let firstLaunch: String
    let launchCost: String
    let success: String
    let id: String
    
    init(name: String?, firstLaunch: String?, launchCost: String?, success: String?, mainImageUrl: String?, id: String){
        
        self.name = name ?? "Name"
        self.firstLaunch = firstLaunch ?? "No date"
        self.launchCost = launchCost ?? "0$"
        self.success = success ?? "0%"
        self.id = id
        let str = mainImageUrl!
        self.mainImageUrl = URL(string: str)!
        
    }
    
}
