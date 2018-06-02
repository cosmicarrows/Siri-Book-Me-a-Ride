//
//  RideService.swift
//  Siri Book Me a Ride
//
//  Created by Laurence Wingo on 6/1/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import Foundation

protocol RideService {
    func findRide(from: String, to: String, completion: @escaping ([Ride]) -> Void)
    
}
