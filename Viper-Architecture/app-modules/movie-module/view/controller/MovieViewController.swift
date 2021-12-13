//
//  MovieViewController.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 11/12/21.
//

import Alamofire
import AlamofireImage
import UIKit

class MovieViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    var moviePresenter: ViewToPresenterMovieProtocol?
    var arrayList: Array<MovieModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        configTableView()
        registerTableCell()
        getMovie()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    private
    func setTitle() {
        self.title = "Movie-Module"
    }
    private
    func configTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    private
    func registerTableCell() {
        myTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    private
    func getMovie() {
        moviePresenter?.startFetchMovie()
        showProgressIndicator(view: self.view)
    }
}
extension MovieViewController: PresenterToViewMovieProtocol {
    func onMovieResponseSuccess(movieModelArrayList: Array<MovieModel>) {
        self.arrayList = movieModelArrayList
        self.myTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func onMovieResponseFailed(error: String) {
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        alert.present(alert, animated: true, completion: nil)
    }
}
extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayList.isEmpty {
            return UITableViewCell()
        } else {
            return self.tableView(tableView, cellForMovieAt: indexPath)
        }
    }
    func tableView(_ tableView: UITableView, cellForMovieAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        cell.mTitle.text = arrayList[indexPath.row].title
        cell.mDescription.text = arrayList[indexPath.row].brief
        
        AF.request(self.arrayList[indexPath.row].imagesource!).responseData { (response) in
            if response.error == nil {
                print(response.result)
                if let data = response.data {
                    cell.mImageView.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
}

