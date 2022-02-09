//
//  LpTableEntity.swift
//  Task11
//
//  Created by Tom on 27.10.2021.
//

import Foundation

struct LpTableEntity: TableModel{

    let name: String
    let place: String
    let status: String
    let id: String
    
    init(name: String, place: String, status: String,id: String){
        self.name = name
        self.place = place
        self.status = status
        self.id = id
    }
}
