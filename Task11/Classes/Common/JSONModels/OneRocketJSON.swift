

import Foundation

struct OneRocketJSON: Codable {
    var name: String?
    var description: String?
    //Overview
    var firstLaunch: String?
    var launchCost: Double?
    var success: Double?
    var mass: Double?
    var heigh: Double?
    var diameter: Double?
    var images: [String]?
    //Engines
    var type: String?
    var layout: String?
    var version: String?
    var enginesAmount: Int?
    var propellant1: String?
    var propellant2: String?
    //firstStage - fS
    var fSreusable: Bool?
    var fSEnginesAmount: Int?
    var fSFuelAmount: Double?
    var fSBurningTime: Int?
    var fSThrustSea: Int?
    var fSThrustVacuum: Int?
    //secondStage - sS
    var sSreusable: Bool?
    var sSEnginesAmount: Int?
    var sSFuelAmount: Double?
    var sSBurningTime: Int?
    var sSThrust: Int?
    //LandingLegs
    var legsAmount: Int?
    var legsMaterial: String?
    //materials
    var wikiURLString: String?
    
    enum OuterCodingKeys: String, CodingKey{
        case mass
        case height
        case diameter
        case secondStage
        case firstStage
        case engines
        case landingLegs = "landing_legs"
        case flickrImages = "flickr_images"
        case name
        case id
        case wikipedia
        case launchCost = "cost_per_launch"
        case success = "success_rate_pct"
        case firsLaunch = "first_flight"
        case description
        case type
    }
    enum MassCoding: String, CodingKey{
        case kg
    }
    enum HeightCoding: String, CodingKey{
        case meters
    }
    enum DiameterCoding: String, CodingKey{
        case meters
    }
    enum EnginesCoding: String, CodingKey{
        case type
        case version
        case layout
        case amount = "number"
        case propellant1 = "propellant_1"
        case propellant2 = "propellant_2"
    }
    enum FirstStageCoding: String, CodingKey{
        case thrustSea = "thrust_sea_level"
        case thrustVacuum = "thrust_vacuum"
        case reusable
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
    enum SecondStageCoding: String, CodingKey{
        case thrust
        case reusable
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }
    enum Thrust: String, CodingKey{
        case kN
    }
    enum LangingLegsCoding: String, CodingKey{
        case number
        case material
    }
    init(from decoder: Decoder) throws {
        let outerContainer = try? decoder.container(keyedBy: OuterCodingKeys.self)
        //MARK: - Overview part
        self.name = try (outerContainer?.decode(String.self, forKey: .name))
        self.description = try outerContainer?.decode(String.self, forKey: .description)
        self.firstLaunch = try outerContainer?.decode(String.self, forKey: .firsLaunch)
        self.launchCost = try outerContainer?.decode(Double.self, forKey: .launchCost)
        self.success = try outerContainer?.decode(Double.self, forKey: .success)
        //mass
        let massContainer = try outerContainer?.nestedContainer(keyedBy: MassCoding.self, forKey: .mass)
        self.mass = try massContainer?.decode(Double.self, forKey: .kg)
        //height
        let heightContatiner = try outerContainer?.nestedContainer(keyedBy: HeightCoding.self, forKey: .height)
        self.heigh = try heightContatiner?.decode(Double.self, forKey: .meters)
        //diameter
        let diameterContainer = try outerContainer?.nestedContainer(keyedBy: DiameterCoding.self, forKey: .diameter)
        self.diameter = try diameterContainer?.decode(Double.self, forKey: .meters)
        //MARK: - Images part
        self.images = try outerContainer?.decode([String].self, forKey: .flickrImages)
        //MARK: - Engines
        let enginesContainer = try outerContainer?.nestedContainer(keyedBy: EnginesCoding.self, forKey: .engines)
        self.type = try enginesContainer?.decode(String.self, forKey: .type)
        self.layout = try enginesContainer?.decode(String.self, forKey: .layout)
        self.version = try enginesContainer?.decode(String.self, forKey: .version)
        self.enginesAmount = try enginesContainer?.decode(Int.self, forKey: .type)
        self.propellant1 = try enginesContainer?.decode(String.self, forKey: .propellant1)
        self.propellant2 = try enginesContainer?.decode(String.self, forKey: .propellant2)
        //MARK: - Stage one
        let stageOneContainer = try outerContainer?.nestedContainer(keyedBy: FirstStageCoding.self, forKey: .firstStage)
        self.fSreusable = try stageOneContainer?.decode(Bool.self, forKey: .reusable)
        self.fSEnginesAmount = try stageOneContainer?.decode(Int.self, forKey: .engines)
        self.fSFuelAmount = try stageOneContainer?.decode(Double.self, forKey: .fuelAmount)
        self.fSBurningTime = try stageOneContainer?.decode(Int.self, forKey: .burnTime)
        //thrust sea
        let fSThrustSeaContainer = try stageOneContainer?.nestedContainer(keyedBy: Thrust.self, forKey: .thrustSea)
        self.fSThrustSea = try fSThrustSeaContainer?.decode(Int.self, forKey: .kN)
        //thrust vacuum
        let fSThrustVacuumContainer = try stageOneContainer?.nestedContainer(keyedBy: Thrust.self, forKey: .thrustVacuum)
        self.fSThrustVacuum = try fSThrustSeaContainer?.decode(Int.self, forKey: .kN)
        
        //MARK: - Stage two
        
        let stageTwoContainer = try outerContainer?.nestedContainer(keyedBy: SecondStageCoding.self, forKey: .secondStage)
        self.sSreusable = try stageTwoContainer?.decode(Bool.self, forKey: .reusable)
        self.sSEnginesAmount = try stageTwoContainer?.decode(Int.self, forKey: .engines)
        self.sSFuelAmount = try stageTwoContainer?.decode(Double.self, forKey: .fuelAmount)
        self.sSBurningTime = try stageTwoContainer?.decode(Int.self, forKey: .burnTime)
        //thrust
        let sSThrustContainer = try stageTwoContainer?.nestedContainer(keyedBy: Thrust.self, forKey: .thrust)
        self.sSThrust = try sSThrustContainer?.decode(Int.self, forKey: .kN)
        
        //MARK: - Landing legs
        
        let legsContainer = try outerContainer?.nestedContainer(keyedBy: LangingLegsCoding.self, forKey: .landingLegs)
        self.legsAmount = try legsContainer?.decode(Int.self, forKey: .number)
        self.legsMaterial = try legsContainer?.decode(String.self, forKey: .material)
        
        //Materials
        
        self.wikiURLString = try outerContainer?.decode(String.self, forKey: .wikipedia)
        
    }
    
    
}
