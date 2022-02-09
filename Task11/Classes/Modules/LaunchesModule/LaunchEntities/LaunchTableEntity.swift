//
//  LaunchEntity.swift
//  Task11
//
//  Created by Tom on 27.10.2021.
//

import Foundation

struct LaunchTableEntity: TableModel{
    var name: String
    var dateString: String
    var flightNumber: String
    var success: Bool
    var imageURL: URL?
    var id: String!
    
    init(name: String?, dateString: String?, flightNumber: String?, success: Bool, imageURL: String?, id: String){
        
        self.name = name ?? "Name"
        self.dateString = dateString ?? "No date"
        self.flightNumber = flightNumber ?? "0"
        self.success = success
        guard let url = imageURL else {return}
        self.imageURL = URL(string: url)
        self.id = id
    }
    
}
