//
//  LocationDownloadManager.swift
//  PizzaMe
//
//  Created by Bhanu Birani on 29/03/16.
//  Copyright © 2016 Bhanu Birani. All rights reserved.
//

import UIKit
import Foundation

class LocationDownloadManager: NSObject {
    
    var locationArray: NSArray?
    var locModelArray: NSMutableArray?
    var locViewModelArray: NSMutableArray?
    
    func downloadData(completionHandler: (AnyObject?, NSError?) ->Void) {
        
        let urlString = "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20local.search%20where%20zip%3D%2778759%27%20and%20query%3D%27pizza%27&format=json&diagnostics=true&callback="
        
        let url = NSURL( string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, innerError) in
            print("Response------>\n\n")
            self.parseJSON(data)
            self.createModel()
            self.createViewModel()
            completionHandler(self.locViewModelArray, nil)
        }
        task.resume()
    }
    
    func parseJSON(data: NSData?) {
        
        if let JSONData = data { // Check 1
            if let json: AnyObject = try! NSJSONSerialization.JSONObjectWithData(JSONData, options: NSJSONReadingOptions.MutableContainers) { // Check 2
                if let jsonDictionary = json as? NSDictionary {
                    print("Dictionary received \n\n")
                    locationArray = jsonDictionary.objectForKey("query")?.objectForKey("results")?.objectForKey("Result") as? NSArray
                    
                    //print("Array: \n\n \(locationArray)")
                }
                else {
                    if let jsonString = NSString(data: JSONData, encoding: NSUTF8StringEncoding) {
                        print("JSON String: \n\n \(jsonString)")
                        
                        locationArray = self.convertStringToArray(jsonString as String) as NSArray!
                    }
                }
            }
            else {
                fatalError("Can't parse JSON")
            }
        }
        else {
            fatalError("JSONData is nil")
        }
        
    }
    
    func createModel() {
        
        locModelArray = NSMutableArray()
        
        for (index, element) in (locationArray?.enumerate())! {
            
            if index == 0 {
                print("\(index): \(element)\n\n");
            }
            
            let lm: Location = Location.init(data: element as! NSMutableDictionary)
            locModelArray?.addObject(lm)
            
        }
    }
    
    func createViewModel() {
        locViewModelArray = NSMutableArray()
        
        for (index, element) in (locModelArray?.enumerate())! {
            if index == 0 {
                print("\(index): \(element)\n\n");
            }
            
            let lvm: LocationViewModel = LocationViewModel.init(loc: element as! Location)
            locViewModelArray?.addObject(lvm)
        }
    }
    
    func convertStringToArray(jsonString: String) ->NSArray? {
        do {
            var array: NSArray
            array = try  NSJSONSerialization.JSONObjectWithData(jsonString.dataUsingEncoding(NSUTF8StringEncoding)!, options: []) as! NSArray
            print("Array: \n\n \(array)")
            return array
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
}
