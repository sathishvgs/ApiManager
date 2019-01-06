//
//  RequestConstructer.swift
//  ApiManager
//
//  Created by Sathish on 03/01/19.
//  Copyright © 2019 Full. All rights reserved.
//

import Foundation
import Alamofire

public enum TargetRequest {
    
    case fetchCurrentUser
    case fetchContactSkillSets(apiKey: String, contactId: String)
    case fetchContact(accountId: String, contactId: String)
    case fetchContacts(accountId: String, contactIds: [String])
    case fetchContactsWith(accountId: String, cursor: String?)
    case searchContacts(accountId: String, queryType: DSContactQueryType, query: String, limit: Int, cursor: String?)
    case updateContact(contactId: String?, params: [String: Any])
}

extension TargetRequest: TargetType {
    
    var path: String {
        
        switch self {
        case .fetchCurrentUser:
            return ""
        case .fetchContactSkillSets:
            return ""
        case .fetchContact:
            return ""
        case .fetchContacts:
            return ""
        case .fetchContactsWith:
            return ""
        case .searchContacts:
            return ""
        case .updateContact:
            return ""
        }
    }
    
    var method: HTTPMethod {
        
        switch self {
        case .fetchCurrentUser, .fetchContactSkillSets, .fetchContactsWith, .searchContacts:
            return .get
        case .fetchContact, .fetchContacts:
            return .post
        case .updateContact:
            return .put
        }
    }
    
    var queryParams: Parameters? {
        
        var queryParams: Parameters = [:]
        
        switch self {
        case .fetchContactSkillSets(let apiKey, let contactId):
            queryParams = defaultQueryParam(apiKey: apiKey)
            queryParams["contactID"] = contactId
            
        case .fetchContact(let accountId, _):
            queryParams = defaultQueryParam(apiKey: accountId)
            
        case .fetchContacts(let accountId, _):
            var queryParams = defaultQueryParam(apiKey: accountId)
            queryParams["ignore"] = "deleted"
            
        case .fetchContactsWith(let accountId, let cursor):
            var queryParams = defaultQueryParam(apiKey: accountId)
            if let cursorValue = cursor {
                queryParams["cursor"] = cursorValue
            }
            queryParams["limit"] = 20
            
        case .searchContacts(let accountId, let queryType, let query, let limit, let cursor):
            var queryParams = defaultQueryParam(apiKey: accountId)
            if let cursorValue = cursor {
                queryParams["cursor"] = cursorValue
            }
            queryParams["queryType"] = queryType.type
            queryParams["queryString"] = query
            queryParams["limit"] = limit
            
        case .updateContact(let contactId, _):
            var queryParam: [String: Any]? = nil
            if let userId = contactId {
                queryParam = [:]
                queryParam?["userId"] = userId
            }
        default:
            return nil
        }
        return queryParams
    }
    
    var params: Parameters? {
        
        switch self {
            
        case .fetchContact( _, let contactId):
            return ["contact": [contactId]]
            
        case .fetchContacts(_, let contactIds):
            return ["contact": contactIds]
            
        case .updateContact(_, let params):
            return params
            
        default:
            return nil
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var isAuthNeeded: Bool {
        
        switch self {
        case .fetchCurrentUser, .updateContact :
            return true
        default:
            return false
        }
    }
}

extension TargetRequest {
    
    func defaultQueryParam(apiKey: String) -> Parameters {
        return ["apikey": apiKey]
    }
}

// MARK: QueryType
public enum DSContactQueryType {
    
    case contact
    case contactMethods
    
    var type: String {
        switch self {
        case .contact:
            return "contact"
        case .contactMethods:
            return "contactmethods"
        }
    }
}

