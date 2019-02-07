//
//  Networking.swift
//  task
//
//  Created by Macbook Pro on 2/7/19.
//  Copyright © 2019 Sanad Barjawi. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkingCompletionHandler = (Data?, Swift.Error?) -> Void

protocol Networking {
    func postRequest(endPoint: Endpoint, parameters: Parameters?, headers: HTTPHeaders?, callback: @escaping NetworkingCompletionHandler)
    func getRequest(endPoint: Endpoint, parameters: Parameters?, headers: HTTPHeaders?, callback: @escaping NetworkingCompletionHandler)
}

extension Networking {
    // MARK :- main request 
    private func request(method: HTTPMethod, endPoint: Endpoint, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callback: @escaping NetworkingCompletionHandler) {
        guard let url = URL(string: endPoint.path) else {
            return
        }            
            
        Alamofire.request(url, method: method, parameters: parameters, headers: headers).validate(statusCode: 200...299)
            .responseData { resposne in
                
                callback(resposne.data, resposne.error)
        }
    }
     // MARK :- post request 
    func postRequest(endPoint: Endpoint, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callback: @escaping NetworkingCompletionHandler) {
        
        request(method: .post, endPoint: endPoint, parameters: parameters, headers: headers, callback: callback)
    }
    
    // MARK :- get request 
    func getRequest(endPoint: Endpoint, parameters: Parameters? = nil, headers: HTTPHeaders? = nil, callback: @escaping NetworkingCompletionHandler) {
        
        request(method: .get, endPoint: endPoint, parameters: parameters, headers: headers, callback: callback)
    }
  
}

struct APIHelper: Networking { }
