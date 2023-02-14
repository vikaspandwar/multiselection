//
//  CityListingCell.swift
//  DemoProject
//
//  Created by Vikas MacBook on 14/02/23.
//

import UIKit

class CityListingCell: UITableViewCell {

    @IBOutlet weak var lblCityName : UILabel!
    @IBOutlet weak var imgCheckIcon : UIImageView!
    var selectedCity = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
  
    
    
}
