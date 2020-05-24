//
//  OTMClient.swift
//  OnTheMap
//
//  Created by Fabien Lebon on 18/05/2020.
//  Copyright © 2020 Fabien Lebon. All rights reserved.
//

import Foundation

class OTMClient {
    
    enum RequestMethod: String {
        case POST = "POST"
        case PUT = "PUT"
    }
    
    struct Auth {
        static var sessionId = ""
        static var accountKey = ""
    }

    
    enum Endpoints {
        static let base = "https://onthemap-api.udacity.com/v1/"
        
        case getStudentList(String)
        case postStudentPin
        case putStudentPin(String)
        case authenticateOrDelete
        case getUser(String)
        
        var stringValue: String {
            switch self {
            case .getStudentList(let params): return Endpoints.base + "StudentLocation?\(params.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
            case .postStudentPin: return Endpoints.base + "StudentLocation/"
            case .putStudentPin(let studentId): return Endpoints.base + "StudentLocation/\(studentId)"
            case .authenticateOrDelete: return Endpoints.base + "session"
            case .getUser(let userId): return Endpoints.base + "users/\(userId)"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    
    class func taskForGetRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) {
        let task =  URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject,nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    class func taskForRequest<RequestType: Encodable, ResponseType: Decodable>(url: URL, method: RequestMethod, responsteType: ResponseType.Type, body: RequestType, completion: @escaping (ResponseType?, Error?) -> Void) {
        
        let requestBody = body
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! JSONEncoder().encode(requestBody)
        
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject,nil)
                }
            } catch {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
    
    class func getStudentLocation(params: String, completion: @escaping ([Pin], Error?) -> Void) {
        taskForGetRequest(url: Endpoints.getStudentList(params).url, responseType: StudentPinResponse.self , completion: {
            (response, error) in
            if let response = response {
                completion(response.results, nil)
            }
            else {
                completion([], error)
            }
        })
    }
}

