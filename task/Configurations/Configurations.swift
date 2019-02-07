//
//  Configurations.swift
//  task
//
//  Created by Macbook Pro on 2/7/19.
//  Copyright © 2019 Sanad Barjawi. All rights reserved.
//


import Foundation

// MARK: - Configurations

private struct Configuration {
    static var serverURL: String {
        return  "http://www.mocky.io/v2/"
    }
}

// MARK: - Paths Handling

protocol Endpoint {
    var path: String { get }
}

enum URLPath {
    // machine
    case machine
}

extension URLPath: Endpoint {
    var path: String {
        switch self {
        case .machine: return "\(Configuration.serverURL)5c5c46f13900005a18e05b90"
        }
    }
}
