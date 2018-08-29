//
//  ViewController.swift
//  SampleApp
//
//  Created by Kate on 8/29/18.
//  Copyright © 2018 aksvona. All rights reserved.
//

import UIKit

class ThingsListViewController: UITableViewController {

    var viewModel: ThingsListViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.viewModel = ThingsListViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.things.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThingTableViewCell", for: indexPath) as! ThingTableViewCell
        
        let thingViewModel = self.viewModel.things[indexPath.row]
        
        cell.titleLalel.text = thingViewModel.title
        cell.authorLabel.text = thingViewModel.author
        cell.dateLabel.text = thingViewModel.entryDate
        cell.commentsNumberLabel.text = thingViewModel.commentsNumber
        
        return cell
    }
}

