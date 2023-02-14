//
//  ViewControllerTableViewExtension.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import Foundation
import UIKit
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if issearching == true{
            return cityListFilter.count
        }else{
            return cityList?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblCityListing.dequeueReusableCell(withIdentifier: "CityListingCell", for: indexPath)as! CityListingCell
        if self.isselectedAll == true{
            if issearching == true{
                cell.lblCityName.text = cityListFilter[indexPath.row].city_name ?? ""
                if cityName.count == 0{
                    
                }else{
                    for index in cityName{
                        if index == self.cityListFilter[indexPath.row].city_name ?? ""{
                            cell.selectedCity = true
                            cell.imgCheckIcon.image = UIImage(named: "checkbox")
                        }else{
                            
                        }
                    }
                }
            }else{
                cell.lblCityName.text = cityList?[indexPath.row].city_name ?? ""
                for index in cityName{
                    if index == self.cityList?[indexPath.row].city_name ?? ""{
                        cell.selectedCity = true
                        cell.imgCheckIcon.image = UIImage(named: "checkbox")

                    }else{
                        
                    }
                }
            }
        }else{
            if issearching == true{
                cell.lblCityName.text = cityListFilter[indexPath.row].city_name ?? ""
                if cityName.count == 0{
                    cell.selectedCity = false
                    cell.imgCheckIcon.image = UIImage(named: "unchecked")
                }else{
                    for index in cityName{
                        if index == self.cityListFilter[indexPath.row].city_name ?? ""{
                            cell.selectedCity = true
                            cell.imgCheckIcon.image = UIImage(named: "checkbox")
                        }else{
                            
                        }
                    }
                }
            }else{
                cell.lblCityName.text = cityList?[indexPath.row].city_name ?? ""
                if cityName.count == 0{
                    cell.selectedCity = false
                    cell.imgCheckIcon.image = UIImage(named: "unchecked")
                }else{
                    for index in cityName{
                        if index == self.cityList?[indexPath.row].city_name ?? ""{
                            cell.selectedCity = true
                            cell.imgCheckIcon.image = UIImage(named: "checkbox")
                        }else{
                            
                        }
                    }
                }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tblCityListing.cellForRow(at: indexPath)as! CityListingCell
        if issearching == true{
            if cell.selectedCity == false{
                cityName.append("\(self.cityListFilter[indexPath.row].city_name ?? "")")
                self.txtCitySelected.text = cityName.joined(separator: ",")
                cell.imgCheckIcon.image = UIImage(named: "checkbox")
                if cityName.count == cityList?.count ?? 0{
                    self.btnSelectAll.isSelected = true
                }else{
                    self.btnSelectAll.isSelected = false
                }
                cell.selectedCity = true
            }else{
              
                for index in cityName{
                    if index == "\(self.cityListFilter[indexPath.row].city_name ?? "")"{
                        let indexOfA = cityName.firstIndex(of: index) // 0
                        cityName.remove(at: indexOfA ?? 0)
                    }
                }
                cell.imgCheckIcon.image = UIImage(named: "unchecked")
                self.txtCitySelected.text = cityName.joined(separator: ",")
                print("City name and Id -->",cityName)
                 cell.selectedCity = false
                self.btnSelectAll.isSelected = false
            }
        }else{
            if cell.selectedCity == false{
                cityName.append("\(self.cityList?[indexPath.row].city_name ?? "")")
                self.txtCitySelected.text = cityName.joined(separator: ",")
                cell.imgCheckIcon.image = UIImage(named: "checkbox")
                if cityName.count == cityList?.count ?? 0{
                    self.btnSelectAll.isSelected = true
                }else{
                    self.btnSelectAll.isSelected = false
                }
                cell.selectedCity = true
            }else{
                for index in cityName{
                    if index == "\(self.cityList?[indexPath.row].city_name ?? "")"{
                        let indexOfA = cityName.firstIndex(of: index) // 0
                        cityName.remove(at: indexOfA ?? 0)
                    }
                }
                self.txtCitySelected.text = cityName.joined(separator: ",")
                cell.imgCheckIcon.image = UIImage(named: "unchecked")
                self.btnSelectAll.isSelected = false
               cell.selectedCity = false
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
