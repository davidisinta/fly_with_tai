//
//  FlightTableViewCell.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/18/24.
//

import UIKit


class FlightTableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var airlineLogo: UIImageView!
    @IBOutlet weak var airlineName: UILabel!
    @IBOutlet weak var flightPrice: UILabel!
    @IBOutlet weak var trackButton: UIButton!
    
    
    
    @IBOutlet weak var departureTime: UILabel!
    
    @IBOutlet weak var arrivalTime: UILabel!
    
    @IBOutlet weak var dapartureLocation: UILabel!
    
    @IBOutlet weak var arrivalLocation: UILabel!
    
    @IBOutlet weak var additionalInfo: UILabel!
    
    @IBAction func trackButtonOnClick(_ sender: Any) {
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
