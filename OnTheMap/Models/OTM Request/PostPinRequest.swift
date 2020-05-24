//
//  postPing.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 18/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import Foundation

struct PostPinRequest: Codable {
    let uniqueKey: String
    let firstName: String
    let lastName: String
    let mapString: String
    let mediaURL: String
    let latitude: Double
    let longitude: Double
}
