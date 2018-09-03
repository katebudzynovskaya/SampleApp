//
//  ViewController.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import UIKit

class ThingsListViewController: UITableViewController {

    var viewModel: ThingsListPagingViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        let service = APIServiceProvider()
        let imageCache = ImageCacheService(service: service)
        self.viewModel = ThingsListPagingViewModel(service: service, cache: imageCache)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 70
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.separatorStyle = .none
        self.tableView.accessibilityIdentifier = "things.list"
        
        bind()
        self.viewModel.loadPage()
    }

    func bind() {
        
        self.viewModel.didUpdate = { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.things.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThingTableViewCell", for: indexPath) as! ThingTableViewCell
        cell.accessibilityIdentifier = String(indexPath.row)
        
        let thingViewModel = self.viewModel.things[indexPath.row]
        
        cell.setup(viewModel: thingViewModel)
        cell.thumbnailDidPress = { [weak self] (viewModel: ThingViewModel) in
            
            self?.showPreview(viewModel: viewModel)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        viewModel.loadPageIfNeed(forRow: indexPath.row)
    }
}

extension ThingsListViewController {
    
    func showPreview(viewModel: ThingViewModel) {
        let previewViewController = storyboard?.instantiateViewController(withIdentifier: "ThingPreviewViewController") as? ThingPreviewViewController
        
        guard let preview = previewViewController else { return }
        preview.viewModel = ThingPreviewViewModel(thing: viewModel.thing, cache: self.viewModel.imageCache)
        
        present(preview, animated: true) {}
        
    }
}

