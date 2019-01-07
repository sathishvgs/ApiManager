//
//  NetworkStatus.swift
//  ApiManager
//
//  Created by Sathish on 07/01/19.
//  Copyright © 2019 Full. All rights reserved.
//

import Foundation

public enum States {
    case on
    case off
}


public class NetworkStatus {
    
   public var state: States
    
   public init(state: States) {
        self.state = state
        print("Network State has setted!")
    }
}
