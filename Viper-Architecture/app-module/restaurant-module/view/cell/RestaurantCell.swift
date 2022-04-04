//
//  RestaurantCell.swift
//  Viper-Architecture
//
//  Created by ahmad shiddiq on 11/12/21.
//

import Foundation
import Kingfisher
import UIKit

class RestaurantCell: UITableViewCell {
    @IBOutlet weak var nImageView: UIImageView!
    @IBOutlet weak var nTitle: UILabel!
    @IBOutlet weak var nDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with data: RestaurantResult?) {
        if let restaurant = data {
            nTitle.text = restaurant.attributes?.name
            nDescription.text = restaurant.attributes?.description
            guard let imageURL = restaurant.attributes?.cover?.square else { return }
            guard let url = URL(string: BASE_IMAGE_URL+imageURL) else { return }
            nImageView.kf.setImage(with: url)
        }
    }
}
