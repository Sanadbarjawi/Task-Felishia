//
//  ContentServices.swift
//  task
//
//  Created by Macbook Pro on 2/7/19.
//  Copyright © 2019 Sanad Barjawi. All rights reserved.
//

import Foundation

class  MachineServices {
    
    private let helper = APIHelper()
    
    func getMachine(_ params: [String: Any], _ success: @escaping (MachineModel) -> Void, failure: @escaping (Error?) -> Void) {
        helper.getRequest(endPoint: URLPath.machine, parameters: params, headers: ["Authorization":"Basic YWRtaW5AYm9vdC5jb206YWRtaW4="]) { (result, error) in
            if error != nil {
                failure(error)
                return
            }
            
            guard let data = result else { 
                let error = NSError(domain: "data not found ", code: -1, userInfo: nil)
                failure(error)
                return
                
            }
            
            do {
                let machineModel = try JSONDecoder().decode(MachineModel.self, from: data)
                success(machineModel)
            } catch {
                failure(error)
            }
            
        }
    }
}
