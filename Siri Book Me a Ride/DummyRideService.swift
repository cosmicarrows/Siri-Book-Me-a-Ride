//
//  DummyRideService.swift
//  Siri Book Me a Ride
//
//  Created by Laurence Wingo on 6/1/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import Foundation

class DummyRideService: NSObject, RideService {
    
    //the way this method is implemented is that the completion parameter comes from the private dummyRide function that returns three instances of rides
    func findRide(from: String, to: String, completion: @escaping ([Ride]) -> Void) {
        completion(self.dummyRides())
    }
    
    private func dummyRides() -> [Ride] {
        
        let ride1 = Ride.init(company: "Uber", carNumber: "123", timeInMinutes: 3, rideType: .taxi, price: 30, currency: "US")
        let ride2 = Ride.init(company: "Hartsfield-Jackson", carNumber: "11", timeInMinutes: 5, rideType: .limo, price: 60, currency: "US")
        let ride3 = Ride.init(company: "Lyft", carNumber: "80", timeInMinutes: 7, rideType: .taxi, price: 25, currency: "US")
        
        return [ride1, ride2, ride3]
    }
    
    
    
    

    
}
