////
////  ApiManager.swift
////  ApiManager
////
////  Created by Sathish on 04/01/19.
////  Copyright © 2019 Full. All rights reserved.
////
//
//import Foundation
//
//
//public class ApiManagerInternal: BaseApiManager {
//
//    public override init(accessToken: String, apiMode: ApiMode, apiVersion: String) {
//        super.init(accessToken: accessToken, apiMode: apiMode, apiVersion: apiVersion)
//    }
//    
//    public func contactsApiManager() -> ContactsApiManager {
//        return ContactsApiManager(accessToken: accessToken, apiMode: apiMode, apiVersion: apiVersion)
//    }
//}
//
//
////let apiManager = ApiManager(accessToken: "adfdf", apiMode: .live, apiVersion: "2.0")
////
////let contactsApi = apiManager.contactsApiManager()
////contactsApi.fetchContacts(target: .fetchCurrentUser)
