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
    
    
    
    @IBOutlet weak var originStackView: UIStackView!
    
    @IBAction func searchButtonOnClick(_ sender: Any)
    {
            
        
    }
    
    func addBottomBorder(to stackView: UIStackView, withSpacing spacing: CGFloat) {
        let borderView = UIView()
        borderView.backgroundColor = .black  // Set the border color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(borderView)
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: spacing),  // Adjust spacing here
            borderView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),  // Align left
            borderView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),  // Align right
            borderView.heightAnchor.constraint(equalToConstant: 1)  // Border thickness
        ])
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
        // Add the bottom border with custom spacing below the stack view
        addBottomBorder(to: originStackView, withSpacing: 10)

    }
    

@objc func dateChanged() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    let dateString = dateFormatter.string(from: datePicker.date)
    print("Selected date: \(dateString)")
}
}



