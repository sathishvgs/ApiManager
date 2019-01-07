//
//  ApiUrlRequest.swift
//  ApiManager
//
//  Created by Sathish on 03/01/19.
//  Copyright © 2019 Full. All rights reserved.
//

import Foundation
import Alamofire

// MARK: TargetType
protocol TargetType {
        
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod { get }
    
    /// The QueryParams used in the request
    var queryParams: Parameters? { get }
    
    /// The Params used in the request
    var params: Parameters? { get }
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
    
    /// The authHeaders to be used for Authorization
    var isAuthNeeded: Bool { get }
}


protocol ApiUrlRequest: URLRequestConvertible {}

extension ApiUrlRequest  {
    
    func mutableUrlRequest(baseUrl: String, path: String, method: Alamofire.HTTPMethod, queryParams: Parameters?, params: Parameters?, encoding: Alamofire.ParameterEncoding = JSONEncoding.default) throws -> URLRequest {
        
        guard let url = URL(string: baseUrl) else {
            throw ApiManagerError.illegalParam("Invalid URL!")
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        if let queryParams = queryParams {
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: queryParams)
        }
        
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: params)
    }
    
    func addRequestHeader(request: URLRequest, headers: [String: String]) -> URLRequest {
        
        var req = request
        
        headers.forEach { (key, value) in
            req.setValue(value, forHTTPHeaderField: key)
        }
        return req
    }
    
    func addAuthorizationHeader(request: URLRequest, accessToken: String) -> URLRequest {
        
        var req = request
        req.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        return req
    }
}
