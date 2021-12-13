//
//  MoviePresenter.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 13/12/21.
//

import Foundation

class MoviePresenter: ViewToPresenterMovieProtocol {
    var view: PresenterToViewMovieProtocol?
    
    var interactor: PresenterToInteractorMovieProtocol?
    
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchMovie() {
        interactor?.fetchMovie()
    }
    
}
extension MoviePresenter: InteractorToPresenterMovieProtocol {
    func movieFetchSuccess(movieList: Array<MovieModel>) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error Message from api response")
    }
}
