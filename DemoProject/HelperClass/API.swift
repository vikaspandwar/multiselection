//
//  API.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation
import AVFoundation
import SwiftUI


let baseUrl = "https://go2.life:4132/"

extension Api {
    func baseURl() -> String {
        return  baseUrl + self.rawValued()
    }
}
enum Api: Equatable {
    case cityList
    
    func rawValued() -> String {
        switch self {
        case .cityList:
            return "users/getCity"
        }
    }
}

func isSuccess(json : [String : Any]) -> Bool{
    if let isSucess = json["code"] as? Int {
        if isSucess == 200 {
            return true
        }
    }
    if let isSucess = json["success"] as? Int {
        if isSucess == 200 {
            return true
        }
    }
    if let isSucess = json["success"] as? Bool {
        if isSucess == true {
            return true
        }
    if let isSucess = json["status"] as? String {
        if isSucess == "200" {
            return true
        }
    }
    if let isSucess = json["success"] as? String {
        if isSucess == "200" {
            return true
        }
    }
    }
    return false
}

func message(json : [String : Any]) -> String{
    if let message = json["message"] as? String {
        return message
    }
    if let message = json["message"] as? [String:Any] {
        if let msg = message.values.first as? [String] {
            return msg[0]
        }
    }
    if let error = json["error"] as? String {
        return error
    }
    return " "
}

func isBodyCount(json : [[String : Any]]) -> Int{
    return json.count
}
