//
//  ViewControllerSearcBarDelegate.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation
import UIKit
extension ViewController{
    //MARK: SEARCH BAR DELEGATES
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        let searchText  = searchBar.searchTextField.text ?? ""
        if searchText == ""{
            issearching = false
            tblCityListing.reloadData()
        }else{
            cityListFilter = self.cityList?.filter({(($0.city_name!).localizedCaseInsensitiveContains(searchText))}) ?? []
            issearching = true
            tblCityListing.reloadData()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchText  = searchBar.searchTextField.text ?? ""
        if searchText == ""{
            issearching = false
            tblCityListing.reloadData()
        }else{
            cityListFilter = self.cityList?.filter({(($0.city_name!).localizedCaseInsensitiveContains(searchText))}) ?? []
            issearching = true
            tblCityListing.reloadData()
        }
    }
   
}
