//
//  FlightsNetworkService.swift
//  fly_with_tai_v1
//
//  Created by David Isinta Nyakawa on 4/18/24.
//

import Foundation

class FlightsNetworkService{
    
    
    static func fetchFlights(completion: ((SearchResults) -> Void)? = nil) {
            // Fetch flights asynchronously
        
//        let parameters = "departure_id=CDG&arrival_id=NBO"
        
        
            let url = URL(string: "https://serpapi.com/search.json?engine=google_flights&departure_id=JFK&arrival_id=NBO&outbound_date=2024-05-13&return_date=2024-08-19&currency=USD&hl=en&=&api_key=74cccf42c85e59add4a78297ece78471a30b5d18d133e279605fcbee6b5d5be3")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle potential errors
            guard error == nil else {
                assertionFailure("Error: \(error!.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                assertionFailure("Invalid response")
                return
            }
            
            guard let data = data, httpResponse.statusCode == 200 else {
                assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                return
            }
            
            do {
                // Decode JSON data into a dictionary
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    // Print the decoded JSON
                    print(json)
                    
                    // If you need to convert JSON to a struct or other data model, do it here
                    // Example:
                    
//                    let results = try? JSONDecoder().decode(SearchResults.self, from: data)
                   
                    let decoder = JSONDecoder()
                    let response = try! decoder.decode(SearchResults.self, from: data)
                    DispatchQueue.main.async {
                        completion?(response)
                    }
                    
                    
                     
//                     completion?(receivedFlights)
                } else {
                    print("Failed to decode JSON")
                }
            } catch let error {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        task.resume() // Resume the task and fire the request

        
        
        
        
        
        
        
        
        
        
        
            
        }
    
    
    
}


// -----------
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//



// MARK: - Welcome
struct SearchResults: Codable {
    let searchMetadata: SearchMetadata
    let searchParameters: SearchParameters
    let bestFlights: [BestFlight]
    let otherFlights: [OtherFlight]

    enum CodingKeys: String, CodingKey {
        case searchMetadata = "search_metadata"
        case searchParameters = "search_parameters"
        case bestFlights = "best_flights"
        case otherFlights = "other_flights"
    }
}

// MARK: - BestFlight
struct BestFlight: Codable {
    let flights: [Flight]
    let totalDuration: Int
    let carbonEmissions: CarbonEmissions
    let price: Int
    let type: String
    let airlineLogo: String
    let departureToken: String

    enum CodingKeys: String, CodingKey {
        case flights
        case totalDuration = "total_duration"
        case carbonEmissions = "carbon_emissions"
        case price, type
        case airlineLogo = "airline_logo"
        case departureToken = "departure_token"
    }
}

// MARK: - CarbonEmissions
struct CarbonEmissions: Codable {
    let thisFlight, typicalForThisRoute, differencePercent: Int

    enum CodingKeys: String, CodingKey {
        case thisFlight = "this_flight"
        case typicalForThisRoute = "typical_for_this_route"
        case differencePercent = "difference_percent"
    }
}

// MARK: - Flight
struct Flight: Codable {
    let departureAirport, arrivalAirport: Airport
    let duration: Int
    let airplane: Airplane
    let airline: String
    let airlineLogo: String
    let travelClass: TravelClass
    let flightNumber: String
    let ticketAlsoSoldBy: [String]?
    let legroom: Legroom
    let extensions: [String]
    let overnight: Bool?

    enum CodingKeys: String, CodingKey {
        case departureAirport = "departure_airport"
        case arrivalAirport = "arrival_airport"
        case duration, airplane, airline
        case airlineLogo = "airline_logo"
        case travelClass = "travel_class"
        case flightNumber = "flight_number"
        case ticketAlsoSoldBy = "ticket_also_sold_by"
        case legroom, extensions, overnight
    }
}

enum Airplane: String, Codable {
    case boeing777 = "Boeing 777"
    case boeing787 = "Boeing 787"
    case boeing78710 = "Boeing 787-10"
}

// MARK: - Airport
struct Airport: Codable {
    let name, id, time: String
}

enum Legroom: String, Codable {
    case the31In = "31 in"
    case the32In = "32 in"
}

enum TravelClass: String, Codable {
    case economy = "Economy"
}

// MARK: - OtherFlight
struct OtherFlight: Codable {
    let flights: [Flight]
    let layovers: [Layover]
    let totalDuration: Int
    let carbonEmissions: CarbonEmissions
    let price: Int
    let type: String
    let airlineLogo: String
    let departureToken: String

    enum CodingKeys: String, CodingKey {
        case flights, layovers
        case totalDuration = "total_duration"
        case carbonEmissions = "carbon_emissions"
        case price, type
        case airlineLogo = "airline_logo"
        case departureToken = "departure_token"
    }
}

// MARK: - Layover
struct Layover: Codable {
    let duration: Int
    let name, id: String
}

// MARK: - SearchMetadata
struct SearchMetadata: Codable {
    let id, status: String
    let jsonEndpoint: String
    let createdAt, processedAt: String
    let googleFlightsURL: String
    let rawHTMLFile: String
    let prettifyHTMLFile: String
    let totalTimeTaken: Double

    enum CodingKeys: String, CodingKey {
        case id, status
        case jsonEndpoint = "json_endpoint"
        case createdAt = "created_at"
        case processedAt = "processed_at"
        case googleFlightsURL = "google_flights_url"
        case rawHTMLFile = "raw_html_file"
        case prettifyHTMLFile = "prettify_html_file"
        case totalTimeTaken = "total_time_taken"
    }
}

// MARK: - SearchParameters
struct SearchParameters: Codable {
    let engine, hl, gl, departureID: String
    let arrivalID, outboundDate, returnDate, currency: String

    enum CodingKeys: String, CodingKey {
        case engine, hl, gl
        case departureID = "departure_id"
        case arrivalID = "arrival_id"
        case outboundDate = "outbound_date"
        case returnDate = "return_date"
        case currency
    }
}

