//
//  LocationViewModel.swift
//  PizzaMe
//
//  Created by Bhanu Birani on 29/03/16.
//  Copyright © 2016 Bhanu Birani. All rights reserved.
//

import UIKit

class LocationViewModel {
    
    // MARK:- Properties
    
    var title: String = ""
    var address: String = ""
    var phone: String = ""
    
    init(loc: Location) {
        
        self.title = loc.title;
        self.address = loc.address + " " + loc.city + " " + loc.state;
        self.phone = loc.phone;
        
        print("------")
        print("title: %@", self.title);
        print("address: %@", self.address);
        print("phone: %@", self.phone);
    }
}
