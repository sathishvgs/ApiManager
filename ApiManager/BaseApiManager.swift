//
//  AwBaseApiManager.swift
//  ApiManager
//
//  Created by Sathish on 03/01/19.
//  Copyright © 2019 Full. All rights reserved.
//

import Foundation
import Alamofire

public class BaseApiManager {
    
    var accessToken: String
    var apiMode: ApiMode = .development
    var apiVersion: String
    
    public init(accessToken: String, apiMode: ApiMode, apiVersion: String) {
        self.accessToken = accessToken
        self.apiMode = apiMode
        self.apiVersion = apiVersion
    }
}

// MARK: Request
extension BaseApiManager {

    func getApiUrl() -> String {
        return urlConstants(urlMode: apiMode).apiUrl
    }
    
    func getAccessToken() throws -> String {
        return accessToken
    }
    
    func makeRequest(request: URLRequestConvertible) -> DataRequest {
        return Alamofire.SessionManager.default.request(request)
    }
}

// MARK: Validation
extension BaseApiManager {
    
    func validateAccessToken() throws {
        guard !accessToken.isEmpty else {
            throw ApiManagerError.illegalParam("AccessToken Not Found!")
        }
    }
    
    func validateApiVersion() throws {
        
        guard !apiVersion.isEmpty else {
            throw ApiManagerError.illegalParam("ApiVersion Not Found!")
        }
    }
}
