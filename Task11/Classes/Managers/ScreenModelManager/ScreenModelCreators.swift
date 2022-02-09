//
//  ScreenModelCreators.swift
//  Task11
//
//  Created by Tom on 09.11.2021.
//

import Foundation


protocol ScreenCreator {
    init(decodedModel: Codable)
    func getScreenModel() -> ScreenModel
}

class ConcreteRocketScreenCreator: ScreenCreator {
    var mainModel: OneRocketJSON
    required init(decodedModel: Codable) {
        self.mainModel = decodedModel as! OneRocketJSON
    }
    
    func getScreenModel() -> ScreenModel {
        var modelToReturn = RocketScreenEntity()
        modelToReturn.setMain(name: mainModel.name, description: mainModel.description)
        modelToReturn.setEngines(type: mainModel.type, layout: mainModel.layout, version: mainModel.version, enginesAmount: mainModel.enginesAmount, propellant1: mainModel.propellant1, propellant2: mainModel.propellant2)
        modelToReturn.setOverview(
            firstLaunch: try? self.makeRequiredStringDateFromString(string: mainModel.firstLaunch),
            launchCost: self.makeRequiredCostStringFromString(cost: mainModel.launchCost),
            success: self.makeRequiredSuccessString(success: mainModel.success) , mass: self.massString(mainModel.mass),
            heigh: self.metersString(mainModel.heigh),
            diameter: self.metersString(mainModel.diameter),
            images: self.makeURLsFromArray(mainModel.images))
        modelToReturn.setFirstStage(
            fSreusable:self.makeReusableString(mainModel.fSreusable),
            fSEnginesAmount:mainModel.fSEnginesAmount,
            fSFuelAmount:self.makeFuelString(mainModel.fSFuelAmount),
            fSBurningTime:self.makeTimeString(mainModel.fSBurningTime),
            fSThrustSea:self.makeThrustString(mainModel.fSThrustSea),
            fSThrustVacuum:self.makeThrustString(mainModel.fSThrustSea))
        
        modelToReturn.setSecondStage(
            sSreusable:self.makeReusableString(mainModel.sSreusable),
            sSEnginesAmount:mainModel.sSEnginesAmount,
            sSFuelAmount:self.makeFuelString(mainModel.sSFuelAmount),
            sSBurningTime:self.makeTimeString(mainModel.sSBurningTime),
            sSThrust:self.makeThrustString(mainModel.sSThrust))
        
        modelToReturn.setLandingLegs(legsAmount: mainModel.legsAmount, legsMaterial: mainModel.legsMaterial)
        modelToReturn.setMaterials(wikiString: URL(string: mainModel.wikiURLString!))
        
        return modelToReturn
    }
    
    private func makeRequiredStringDateFromString(string:String?)throws -> String?{
        guard let string = string else {return nil}
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: string) else { throw  ManagerError.canNotConvertDates}
        dateFormatter.dateFormat = "MMMM d, yyyy"
        let returnString = dateFormatter.string(from: date)
        return returnString
    }
    
    private func makeRequiredCostStringFromString(cost:Double?) -> String?{
        if let cost = cost{
            return String(cost)+"$"
        }else{
            return nil
        }
    }
    
    private func makeRequiredSuccessString(success:Double?) -> String{
        if let success = success{
            return String(success)+"%"
        }else{
            return "0 %"
        }
        
    }
    private func metersString(_ value: Double?) -> String?{
        if let value = value{
            return "\(value) meters"
        }else{
            return nil
        }
        
    }
    private func massString(_ mass: Double?) -> String?{
        if let mass = mass{
            return "\(mass) kg"
        }else{
            return nil
        }
    }
    private func makeReusableString(_ bool:Bool?) -> String?{
        if let bool = bool, bool{
            return "Yes"
        }else{
            return "No"
        }
    }
    private func makeFuelString(_ amount: Double?) -> String?{
        if let amount = amount{
            return "\(amount) tons"
        }else{
            return nil
        }
       
    }
    private func makeTimeString(_ seconds: Int?) -> String?{
        if let seconds = seconds{
            return "\(seconds) seconds"
        }else{
            return nil
        }
    }
    private func makeThrustString(_ thrust: Int?) -> String?{
        if let thrust = thrust{
            return "\(thrust) kN"
        }else{
            return nil
        }
    }
    private func makeURLsFromArray(_ array:[String]?) -> [URL]?{
        if let array = array{
            var toReturn: [URL] = []
            array.forEach { (string) in
                guard let url = URL(string: string) else {return}
                toReturn.append(url)
            }
            return toReturn
        }else{
            return nil
        }
    }
    
}
