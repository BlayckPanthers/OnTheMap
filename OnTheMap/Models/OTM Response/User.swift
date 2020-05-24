//
//  User.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 19/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import Foundation

struct User: Codable {
    let fisrtName: String?
    let lastName: String?
    let socialAccount: [String]?
    let mailingAdress: String?
    let cohortKey: [String]?
    let signature: String?
    let stripeCustomerId: String?
    let guardPermission: Guard?
    let facebookId: String?
    let timezone: String?
    let sitePreference: String?
    let occupation: String?
    let jabberId: String?
    let languages: String?
    let image: String?
    let badges: [String]?
    let location: String?
    let externalPassword: String?
    let principalAccount: [String]?
    let enrollments: [String]?
    let email: Mail?
    let websiteUrl: String?
    let externalAccounts: [String]?
    let bio: String?
    let coachingData: String?
    let tags: [String]?
    let affiliateProfiles: [String]?
    let hasPassword: Bool?
    let emailPreserence: MailPreference?
    let resume: String?
    let key: String?
    let nickName: String?
    let employerSharing: Bool?
    let memberships: [MemberShip]?
    let zendeskId: String?
    let registered: Bool?
    let linkedinUrl: String?
    let googleId: String?
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case fisrtName = "last_name"
        case lastName = "first_name"
        case socialAccount = "social_accounts"
        case mailingAdress = "mailing_address"
        case cohortKey = "_cohort_keys"
        case signature
        case stripeCustomerId = "_stripe_customer_id"
        case guardPermission = "guard"
        case facebookId = "_facebook_id"
        case timezone
        case sitePreference = "site_preferences"
        case occupation
        case jabberId = "jabber_id"
        case languages
        case image = "_image"
        case badges = "_badges"
        case location
        case externalPassword = "external_service_password"
        case principalAccount = "_principals"
        case enrollments = "_enrollments"
        case email
        case websiteUrl = "website_url"
        case externalAccounts = "external_accounts"
        case bio
        case coachingData = "coaching_data"
        case tags
        case affiliateProfiles = "_affiliate_profiles"
        case hasPassword = "_has_password"
        case emailPreserence = "email_preferences"
        case resume = "_resume"
        case key
        case nickName = "nickname"
        case employerSharing = "employer_sharing"
        case memberships = "_memberships"
        case zendeskId = "zendesk_id"
        case registered = "_registered"
        case linkedinUrl = "linkedin_url"
        case googleId = "_google_id"
        case imageUrl = "_image_url"
        
    }
    
    
}

struct Guard: Codable {
    let editable: Bool?
    let permissions: [Permission]?
    let allowedBehaviors: [String]?
    let subject: String?
    
    enum CodingKeys: String, CodingKey {
        case editable = "can_edit"
        case permissions
        case allowedBehaviors = "allowed_behaviors"
        case subject = "subject_kind"
    }
    
    struct Permission: Codable {
        let derivation: [String]?
        let behavior: String?
        let reference: Reference
        
        
        enum CodingKeys: String, CodingKey {
            case derivation
            case behavior
            case reference = "principal_ref"
        }
    }
}


struct Mail: Codable {
    let adress: String?
    let verified: Bool?
    let verifCodeSent: Bool?
    
    enum CodingKeys: String, CodingKey {
        case adress = "address"
        case verified = "_verified"
        case verifCodeSent = "_verification_code_sent"
    }
}


struct MailPreference: Codable {
    let userResearch: Bool?
    let masterOk: Bool?
    let courseOk: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userResearch = "ok_user_research"
        case masterOk = "master_ok"
        case courseOk = "ok_course"
    }
}

struct MemberShip: Codable {
    let current: Bool?
    let groupRef: Reference?
    let creationTime: String?
    let expirationTime: String?
    
    enum CodingKeys: String, CodingKey {
        case current
        case groupRef = "group_ref"
        case creationTime = "creation_time"
        case expirationTime = "expiration_time"
    }
}

struct Reference: Codable {
    let ref: String?
    let key: String?
}
