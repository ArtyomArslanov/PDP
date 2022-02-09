

struct LpJSON: Codable{
    var docs: [LpDoc]
}

struct LpDoc: Codable{
    var name: String
    var place: String
    var status: String
    var id: String
    
    enum OuterKeys: String, CodingKey{
        case name
        case status
        case place = "region"
        case id
    }
}
