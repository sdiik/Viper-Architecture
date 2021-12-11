//
//  NoticeViewController.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 26/11/21.
//

import Foundation
import UIKit

class NoticeViewController: UIViewController {
    
    @IBOutlet weak var uiTableView: UITableView!
    
    var  noticeArrayList: Array<NoticeModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        registerTableViewCell()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    private
    func refreshTableView() {
        uiTableView.reloadData()
    }
    private
    func configTableView() {
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }
    private
    func registerTableViewCell() {
        
    }
}
extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArrayList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
