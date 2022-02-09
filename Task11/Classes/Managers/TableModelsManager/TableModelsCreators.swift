//
//  TableModelsCreator.swift
//  Task11
//
//  Created by Tom on 27.10.2021.
//

import Foundation
import UIKit

//MARK: - Description: In this class I used Fabric method - protocol Creator is common for different creators (Rockets...Creator , Launches...Creator, Launchpads...Creator), so every creator has method getTableModels which return models for tableView

protocol Creator {
    init(decodedModel: Codable)
    func getTableModels() -> [TableModel]
}

enum ManagerError: Error{
    case canNotConvertDates
    
}
class RocketsTableModelCreator: Creator{
    
    var mainModel: RocketsJSON
    var modelsToReturn: [RocketTableEntity] = []
    
    required init(decodedModel: Codable) {
        mainModel = decodedModel as! RocketsJSON
    }
    
    func getTableModels() -> [TableModel]{
        for doc in mainModel.docs{
            let name = doc.name
            let firstLaunch = try! makeRequiredStringDateFromString(string: doc.firstLaunch) ?? "No date"
            let launchCost = makeRequiredCostStringFromString(cost: doc.launchCost)
            let success = makeRequiredSuccessString(success: doc.success)
            let imageArray = doc.flickrImages
            let imageURLString = imageArray.first!
            
            //print(doc.flickrImages)
            let id = doc.id
            
            let model = RocketTableEntity(name: name, firstLaunch: firstLaunch, launchCost: launchCost, success: success, mainImageUrl: imageURLString, id: id)
            modelsToReturn.append(model)
        }
        return modelsToReturn
    }
    
    func makeRequiredStringDateFromString(string:String)throws -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: string) else { throw  ManagerError.canNotConvertDates}
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let returnString = dateFormatter.string(from: date)
        return returnString
    }
    
    func makeRequiredCostStringFromString(cost:Double) -> String{
        return String(cost)+"$"
    }
    
    func makeRequiredSuccessString(success:Double) -> String{
        return String(success)+"%"
    }
}

class LaunchesTableModelCreator: Creator{
    
    var mainModel: LaunchesJSON
    var modelsToReturn: [LaunchTableEntity] = []
    
    required init(decodedModel: Codable) {
        mainModel = decodedModel as! LaunchesJSON
    }
    
    func getTableModels() -> [TableModel]{
        for doc in mainModel.docs{
            let name = doc.name
            let dateString = try? makeRequiredStringDateFromString(string: doc.dateString)
            let flightNumber = String(doc.flightNumber)
            let success = doc.success
            let imageURLString = doc.smallImageUrl
            let id = doc.id
            
            let model = LaunchTableEntity(name: name, dateString: dateString, flightNumber: flightNumber, success: success, imageURL: imageURLString, id: id)
            modelsToReturn.append(model)
        }
        return modelsToReturn
    }
    
    func makeRequiredStringDateFromString(string: String) throws -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: string) ?? Date()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let stringToReturn = dateFormatter.string(from: date)
        return stringToReturn
    }
}

class LaunchepadsTableModelCreator: Creator{
    
    var mainModel: LpJSON
    var modelsToReturn: [LpTableEntity] = []
    required init(decodedModel: Codable) {
        mainModel = decodedModel as! LpJSON
    }
    
    func getTableModels() -> [TableModel]{
        for doc in mainModel.docs{
            let name = doc.name
            let place = doc.place
            let status = doc.status
            let id = doc.id
            
            let model = LpTableEntity(name: name, place: place, status: status, id: id)
            
            modelsToReturn.append(model)
        }
        return modelsToReturn
    }
    
    
}
