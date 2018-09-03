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

extension ThingPreviewViewController {
    
    @IBAction func previewLondPressed(_ sender: Any) {
        
        let alertContoller = UIAlertController.init(title: "Save to Photo Library", message:nil , preferredStyle: .actionSheet)
        
        let saveAction = UIAlertAction.init(title: "Save", style: .default) { [weak self] _ in
            
            guard let strongSelf = self else { return }
            guard let image = strongSelf.preview.image else { return }
            strongSelf.save(image: image)
        }
        
        alertContoller.addAction(saveAction)
        alertContoller.addAction(UIAlertAction.init(title: "Cancel", style: .cancel))
        present(alertContoller, animated: true) {}
    }
    
    func save(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_: didFinishSavingWithError: contextInfo:)), nil)
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        
        if let error = error {
            
            let alertContoller = UIAlertController(title: "Saving error", message: error.localizedDescription, preferredStyle: .alert)
            alertContoller.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertContoller, animated: true)
        } else {
            
            let alertContoller = UIAlertController(title: "Saved", message: "Image saved to the Photo Library", preferredStyle: .alert)
            alertContoller.addAction(UIAlertAction(title: "OK", style: .default))
            present(alertContoller, animated: true)
        }
    }
    
}
