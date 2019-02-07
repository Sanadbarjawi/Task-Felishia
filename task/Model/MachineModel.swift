//
//  ContentModel.swift
//  task
//
//  Created by Macbook Pro on 2/7/19.
//  Copyright © 2019 Sanad Barjawi. All rights reserved.
//

import Foundation
import UIKit
// MARK :- status enum 
enum StatusValueEnum: String {
    case instanceStatusUp = "INSTANCE_STATE_UP"
    case instanceStatusChecked = "INSTANCE_STATE_CHECKING"
    case instanceStatusUnchecked = "INSTANCE_STATE_UNCHECKED"
    case unknown = "unknown"
    
    var statusColor: UIColor {
        switch self {
        case .instanceStatusUp:  return  UIColor.green 
        case .instanceStatusChecked: return UIColor.orange
        case .instanceStatusUnchecked: return UIColor.yellow
        case .unknown: return UIColor.red
        }
    }
}

// MARK :- Models nsted 
struct MachineModel: Decodable {
    
    var content : [ContentModel]?
    var first : Bool?
    var last : Bool?
    var number : Int?
    var numberOfElements : Int?
    var size : Int?
    var totalElements : Int?
    var totalPages : Int?
    
    struct ContentModel: Decodable {
        
        var id : Int?
        var ipAddress : String?
        var ipSubnetMask: String? 
        var location : Int?
        var name : String?
        var status : StatusModel?
        var type : TypeModel?
    }
    
    struct StatusModel: Decodable {
        
        var id : Int?
        var legacyValue : String?
        var statusValue : String?
        var statusValueEnum:StatusValueEnum? {
            get {
                return StatusValueEnum(rawValue: statusValue ?? "")
            }
        }
        
    }
    
    struct TypeModel: Decodable {
        
        var id : Int?
        var name : String?
        
    }
}

