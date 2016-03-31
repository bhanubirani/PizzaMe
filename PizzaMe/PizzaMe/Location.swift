//
//  Location.swift
//  PizzaMe
//
//  Created by Bhanu Birani on 29/03/16.
//  Copyright © 2016 Bhanu Birani. All rights reserved.
//

import UIKit

class Location {
    
    // MARK:- Properties
    
    var title: String
    var address: String
    var city: String
    var state: String
    var phone: String
    var lat: String
    var long: String
    var distance: String
    var mapurl: String
    
    // MARK:- Initialization
    
    init(data: NSMutableDictionary) {
        self.title = data.objectForKey("Title") as! String
        self.address = data.objectForKey("Address") as! String
        self.city = data.objectForKey("City") as! String
        self.state = data.objectForKey("State") as! String
        self.phone = data.objectForKey("Phone") as! String
        self.lat = data.objectForKey("Latitude") as! String
        self.long = data.objectForKey("Longitude") as! String
        self.distance = data.objectForKey("Distance") as! String
        self.mapurl = data.objectForKey("MapUrl") as! String
    }
}
