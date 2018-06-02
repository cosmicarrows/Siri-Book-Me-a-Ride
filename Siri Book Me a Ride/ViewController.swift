//
//  ViewController.swift
//  Siri Book Me a Ride
//
//  Created by Laurence Wingo on 6/1/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let rideService = DummyRideService()
    
    private var rides = [Ride]()
    
    @IBOutlet var from: UITextField!
    
    @IBOutlet var to: UITextField!
    
    @IBOutlet var ridesTableView: UITableView!
    
    @IBAction func findRouteButtonClicked(){
        
        let fromText = self.checkNil(from.text as AnyObject?)
        let toText = self.checkNil(to.text as AnyObject?)
        
        //calling that protocol method we implemented
        rideService.findRide(from: fromText, to: toText, completion: {
            [unowned self] foundRides in
            self.rides = foundRides
            self.ridesTableView.reloadData()
        })
    }
    
    func checkNil(_ string: AnyObject?) -> String {
        return string == nil ? "": string as! String
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rides.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "RouteCell")
        
       if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "RouteCell")
        }
        
        let ride = rides[indexPath.row]
        
        let displayText = "Ride with \(ride.company), car number \(ride.carNumber) in \(ride.timeInMinutes) min."
        
        cell?.textLabel?.text = displayText
        
        
        cell?.textLabel?.minimumScaleFactor = 0.3
        
        cell?.textLabel?.adjustsFontSizeToFitWidth = true
        
        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ridesTableView.delegate = self
        ridesTableView.dataSource = self
        requestSiriAuthorization()
    }
    
    private func requestSiriAuthorization(){
        INPreferences.requestSiriAuthorization { (authorizationStatus) in
            switch authorizationStatus {
            case .authorized:
                print("User authorized Siri")
            default:
                print("User didn't authorize Siri")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

