//
//  RocketInfoEntity.swift
//  Task11
//
//  Created by Tom on 08.11.2021.
//

import Foundation

struct RocketScreenEntity: ScreenModel{
    var name: String?
    var description: String?
    //Overview
    var firstLaunch: String?
    var launchCost: String?
    var success: String?
    var mass: String?
    var heigh: String?
    var diameter: String?
    var images: [URL]?
    //Engines
    var type: String?
    var layout: String?
    var version: String?
    var enginesAmount: Int?
    var propellant1: String?
    var propellant2: String?
    //firstStage - fS
    var fSreusable: String?
    var fSEnginesAmount: Int?
    var fSFuelAmount: String?
    var fSBurningTime: String?
    var fSThrustSea: String?
    var fSThrustVacuum: String?
    //secondStage - sS
    var sSreusable: String?
    var sSEnginesAmount: Int?
    var sSFuelAmount: String?
    var sSBurningTime: String?
    var sSThrust: String?
    //LandingLegs
    var legsAmount: Int?
    var legsMaterial: String?
    //materials
    var wikiURLString: URL?
    
    init() {
        
    }
    mutating func setMain(name: String?, description: String?){
        self.name = name
        self.description = description
    }
    mutating func setOverview(firstLaunch: String?,launchCost: String?, success: String?, mass: String?, heigh: String?, diameter: String?, images: [URL]?){
        self.firstLaunch = firstLaunch
        self.launchCost = launchCost
        self.success = success
        self.mass = mass
        self.heigh = heigh
        self.diameter = diameter
        self.images = images
    }
    mutating func setEngines(type: String?, layout: String?, version: String?, enginesAmount: Int?, propellant1: String?, propellant2: String? ){
        self.type = type
        self.layout = layout
        self.version = version
        self.enginesAmount = enginesAmount
        self.propellant1 = propellant1
        self.propellant2 = propellant2
    }
    mutating func setFirstStage(fSreusable: String?, fSEnginesAmount: Int?, fSFuelAmount: String?, fSBurningTime: String?, fSThrustSea: String?, fSThrustVacuum: String?){
        self.fSreusable = fSreusable
        self.fSEnginesAmount = fSEnginesAmount
        self.fSFuelAmount = fSFuelAmount
        self.fSBurningTime = fSBurningTime
        self.fSThrustSea = fSThrustSea
        self.fSThrustVacuum = fSThrustVacuum
    }
    mutating func setSecondStage(sSreusable: String?,
                        sSEnginesAmount: Int?,
                        sSFuelAmount: String?,
                        sSBurningTime: String?,
                        sSThrust: String?){
        self.sSreusable = sSreusable
        self.sSEnginesAmount = sSEnginesAmount
        self.sSFuelAmount = sSFuelAmount
        self.sSBurningTime = sSBurningTime
        self.sSThrust = sSThrust
    }
    mutating func setLandingLegs(legsAmount: Int?, legsMaterial: String?){
        self.legsAmount = legsAmount
        self.legsMaterial = legsMaterial
    }
    mutating func setMaterials(wikiString: URL?){
        self.wikiURLString = wikiString
    }
}
