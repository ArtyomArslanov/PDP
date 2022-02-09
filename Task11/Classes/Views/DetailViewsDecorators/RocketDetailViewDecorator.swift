//
//  RocketDetailViewDecorator.swift
//  Task11
//
//  Created by Tom on 23.11.2021.
//



//This code is meant to cusomize out detail rocket view, which depends whether we have some data or no
// in addNewSubviewsWithModel will be added constrained views in code, will be added in future

import UIKit

protocol RocketViewProtocol: UIView {
}

protocol RocketDetailViewProtocol {
    func addNewSubviewsWithModel(model: RocketScreenEntity)
}


class RocketDetailView: UIView, RocketViewProtocol{
    
}

class RocketDetailDecorator: RocketDetailViewProtocol {
    
    var rocketView: RocketViewProtocol!
    
    init(rocketView: RocketViewProtocol){
        self.rocketView = rocketView
    }
    
    func addNewSubviewsWithModel(model: RocketScreenEntity) {
        
    }
    func getView() -> RocketViewProtocol {
        return rocketView
    }
}

class RocketDetailOverviewDecorator: RocketDetailDecorator {
    override func addNewSubviewsWithModel(model: RocketScreenEntity) {
        //set overview parameters
        
    }
}

class RocketDetailEnginesDecorator: RocketDetailDecorator {
    override func addNewSubviewsWithModel(model: RocketScreenEntity) {
        //set engines parameters
        
    }
}

class RocketDetailFirstStageDecorator: RocketDetailDecorator {
    override func addNewSubviewsWithModel(model: RocketScreenEntity) {
        //set FirstStage parameters
        
    }
}

class RocketDetailSecondStageDecorator: RocketDetailDecorator {
    override func addNewSubviewsWithModel(model: RocketScreenEntity) {
        //set SecondStage parameters
        
    }
}

class RocketDetailLandingLegsDecorator: RocketDetailDecorator {
    override func addNewSubviewsWithModel(model: RocketScreenEntity) {
        //set LandingLegs parameters
        
    }
}

class RocketDetailMaterialsDecorator: RocketDetailDecorator {
    override func addNewSubviewsWithModel(model: RocketScreenEntity) {
        //set Materials parameters
        
    }
}
