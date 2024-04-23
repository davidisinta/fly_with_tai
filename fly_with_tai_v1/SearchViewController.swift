//
//  SearchViewController.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/23/24.
//



import UIKit

class SearchViewController: UIViewController {
    
    
    
    var departureDate:String?
    var arrivalDate:String?
    var flightType:String?
    var departureAirport:String?
    var arrivalAirport:String?
    var cabinType:String?
    var passengers:Int?
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    let datePicker = UIDatePicker()
    @IBOutlet weak var departureDateButton: UIButton!
    @IBAction func departureDateOnClick(_ sender: Any) 
    {
        print("departure button clicked")
        datePicker.isHidden = !datePicker.isHidden
    }
    
    
    
    @IBOutlet weak var returnDate: UIButton!
    
    @IBAction func returnDateOnClick(_ sender: Any) {
        
        print("arrival button clicked")
        datePicker.isHidden = !datePicker.isHidden
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func configureButtons() {
        // Configure departure date button
        departureDateButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        departureDateButton.addTarget(self, action: #selector(departureDateOnClick(_:)), for: .touchUpInside)
        
        // Configure return date button
        returnDate.setImage(UIImage(systemName: "calendar"), for: .normal)
        returnDate.addTarget(self, action: #selector(returnDateOnClick(_:)), for: .touchUpInside)
        
        // Set up date picker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact // or .inline
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        view.addSubview(datePicker)
        
        // Layout
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: departureDateButton.bottomAnchor, constant: 0.001),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Hide date picker initially
        datePicker.isHidden = true
    }

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.configureButtons()
        

                
    }
    

@objc func dateChanged() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    let dateString = dateFormatter.string(from: datePicker.date)
    print("Selected date: \(dateString)")
}
}



