//
//  ViewController.swift
//  task
//
//  Created by Macbook Pro on 2/7/19.
//  Copyright © 2019 Sanad Barjawi. All rights reserved.
//

import UIKit

class MachineController: UIViewController {
    // MARK :- Outlets 
    @IBOutlet weak var machineTableView:UITableView!
    // MARK :- Vars 
    var machineModel = MachineModel()
    var machineServices:MachineServices!
    override func viewDidLoad() {
        super.viewDidLoad()
        machineServices = MachineServices()
        machineServices.getMachine(["page":0,"size":10], { (result) in
            self.machineModel = result
            self.machineTableView.reloadData()
        }, failure: { error in 
            
        })
    }
}

extension MachineController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (machineModel.content ?? []).count 
    } 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(MachineCell.self)") as? MachineCell else {
            return UITableViewCell()
        }
        if !(machineModel.content ?? [] ).isEmpty {
            cell.configure(machineModel.content?[indexPath.row])
        }
        return cell 
    }
}

