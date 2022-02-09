//
//  ScreenModelsForDecoded.swift
//  Task11
//
//  Created by Tom on 09.11.2021.
//

import Foundation

protocol ScreenModel {
    
}

protocol ScreenModelsForDecodedDataManagerProtocol {
    func getScreenModelFrom(decodedModel: Codable, typeofScreen: TypeOfScreens) throws -> ScreenModel
}
enum TypeOfScreens{
    case Rocket
    case Launch
    case Launchpad
}

class ScreenModelsForDecodedDataManager: ScreenModelsForDecodedDataManagerProtocol {
    static var shared = ScreenModelsForDecodedDataManager()
    
    func getScreenModelFrom(decodedModel: Codable, typeofScreen: TypeOfScreens) throws -> ScreenModel{
        switch typeofScreen {
        case .Rocket:
            let concreteCreator = ConcreteRocketScreenCreator(decodedModel: decodedModel)
            return concreteCreator.getScreenModel()
            // in progress
        case .Launch:
            let concreteCreator = ConcreteRocketScreenCreator(decodedModel: decodedModel)
            return concreteCreator.getScreenModel()
        case .Launchpad:
            let concreteCreator = ConcreteRocketScreenCreator(decodedModel: decodedModel)
            return concreteCreator.getScreenModel()
        }
    }
}
