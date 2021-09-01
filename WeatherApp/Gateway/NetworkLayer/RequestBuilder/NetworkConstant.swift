//
//  NetworkConstant.swift
//  WeatherApp
//
//  Created by Amr Saeed on 01/09/2021.
//


import Foundation
enum HTTPMethod: String {
    case get   = "GET"
}

// The header fields
enum HttpHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLanguage = "Accept-Language"
}

// The content type (JSON)
enum ContentType: String {
    case json = "application/json"
}
