//
//  EndPoint.swift
//  iOS-Task Swift
//
//  Created by John Doe on 2021-12-25.
//

import Foundation


enum HTTPMethod: String{
    case get = "GET"
}

protocol EndPoint{
    var baseURL: String { get }
    var method: HTTPMethod { get }
}
