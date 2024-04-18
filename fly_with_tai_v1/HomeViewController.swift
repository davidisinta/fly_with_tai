//
//  HomeViewController.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/16/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5;
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 
    {
        
        let cell = UITableViewCell()

            // Configure the cell (i.e. update UI elements like labels, image views, etc.)
            // Get the row where the cell will be placed using the `row` property on the passed in `indexPath` (i.e., `indexPath.row`)
            cell.textLabel?.text = "Row \(indexPath.row)"

            // Return the cell for use in the respective table view row
            return cell
    
    }
    
    
    
    @IBOutlet weak var flightsTableView: UITableView!
    
    

    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        flightsTableView.dataSource = self
        
        FlightsNetworkService.fetchFlights() { receivedFlights in
                    // Handle the received flights data here
            
            print("-------------------------------------------------------------------------")
            print("-------------------------------------------------------------------------")
            print("flights have arrived!!")
            print("-------------------------------------------------------------------------")
            print("-------------------------------------------------------------------------")
            print(type(of: receivedFlights))
            print("-------------------------------------------------------------------------")
            print("-------------------------------------------------------------------------")
            print()
            print("-------------------------------------------------------------------------")
            print("-------------------------------------------------------------------------")
                }
        
       

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
