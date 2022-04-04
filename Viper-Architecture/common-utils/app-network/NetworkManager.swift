//
//  NetworkManager.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 04/04/22.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    
    func fetchRestaurant(with query: RestaurantRequest, completion: @escaping (Result<RestaurantResponse, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func fetchRestaurant(with query: RestaurantRequest, completion: @escaping (Result<RestaurantResponse, Error>) -> ()) {
        request(target: .restaurants(query: query), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                print("---- response -----\(response.data)")
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    print("----results -----\(results)")
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            case  let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
