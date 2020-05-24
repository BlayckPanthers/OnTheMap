//
//  AuthenticateRequest.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 19/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import Foundation

struct AuthenticateRequest: Codable {
    let udacity: Credentials
    
    struct Credentials: Codable {
        let username: String?
        let password: String?
    }
}
