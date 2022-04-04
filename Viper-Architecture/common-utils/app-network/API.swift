//
//  API.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 04/04/22.
//

import Foundation
import Moya

enum API {
    case restaurants(query: RestaurantRequest)
}

extension API: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: BASE_URL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .restaurants(_):
            return "restaurants.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var simpleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .restaurants(let query):
            return .requestParameters(parameters: ["page": ["number": query.number!, "size": query.size!], "minor_version": query.minorVersion!, "type": query.type!, "city_id": query.cityId!], encoding: URLEncoding.default)
            
        }
    }
    
    var headers: [String : String]? {
        var header = [String: String]()
        header["Content-Type"] = "application/json"
        header["X-HH-Language"] = "en-US"
        return header
    }
    
}
