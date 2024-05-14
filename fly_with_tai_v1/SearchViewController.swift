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
    
    
    
    @IBOutlet weak var flightTypeTextField: UITextField!
    
    @IBOutlet weak var departtureAirportField: UITextField!
    
    @IBOutlet weak var arrivaleAirportField: UITextField!
    
    @IBOutlet weak var cabinTypeField: UITextField!
    
    
    @IBOutlet weak var passengersField: UITextField!
    
    
    
    
    @IBAction func searchButtonOnClick(_ sender: Any)
    {
            
        
    }
    
    
       

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) 
    {
        if segue.identifier == "showResultsSegue",
           let destinationVC = segue.destination as? HomeViewController {
            destinationVC.departureId = departtureAirportField.text ?? ""
            destinationVC.arrivalId = arrivaleAirportField.text ?? ""
            destinationVC.outboundDate = "2024-06-13"
            destinationVC.returnDate = "2024-08-19"
            destinationVC.currency = "USD"
            destinationVC.hl = "en"
            destinationVC.apiKey = "74cccf42c85e59add4a78297ece78471a30b5d18d133e279605fcbee6b5d5be3"
        }
    }

    
    
    
    
    
    

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
    
    
    
    func configureButtons() 
    {
        
        departureDateButton.setImage(UIImage(systemName: "calendar"), for: .normal)

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



