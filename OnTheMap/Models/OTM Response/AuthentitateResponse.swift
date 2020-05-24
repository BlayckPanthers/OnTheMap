//
//  authentitace.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 19/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import Foundation

struct AuthenticateResponse: Codable {
    let account: Account?
    let session: Session?
    
    struct Account: Codable {
        let registered: Bool?
        let key: String?
    }

    struct Session: Codable {
        let id: String?
        let expiration: String?
    }
}



