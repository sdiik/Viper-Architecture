//
//  MovieProtocol.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 11/12/21.
//

import Foundation

protocol ViewToPresenterMovieProtocol:class {
    var view: PresenterToViewProtocol? { get set}
}

protocol PresenterToViewMovieProtocol:class {
    func onMovieResponseSuccess(movieModelArrayList: Array<MovieModel>)
    func onMovieResponseFailed(error: String)
}

protocol PresenterToRouterMovieProtocol {
    static func createMovieModule() -> MovieViewController
}

protocol PresenterToInteractorMovieProtocol: class {
    var presenter: InteractorToPresenterMovieProtocol? {get set}
    func fetchMovie()
}

protocol InteractorToPresenterMovieProtocol: class {
    func movieFetchSuccess(movieList: Array<MovieModel>)
    func movieFetchFailed()
}