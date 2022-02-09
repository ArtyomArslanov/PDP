

struct LaunchesJSON: Codable{
    var docs: [LaunchDoc]
}
struct LaunchDoc: Codable {
    
    var name: String
    var dateString: String
    var flightNumber: Int
    var success: Bool
    var smallImageUrl: String
    var id: String
    
    enum OuterKeys: String, CodingKey{
        case name
        case dateString = "date_utc"
        case flightNumber = "flight_number"
        case success
        case links
        case id
    }
    enum LinksKeys: String, CodingKey{
        case patch
    }
    enum ImageKeys: String, CodingKey{
        case small
    }
    init(from decoder: Decoder) throws {
        let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
        let linksContainer = try outerContainer.nestedContainer(keyedBy: LinksKeys.self, forKey: .links)
        let imageContainer = try linksContainer.nestedContainer(keyedBy: ImageKeys.self, forKey: .patch)
        
        self.smallImageUrl = try imageContainer.decode(String.self, forKey: .small)
        self.dateString = try outerContainer.decode(String.self, forKey: .dateString)
        self.flightNumber = try outerContainer.decode(Int.self, forKey: .flightNumber)
        self.id = try outerContainer.decode(String.self, forKey: .id)
        self.name = try outerContainer.decode(String.self, forKey: .name)
        self.success = try outerContainer.decode(Bool.self, forKey: .success)
    }
}
