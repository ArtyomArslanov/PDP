
import Foundation

struct RocketsJSON: Codable{
    var docs: [RocketDoc]
    
}

struct RocketDoc: Codable{
    var id: String
    var name: String
    var firstLaunch: String
    var launchCost: Double
    var success: Double
    var flickrImages: [String]
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case firstLaunch = "first_flight"
        case launchCost = "cost_per_launch"
        case success = "success_rate_pct"
        case flickrImages = "flickr_images"
    }
}
