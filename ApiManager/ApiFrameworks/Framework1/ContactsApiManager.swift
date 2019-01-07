////
////  ContactsApiManager.swift
////  ApiManager
////
////  Created by Sathish on 04/01/19.
////  Copyright © 2019 Full. All rights reserved.
////
//
//import Foundation
//import Alamofire
//
//public class ContactsApiManager: BaseApiManager {
//
//    public var targetRequest: TargetRequest?
//    
//    public override init(accessToken: String, apiMode: ApiMode, apiVersion: String) {
//        super.init(accessToken: accessToken, apiMode: apiMode, apiVersion: apiVersion)
//    }
//
//    public func fetchContacts(target: TargetRequest) throws -> DataRequest {
//
//        self.targetRequest = target
//        let urlRequest = try asURLRequest()
//        return makeRequest(request: urlRequest)
//    }
//}
//
//extension ContactsApiManager: ApiUrlRequest {
//
//    public func asURLRequest() throws -> URLRequest {
//
//        guard let target = self.targetRequest else {
//            throw ApiManagerError.illegalParam("Invalid TargetRequest!")
//        }
//
//        try validateApiVersion()
//
//        let path = getApiPath(subPath: target.path, version: apiVersion)
//        var request = try! mutableUrlRequest(baseUrl: getApiUrl(), path: path, method: target.method, queryParams: target.queryParams, params: target.params)
//
//        if let headers = target.headers {
//            request = addRequestHeader(request: request, headers: headers)
//        }
//
//        guard target.isAuthNeeded else {
//            return request
//        }
//
//        try validateAccessToken()
//        let requestWithAuth = addAuthorizationHeader(request: request, accessToken: accessToken)
//        return requestWithAuth
//    }
//
//    func getApiPath(subPath: String, version: String) -> String {
//        return "services/data/v\(version)/objects/"+subPath
//    }
//}
