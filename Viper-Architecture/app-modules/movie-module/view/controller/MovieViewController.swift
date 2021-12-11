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
    
    var arrayList: Array<MovieModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        configTableView()
        registerTableCell()
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
        return cell
    }
}

