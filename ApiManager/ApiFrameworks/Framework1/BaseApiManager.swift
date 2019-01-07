////
////  AwBaseApiManager.swift
////  ApiManager
////
////  Created by Sathish on 03/01/19.
////  Copyright © 2019 Full. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//public class BaseApiManager {
//    
//    public var accessToken: String
//    public var apiMode: ApiMode = .development
//    public var apiVersion: String
//    
//    public init(accessToken: String, apiMode: ApiMode, apiVersion: String) {
//        self.accessToken = accessToken
//        self.apiMode = apiMode
//        self.apiVersion = apiVersion
//    }
//}
//
//// MARK: Request
//extension BaseApiManager {
//
//    public func getApiUrl() -> String {
//        return urlConstants(urlMode: apiMode).apiUrl
//    }
//    
//    public func getAccessToken() throws -> String {
//        return accessToken
//    }
//    
//    public func makeRequest(request: URLRequestConvertible) -> DataRequest {
//        return Alamofire.SessionManager.default.request(request)
//    }
//}
//
//// MARK: Validation
//extension BaseApiManager {
//    
//   public func validateAccessToken() throws {
//        guard !accessToken.isEmpty else {
//            throw ApiManagerError.illegalParam("AccessToken Not Found!")
//        }
//    }
//    
//    public func validateApiVersion() throws {
//        
//        guard !apiVersion.isEmpty else {
//            throw ApiManagerError.illegalParam("ApiVersion Not Found!")
//        }
//    }
//}
