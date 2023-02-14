//
//  CityModelClass.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation

struct CityModelClass: Codable {
    var city_id,country_id: Int?
    var city_name: String?
}
typealias cityModelClass = [CityModelClass]?
