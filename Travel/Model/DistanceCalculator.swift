//
//  DistanceCalculator.swift
//  Travel
//
//  Created by Manoli on 08/07/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import Foundation
import CoreLocation

class DistanceCalculator {
    
    enum Error: Swift.Error, Equatable {
        case unknownCity(_ city: String)
    }
    
    struct City {
        let name: String
        let coordinates: (latitude: Double, longitude: Double)
    }
    
    private let cities = [
        "San Francisco" : City(name: "San Francisco",   coordinates: (37.78, -122.42)),
        "New York City" : City(name: "New York City",   coordinates: (40.71, -74.01)),
        "Seattle"       : City(name: "Seattle",         coordinates: (47.61, -122.33)),
        "Paris"         : City(name: "Paris",           coordinates: (48.86, 2.35)),
        "San Jose"      : City(name: "San Jose",        coordinates: (37.34, -121.89))
    ]
    
    func city(forName city: String) -> City? {
        return cities[city]
    }
    
    func distanceInMiles(from origin: String, to destination: String) throws -> Double {
        guard let fromCity = city(forName: origin) else {
            throw Error.unknownCity(origin)
        }
        
        guard let toCity = city(forName: destination) else {
            throw Error.unknownCity(destination)
        }
        
        return distanceInMiles(from: fromCity, to: toCity)
    }
    
    func distanceInMiles(from fromCity: City, to toCity: City) -> Double {
        let fromLocation = CLLocation(latitude: fromCity.coordinates.latitude,
                                      longitude: fromCity.coordinates.longitude)
        let toLocation = CLLocation(latitude: toCity.coordinates.latitude,
                                    longitude: toCity.coordinates.longitude)
        
        let distanceInMeters = Measurement(value: fromLocation.distance(from: toLocation), unit: UnitLength.meters)
        return distanceInMeters.converted(to: UnitLength.miles).value
    }
}
