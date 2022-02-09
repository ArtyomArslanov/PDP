//
//  ModelsToTableDataManager.swift
//  Task11
//
//  Created by Tom on 27.10.2021.
//

import Foundation

protocol TableModel {
    
}

protocol TableModelsForDecodedDataManagerProtocol {
    func getTableModelsForDecodedModel(decodedModel: Codable, typeOfTable: TypeOfTable) throws -> [TableModel]
}

enum TypeOfTable{
    case Rockets
    case Launches
    case Launchpads
}


class TableModelsForDecodedDataManager: TableModelsForDecodedDataManagerProtocol{

    func getTableModelsForDecodedModel(decodedModel: Codable, typeOfTable: TypeOfTable) throws -> [TableModel]  {
        
        switch typeOfTable {
        case .Rockets:
            let concreteCreator = RocketsTableModelCreator(decodedModel: decodedModel)
            return concreteCreator.getTableModels()
        case .Launches:
            let concreteCreator = LaunchesTableModelCreator(decodedModel: decodedModel)
            return concreteCreator.getTableModels()
        case .Launchpads:
            let concreteCreator = LaunchesTableModelCreator(decodedModel: decodedModel)
            return concreteCreator.getTableModels()
        }
    }
    
}
    


