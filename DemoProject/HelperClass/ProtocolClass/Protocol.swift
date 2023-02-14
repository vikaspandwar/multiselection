//
//  Protocol.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation

protocol ResponseProtocol {
    func onSucsses(msg:String,response:[String:Any])
    func onFailure(msg :String)
}
protocol SetTabbar {
    func isSucsses(Bool:Bool)
}
protocol ErrorMsg {
    func showErrorPopup()
}
