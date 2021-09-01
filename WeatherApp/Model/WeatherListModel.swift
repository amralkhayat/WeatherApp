//
//  WeatherListModel.swift
//  WeatherApp
//
//  Created by Amr Saeed on 01/09/2021.
//

import Foundation
import RealmSwift
//MARK:- WeatherListModel
@objcMembers class WeatherListModel:  Object , Codable {
    
    dynamic var list = List<weatherList>()
    dynamic var city: City?
    dynamic var id = ""
    
    
    convenience init(list: List<weatherList> ,city: City ) {
        self.init()
        self.list = list
        self.city =  city
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(City.self, forKey: .city)
        let lists = try container.decodeIfPresent([weatherList].self, forKey: .list) ?? [weatherList()]
        self.list.append(objectsIn: lists)
    }
    
    
    private enum CodingKeys: String, CodingKey {
         case list
         case city
      }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}

//MARK:- City
@objcMembers class City: Object , Codable{
    dynamic var id: Int  = 0
    dynamic  var name: String?
    
    convenience  init(id: Int,name: String) {
        self.init()
        self.id = id
        self.name = name
    }
    
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    

    private enum CodingKeys: String, CodingKey {
         case id
         case name
      }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}




@objcMembers class weatherList: Object , Codable{
    
    
}


//// MARK: - TestTileModel
//struct TestTileModel: Codable {
//    let list: [List]
//    let city: City
//}
//
//// MARK: - City
//struct City: Codable {
//    let id: Int
//    let name: String
//}
//
//// MARK: - List
//struct List: Codable {
//    let dt: Int
//    let main: Main
//    let weather: [Weather]
//}
//
//// MARK: - Main
//struct Main: Codable {
//    let temp, feelsLike, tempMin, tempMax: Double
//    let humidity: Int
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike
//        case tempMin
//        case tempMax
//        case humidity
//    }
//}
//
//// MARK: - Weather
//struct Weather: Codable {
//    let id: Int
//    let main, weatherDescription, icon: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, main
//        case weatherDescription
//        case icon
//    }
//}
