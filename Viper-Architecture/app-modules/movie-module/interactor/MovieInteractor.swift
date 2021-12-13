//
//  MovieInteractor.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 11/12/21.
//

import Foundation
import Alamofire
import ObjectMapper

class MovieInteractor: PresenterToInteractorMovieProtocol {
    var presenter: InteractorToPresenterMovieProtocol?
    
    func fetchMovie() {
        AF.request(API_MOVIE_LIST).responseJSON { response in
            if (response.response?.statusCode == 200) {
                if let result = response.result as? [String: Any] {
                    if let correctArrayResponse = result["notice_list"] as? [String: Any] {
                        let arrayObject = Mapper<MovieModel>().mapArray(JSONObject: correctArrayResponse as! [[String: Any]])
                        self.presenter?.movieFetchSuccess(movieList: arrayObject!)
                    }
                }
            } else {
                self.presenter?.movieFetchFailed()
            }
        }
    }
}
