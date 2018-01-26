//
//  APIRequestProtocol.swift
//  BalancemacOS
//
//  Created by Eli Pacheco Hoyos on 1/24/18.
//  Copyright © 2018 Balanced Software, Inc. All rights reserved.
//

import Foundation

public enum ApiRequestType {
    case accounts
    case transactions
}

public enum ApiRequestMethod: String {
    case get = "GET"
    case post = "POST"
    
    // These may be needed later
    case put = "PUT"
    case delete = "DELETE"
}

public enum ApiRequestDataFormat {
    // Always used for GET requests, can be used for POST requests when using "application/x-www-form-urlencoded" content type
    case urlEncoded
    
    // Can be used for POST requests
    case json
}

public enum ApiRequestEncoding {
    case none
    case hmacSha512
    case hmacSha256
}

public protocol APIAction {
    var host: String { get }
    var path: String { get }
    var url: URL? { get }
    var components: URLComponents { get }
    var type: ApiRequestType { get }
    var credentials: Credentials { get }

    init(type: ApiRequestType, credentials: Credentials)
}

extension APIAction {
    
    var query: String? {
        return components.query
    }
    
    var nonce: Int64 {
        return Int64(Date().timeIntervalSince1970 * 10000)
    }
    
}
