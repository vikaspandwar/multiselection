//
//  ViewControllerFunctionsExtension.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation
import UIKit
extension  ViewController{
    //MARK: FIRST LOAD FUNCTION
    func firstLoadData(){
        tblCityListing.register(UINib(nibName: "CityListingCell", bundle: nil), forCellReuseIdentifier: "CityListingCell")
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        model.delegate = self
        activityIndicator("Loading...")
        var param = [String:Any]()
        param["country_id"] = "101"
        model.apiCityList(parameters: param)
        self.issearching = false
        searchBar.searchTextField.clearButtonMode = .never
    }
    //MARK: ACTIVITY INDICATOR
    func activityIndicator(_ title: String) {
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title
        strLabel.font = .systemFont(ofSize: 14, weight: .medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 130, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        activityIndicator = UIActivityIndicatorView(style: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }
}
