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
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
}

//MARK:- WeatherList
@objcMembers class weatherList: Object , Codable{
    dynamic var dt = 0
    dynamic var main: Main?
    dynamic var weather =  List<Weather>()
    
    
    override static func primaryKey() -> String? {
        return "dt"
    }
    
    convenience  init(dt: Int,main: Main ,weather: List<Weather> ) {
        self.init()
        self.dt = dt
        self.main = main
        self.weather = weather
    }
    
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dt = try container.decode(Int.self, forKey: .dt)
        self.main = try container.decode(Main.self, forKey: .main)
        let weathers = try container.decodeIfPresent([Weather].self, forKey: .weather) ?? [Weather()]
        self.weather.append(objectsIn: weathers)
    }

}


@objcMembers class Main: Object, Codable {
    dynamic var temp: Double = 0.0
    dynamic var feelsLike: Double = 0.0
    dynamic var tempMin: Double = 0.0
    dynamic var tempMax: Double = 0.0
    dynamic var humidity : Int = 0
    

    override static func primaryKey() -> String? {
        return "temp"
    }
    
    convenience  init(temp: Double,feelsLike: Double ,tempMin: Double,
                      tempMax: Double, humidity : Int) {
        self.init()
        self.temp = temp
        self.feelsLike = feelsLike
        self.tempMin = tempMin
        self.tempMax =  tempMax
        self.humidity  = humidity
    }
    
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp)
        self.feelsLike = try container.decode(Double.self, forKey: .feelsLike)
        self.tempMin = try container.decode(Double.self, forKey: .tempMin)
        self.tempMax  = try container.decode(Double.self, forKey: .tempMax )
        self.humidity = try container.decode(Int.self, forKey: .humidity)
       
    }
    
    
}


//MARK:- Weather
@objcMembers class Weather: Object, Codable{
    dynamic var id: Int = 0
    dynamic var main: String?
    dynamic var descr: String?
    dynamic var icon: String?
    
    private enum CodingKeys: String, CodingKey {
         case id
         case main
         case descr = "description"
         case icon
      }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience  init(id: Int,main: String ,descr: String,
                      icon: String) {
        self.init()
        self.id = id
        self.main = main
        self.descr = descr
        self.icon =  icon
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.descr = try container.decode(String.self, forKey: .descr)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.main = try container.decode(String.self, forKey: .main)
    }
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
