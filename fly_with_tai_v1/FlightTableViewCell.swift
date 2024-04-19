//
//  FlightTableViewCell.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/18/24.
//

import UIKit


class FlightTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var airlineLogo: UIImageView!
    
    
    
    
    @IBOutlet weak var flightPrice: UILabel!
    
    
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
