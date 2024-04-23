//
//  SearchViewController.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/23/24.
//



import UIKit

class SearchViewController: UIViewController {

    let datePicker = UIDatePicker()
    @IBOutlet weak var departureDateButton: UIButton!
    @IBAction func departureDateOnClick(_ sender: Any) 
    {
        print("departure button clicked")
        datePicker.isHidden = !datePicker.isHidden
    }
    
    
    
    func configureButtons(){
        
        departureDateButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        departureDateButton.addTarget(self, action: #selector(departureDateOnClick(_:)), for: .touchUpInside)
        
        // Set up date picker
        datePicker.datePickerMode = .date
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



