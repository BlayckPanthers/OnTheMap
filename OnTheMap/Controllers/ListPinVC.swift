//
//  ListPinVC.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 18/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import UIKit

class ListPinVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        OTMClient.getStudentLocation(params: "limit=10&order=-updatedAt", completion: {
            (results, error) in
            
            PinModel.pins = results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PinModel.pins.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PinTableViewCell")!
        
        let pin = PinModel.pins[indexPath.row]
        
        cell.textLabel?.text = "\(pin.firstName!) - \(pin.lastName!)"
        
        return cell
    }

}
