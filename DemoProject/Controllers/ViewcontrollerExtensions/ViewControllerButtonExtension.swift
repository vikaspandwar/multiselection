//
//  ViewControllerButtonExtension.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation

extension ViewController {
    //MARK: BUTTON ACTION
    @IBAction func btnSelectAllAction(_ sender : Any){
        self.btnSelectAll.isSelected = !self.btnSelectAll.isSelected
        if btnSelectAll.isSelected == true{
            isselectedAll = true
            self.txtCitySelected.text = "All Selected"
            self.cityName.removeAll()
            for i in cityList ?? []{
                cityName.append(i.city_name ?? "")
            }
            self.tblCityListing.reloadData()
        }else{
            isselectedAll = false
            self.cityName.removeAll()
            self.tblCityListing.reloadData()
            self.txtCitySelected.text = cityName.joined(separator: ",")
        }
    }
}
