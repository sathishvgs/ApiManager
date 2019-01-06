//
//  AwConstants.swift
//  ApiManager
//
//  Created by Sathish on 03/01/19.
//  Copyright © 2019 Full. All rights reserved.
//

import Foundation

// MARK: FrameworkMode
public enum ApiMode {
    case live
    case development
}

// MARK: URL
struct urlConstants {
    
    let apiUrl: String

    init(urlMode: ApiMode) {
        
        switch urlMode {
        case .live:
            apiUrl = ""
        case .development:
            apiUrl = ""
        }
    }
}

// MARK: ERROR Respresentation
enum ApiManagerError: Error, CustomStringConvertible {
    case illegalParam(String)
    
    public var description: String {
        
        switch self {
        case .illegalParam(let error):
            return error.description
        }
    }
}
