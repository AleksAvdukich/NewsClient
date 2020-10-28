//
//  NewsCell.swift
//  NewsClient
//
//  Created by Aleksandr Avdukich on 24.10.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var new: Article? { //почему при отсутствии ! жалуется что нужен инит??
        didSet {
            descriptionLabel.text = new?.articleDescription
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            dateLabel.text           = new?.publishedAt
            
            guard let url = URL(string: new?.urlToImage ?? "") else { return }
            
            newsImageView.sd_setImage(with: url, completed: nil)
        }
    }
}

