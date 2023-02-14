//
//  ViewController.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import UIKit
import UIKit
class ViewController: UIViewController,UISearchBarDelegate {
    
    //MARK: OUTLETS
    @IBOutlet weak var tblCityListing : UITableView!{
        didSet{
            self.tblCityListing.alpha = 1
        }
    }
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var btnSelectAll : UIButton!
    @IBOutlet weak var txtCitySelected : UITextView!{
        didSet{
            txtCitySelected.text = ""
            txtCitySelected.isEditable = false
        }
    }
    //MARK: VARIABLE
    var model = MainViewModel()
    var cityList : [CityModelClass]?
    var cityListFilter = [CityModelClass]()
    var issearching : Bool = false
    var cityName = [String]()
    var city = [String]()
    var isselectedAll : Bool = false
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLoadData()
    }
    
   

}

