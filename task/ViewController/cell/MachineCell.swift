//
//  MachineCell.swift
//  task
//
//  Created by Macbook Pro on 2/7/19.
//  Copyright © 2019 Sanad Barjawi. All rights reserved.
//

import Foundation
import UIKit

class MachineCell:UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ipAddressLabel: UILabel!
    @IBOutlet weak var subnetMaskLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    func configure(_ machineModel: MachineModel.ContentModel?) {
        nameLabel.text = machineModel?.name
        ipAddressLabel.text = machineModel?.ipAddress
        subnetMaskLabel.text = machineModel?.ipSubnetMask
        statusView.backgroundColor = machineModel?.status?.statusValueEnum?.statusColor
    }
}
