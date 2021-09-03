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
        self.city = try? container.decode(City.self, forKey: .city)
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
        self.name = try? container.decode(String.self, forKey: .name)
    }
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    private enum CodingKeys: String, CodingKey {
         case id
         case name
      }
    
}

//MARK:- WeatherList
@objcMembers class weatherList: Object , Codable{
    dynamic var dt = 0
    dynamic var  main: MainTemp?
    dynamic var weather =  List<Weather>()
    
    
    override static func primaryKey() -> String? {
        return "dt"
    }
    
    convenience  init(dt: Int,main: MainTemp ,weather: List<Weather> ) {
        self.init()
        self.dt = dt
        self.main = main
        self.weather = weather
    }
    
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.dt = try container.decode(Int.self, forKey: .dt)
        self.main = try? container.decode(MainTemp.self, forKey: .main)
        let weathers = try container.decodeIfPresent([Weather].self, forKey: .weather) ?? [Weather()]
        self.weather.append(objectsIn: weathers)
    }
    
    private enum CodingKeys: String, CodingKey {
         case dt
         case main
         case weather
      }

}


@objcMembers class MainTemp: Object, Codable {
    dynamic var temp: Double = 0.0

    convenience  init(temp: Double) {
        self.init()
        self.temp = temp

       
    }
    
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp)


    }
    
    private enum CodingKeys: String, CodingKey {
         case temp

      }
  
 
    
}


//MARK:- Weather
@objcMembers class Weather: Object, Codable{
    dynamic var id: Int = 0
    dynamic var descr: String?
    dynamic var icon: String?
    
    private enum CodingKeys: String, CodingKey {
         case id
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
        self.descr = descr
        self.icon =  icon
    }
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.descr = try? container.decode(String.self, forKey: .descr)
        self.icon = try? container.decode(String.self, forKey: .icon)

    }
    
    
  
}


