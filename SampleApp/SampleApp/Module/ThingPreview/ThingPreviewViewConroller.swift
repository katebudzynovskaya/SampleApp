//
//  ThingPreviewViewConroller.swift
//  SampleApp
//
//  Created by Kate on 9/3/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import Foundation
import UIKit

class ThingPreviewViewController: UIViewController {
    
    @IBOutlet weak var preview: UIImageView!
    
    var viewModel: ThingPreviewViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        self.viewModel?.preview?.startDownloading()
    }

    func bind() {
        self.viewModel?.preview?.didDownload = { [weak self] (image: UIImage) in
            self?.preview.image = image
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true) {}
    }
}
