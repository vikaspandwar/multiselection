//
//  MainViewModel.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation
import CoreMedia

class MainViewModel {
    var delegate: ResponseProtocol?
    
    //MARK: CITY LIST API
    func apiCityList(parameters:[String:Any]){
        APIClient.postAuth(url: .cityList, parameters: parameters, method: .post, contentType: .applicationJson, authorizationToken: true) { (response) in
            print(response)
            if isSuccess(json: response) {
                self.delegate?.onSucsses(msg:CustomAlertMsg.city, response: response)
            }else{
                if let message = response[Param.message] as? String{
                    self.delegate?.onFailure(msg: message)
                }
            }
        } failureHandler: { (error) in
            print(error)
            if let error = error[Param.error] as? String{
                self.delegate?.onFailure(msg: error)
            }
        }
    }
   
    
}
