//
//  RestaurantResponse.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 04/04/22.
//

import Foundation

struct RestaurantResponse: Codable {
    let success: Bool?
    let message: String?
    let data: [RestaurantResult]?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
}

struct RestaurantResult: Codable {
    let id: String?
    let type: String?
    let attributes: RestaurantAttributes?
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case attributes
    }
}

struct RestaurantAttributes: Codable {
    let cuisine: String?
    let location: String?
    let description: String?
    let name: String?
    let cover: CoverType?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case location
        case description
        case name
        case cover
    }
}

struct CoverType: Codable {
    let square: String?
    
    enum CodingKeys: String, CodingKey {
        case square
    }
}
