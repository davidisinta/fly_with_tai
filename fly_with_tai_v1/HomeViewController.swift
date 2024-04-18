//
//  HomeViewController.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/16/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    
    private var gottenFlights: ReceivedFlights?
    
    @IBOutlet weak var flightsTableView: UITableView!
    
    
    var bestFlightsCount:Int?
    var otherFlighsCount: Int?
    var bestFlights:[BestFlight]?
    var otherFlights:[OtherFlight]?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        return getNumberOfFlights();
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell()
        

            // Get the movie-associated table view row
            let flight = otherFlights?[indexPath.row]

            // Configure the cell (i.e., update UI elements like labels, image views, etc.)
        if let price = flight?.price {
            cell.textLabel?.text = "The price of the flight is: \(price)"
        } else {
            cell.textLabel?.text = "The price of the flight is not available"
        }


            // Return the cell for use in the respective table view row
            return cell

            
    
    }
    
    func getNumberOfFlights()->Int{
        
        var bestCount: Int = 0;
        var otherCount: Int = 0;
        
        if let results = self.bestFlightsCount
        {
            bestCount = self.bestFlightsCount!
            
        }
        
        if let results2 = self.otherFlighsCount
        {
            otherCount = self.bestFlightsCount!
            
        }
        
        
        let totalCount = bestCount + otherCount
            print("Total number of received flights is: \(totalCount)")
            
            return totalCount
        
        
        
        
    }
    
    func configureReceivedFlights(receivedFlights:ReceivedFlights)
    {
        self.gottenFlights = receivedFlights
        
        
        if let receivedFlights = gottenFlights {
            
            if let bestFlights = receivedFlights.bestFlights{
                //handle best flights
                self.bestFlights = bestFlights
                
                
                // count number of best flights
                self.bestFlightsCount = bestFlights.count
            }
            
            else{
                //handle lack of best flights
            }
            
            
            
            if let otherFlights = receivedFlights.otherFlights{
                //handle other flights
                self.otherFlights = otherFlights
                
                
                // count number of other flights
                self.otherFlighsCount = otherFlights.count
            }
            
            else{
                //handle lack of other flights
            }
            
            
            
            
            
            
        } else {
            print("************************************************")
            print("There are no flights buddy!!")
            print("************************************************")
        }
        
        
        
        print("-------------------------------------------------------------------------")
        print("-------------------------------------------------------------------------")
        print("flights have arrived!!")
        print("-------------------------------------------------------------------------")
        print("-------------------------------------------------------------------------")
        print(type(of: receivedFlights))
        
        
    }
    
    

    override func viewDidLoad() 
    {
        super.viewDidLoad()
        
        flightsTableView.dataSource = self
        
        FlightsNetworkService.fetchFlights() { receivedFlights in
                    // Handle the received flights data here
            
            
            self.configureReceivedFlights(receivedFlights: receivedFlights)
            self.flightsTableView.reloadData()
            
            
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
