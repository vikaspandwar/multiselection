//
//  RefreshToken.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation
import UIKit
import Alamofire

typealias CompletionBlock = ([String : Any]) -> Void
typealias FailureBlock = ([String : Any]) -> Void
typealias ProgressBlock = (Double) -> Void

struct APIClient {
    
    enum ContentType : String {
        case applicationJson = "application/json"
        case textPlain = "text/plain"
        case form = "application/x-www-form-urlencoded"
    }
    
    static var manager = Alamofire.SessionManager.default
    static func postAuth( url : Api,
                          parameters  : [String : Any]  ,
                          method : HTTPMethod? = .get ,
                          contentType: ContentType? = .applicationJson,
                          authorization : (user: String, password: String)? = nil,
                          authorizationToken : Bool?  = nil,refreshToken : Bool?  = nil,
                          completionHandler: CompletionBlock? = nil,
                          failureHandler: FailureBlock? = nil){
        var headers : HTTPHeaders = [
            "cache-control": "no-cache"//,
        ]
        if contentType! == .applicationJson {
            if authorization != nil {
                if let authorization1 = authorization {
                    if let authorizationHeader = Request.authorizationHeader(user: authorization1.user, password: authorization1.password) {
                        headers[authorizationHeader.key] = authorizationHeader.value
                    }
                }
            }
        }
        if refreshToken == true{
            
        }else{
            if authorizationToken == true{
                
            }
        }
        let urlString = url.baseURl()
        print("******URL*****\(urlString) *****Parameters*****\(parameters)")
        var somString = ""
        let dictionary = parameters
        
        if let theJSONData = try?  JSONSerialization.data(
            withJSONObject: dictionary,
            options: .prettyPrinted
        ), let theJSONText = String(data: theJSONData,
                                    encoding: String.Encoding.utf8) {
            somString = theJSONText
        }
        
        let configuration = URLSessionConfiguration.background(withIdentifier: "com.fittingroom.newtimezone.Fitzz")
        configuration.timeoutIntervalForRequest = 60 * 60 * 00
        APIClient.manager = Alamofire.SessionManager(configuration: configuration)
        
        var encodeSting : ParameterEncoding = somString
        
        if method == .get || method == .post {
            encodeSting = URLEncoding.default
        }
        
        Alamofire.request(urlString, method: method!,parameters: parameters,encoding:encodeSting ,  headers:headers  )
            .responseJSON {
                response in
                
                switch (response.result) {
                case .success(let value):
                    if let responseData = value as? [String:Any]{
                        if let successCode = responseData["success"] as? Int{
                            if successCode == 498{
                                let error = [Param.error:CustomAlertMsg.someThingWentWorng ]
                                failureHandler?(error)
                            }else{
                                completionHandler!(value as! [String : Any] )
                            }
                        }
                    }
                case .failure(let error):
                    print(error)
                    let error = [Param.error:error.localizedDescription]
                    failureHandler?(error)
                }
            }
    }
}

extension String: ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
    
}
struct JSONArrayEncoding: ParameterEncoding {
    private let array: [Parameters]
    
    init(array: [Parameters]) {
        self.array = array
    }
    
    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        let data = try JSONSerialization.data(withJSONObject: array, options: [])
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        urlRequest.httpBody = data
        
        return urlRequest
    }
}
