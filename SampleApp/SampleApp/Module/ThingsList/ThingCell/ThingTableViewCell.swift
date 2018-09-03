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

    var thumbnailDidPress: ((ThingViewModel) -> Void)?
    
    var viewModel: ThingViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(thumbnailTapped(_:)))
        tap.delegate = self
        thumbnail.addGestureRecognizer(tap)
    }
    
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
        
        self.thumbnailDidPress = nil
        self.viewModel.reset()
    }
    
    @objc func thumbnailTapped(_: Any) {
        
        self.thumbnailDidPress?(self.viewModel)
    }
}

