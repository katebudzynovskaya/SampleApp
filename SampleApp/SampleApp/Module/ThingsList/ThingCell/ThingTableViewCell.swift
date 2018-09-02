//
//  ThingCellTableView.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation
import UIKit

class ThingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLalel: UILabel!
    @IBOutlet weak var commentsNumberLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!

    var viewModel: ThingViewModel!
    
    func setup(viewModel: ThingViewModel) {
        
        self.viewModel = viewModel
        
        self.titleLalel.text = viewModel.title
        self.authorLabel.text = viewModel.author
        self.dateLabel.text = viewModel.entryDate
        self.commentsNumberLabel.text = viewModel.commentsNumber
        
        self.thumbnail.image = viewModel.thumbnail?.image
        
        viewModel.thumbnail?.didDownload = { [weak self] (image: UIImage) in
            self?.thumbnail.image = image
        }
        
        viewModel.thumbnail?.startDownloading()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.viewModel.reset()
    }
}

