//
//  ViewControllerApiResponseExtension.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation


//MARK: API RESPONSE
extension ViewController:ResponseProtocol{
    
    func onSucsses(msg: String, response: [String : Any]) {
        self.effectView.removeFromSuperview()
        if msg == CustomAlertMsg.city{
            do {
                let jsondata = try JSONSerialization.data(withJSONObject: response["body"] ?? [] , options: .prettyPrinted)
                let encodedJson = try JSONDecoder().decode(cityModelClass.self, from: jsondata)
                self.cityList = encodedJson ?? []
                self.tblCityListing.alpha = 1
                self.tblCityListing.reloadData()
            }catch {
                
            }
        }
    }
    
    func onFailure(msg: String) {
    }
}
