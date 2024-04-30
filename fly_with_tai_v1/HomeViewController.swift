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
    var bestFlights:[GenericFlight]?
    var otherFlights:[GenericFlight]?
    var combinedFlights: [GenericFlight]?
    

    
        var departureId: String?
        var arrivalId: String?
        var outboundDate: String?
        var returnDate: String?
        var currency: String?
        var hl: String?
        var apiKey: String?
        

    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return getNumberOfFlights();
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        print("🍏 cellForRowAt called for row: \(indexPath.row)")

        let cell = tableView.dequeueReusableCell(withIdentifier: "FlightTableViewCell", for: indexPath) as! FlightTableViewCell
        
        
        print("no of best flights is: \(String(describing: bestFlights?.count))");
        print("no of other flights is: \(String(describing: otherFlights?.count))");
        print("no of combined flights is: \(String(describing: combinedFlights?.count))");

        
        let flight = combinedFlights?[indexPath.row]
        
        if let price = flight?.price {
            
            
            cell.flightPrice.text = "\(price)"
        } else {
            print("The price of the flight is not available")
        }
        
        let flights = flight?.flights
        
        
        let airline_name = flights?[0].airline
        cell.airlineName.text = airline_name
        
        
        
        if let firstFlight = flights?[0]{
            let departureLocation = firstFlight.departureAirport
            

            
            let airportName = departureLocation.id
            
            let departureTimeString = departureLocation.time
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

            if let departureTime = dateFormatter.date(from: departureTimeString) {
                dateFormatter.dateFormat = "HH:mm"
                let formattedTime = dateFormatter.string(from: departureTime)
                cell.departureTime.text = "\(formattedTime)"
                print(formattedTime)
            } else {
                print("Invalid date format for departure time")
            }


            cell.dapartureLocation.text = "\(airportName)"
            
    
        }
        
        
 
        if let lastFlight = flights?[(flights?.count ?? 0)-1]{
            let arrivalLocation = lastFlight.arrivalAirport
            
            let airportName = arrivalLocation.id
            
           
            
            let departureTimeString = arrivalLocation.time
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"

            if let departureTime = dateFormatter.date(from: departureTimeString) {
                dateFormatter.dateFormat = "HH:mm"
                let formattedTime = dateFormatter.string(from: departureTime)
                cell.arrivalTime.text = "\(formattedTime)"
                print(formattedTime)
            } else {
                print("Invalid date format for departure time")
            }

            cell.arrivalLocation.text = "\(airportName)"
           
            
            
        }
        
        
        if let layovers = flight?.layovers?.count{
            
            cell.additionalInfo.text = "\(layovers)"
            cell.additionalInfo.isHidden = false
            
        }
        
        
        if let flightUrlString = flight?.airlineLogo,
           let flightUrl = URL(string: flightUrlString) {
            // Create a URLSession data task to fetch the image data
            URLSession.shared.dataTask(with: flightUrl) { data, response, error in
                // Check for errors
                if let error = error {
                    print("Error loading image: \(error)")
                    return
                }
                
                // Ensure there is data and it can be converted to an image
                guard let data = data, let image = UIImage(data: data) else {
                    print("Invalid image data")
                    return
                }
                
                // Update the UI on the main thread
                DispatchQueue.main.async {
                    // Set the downloaded image to the UIImageView
                    cell.airlineLogo.image = image
                }
            }.resume() // Start the data task
        }

            
            return cell

    
    }
    
    
    func getNumberOfFlights()->Int{
        
        var bestCount: Int = 0;
        var otherCount: Int = 0;
        
        if self.bestFlightsCount != nil
        {
            bestCount = self.bestFlightsCount!
            
        }
        
        if self.otherFlighsCount != nil
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
                print("There are no available best flights☹️")
            }
            
            if let otherFlights = receivedFlights.otherFlights{
                //handle other flights
                self.otherFlights = otherFlights
                
                
                // count number of other flights
                self.otherFlighsCount = otherFlights.count
            }
            
            else{
                //handle lack of other flights
                print("There are no available other flights☹️")
            }
            
            
            // Combine bestFlights and otherFlights into combinedFlights
                    if let bestFlights = bestFlights, let otherFlights = otherFlights {
                        var combinedFlights = bestFlights + otherFlights
                        self.combinedFlights = combinedFlights
                    } else if let bestFlights = bestFlights {
                        self.combinedFlights = bestFlights
                    } else if let otherFlights = otherFlights {
                        self.combinedFlights = otherFlights
                    } else {
                        // Handle case where both bestFlights and otherFlights are nil
                        // You might want to decide what to do in this case
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flightsTableView.dataSource = self

        // Only call fetchFlights with parameters if they exist
        if let depId = departureId, let arrId = arrivalId, let outDate = outboundDate, let retDate = returnDate {
            fetchFlights(departureId: depId, arrivalId: arrId, outboundDate: outDate, returnDate: retDate, currency: currency ?? "USD", hl: hl ?? "en", apiKey: apiKey ?? "")
        }
    }
    
    
    func fetchFlights(departureId: String?, arrivalId: String?, outboundDate: String?, returnDate: String?, currency: String = "USD", hl: String = "en", apiKey: String) {
        guard let departureId = departureId, let arrivalId = arrivalId, let outboundDate = outboundDate, let returnDate = returnDate else {
            print("Flight search parameters are incomplete.")
            return
        }

        FlightsNetworkService.fetchFlights(departureId: departureId, arrivalId: arrivalId, outboundDate: outboundDate, returnDate: returnDate, currency: currency, hl: hl, apiKey: apiKey) {receivedFlights in
                            self.configureReceivedFlights(receivedFlights: receivedFlights)
                            self.flightsTableView.reloadData()
            
        }
    }


    

  
}
