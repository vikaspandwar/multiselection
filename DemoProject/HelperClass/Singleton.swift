//
//  Singleton.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation

class Singleton: NSObject {
    static let shared = Singleton()
   
    var CityId = [String]()
    var CityName = [String]()
   
    private override init() {
        super.init()
    }
   
}
