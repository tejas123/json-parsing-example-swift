//
//  ViewController.swift
//  JSONDemo
//
//  Created by TheAppGuruz-New-6 on 31/07/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    let yourJsonFormat: String = "JSONFile" // set text JSONFile : json data from file
                                            // set text JSONUrl : json data from web url
    
    var arrDict :NSMutableArray=[]
    
    @IBOutlet weak var tvJSON: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if yourJsonFormat == "JSONFile" {
            jsonParsingFromFile()
        } else {
            jsonParsingFromURL()
        }
    }
    
    func jsonParsingFromURL () {
        let url = NSURL(string: "http://theappguruz.in//Apps/iOS/Temp/json.php")
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            self.startParsing(data!)
        }
    }
    
    func jsonParsingFromFile()
    {
        let path: NSString = NSBundle.mainBundle().pathForResource("days", ofType: "json")!
        let data : NSData = try! NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped)
        
        self.startParsing(data)
    }
    
    func startParsing(data :NSData)
    {
        let dict: NSDictionary!=(try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
        
        for var i = 0 ; i < (dict.valueForKey("MONDAY") as! NSArray).count ; i++
        {
            arrDict.addObject((dict.valueForKey("MONDAY") as! NSArray) .objectAtIndex(i))
        }
        for var i = 0 ; i < (dict.valueForKey("TUESDAY") as! NSArray).count ; i++
        {
            arrDict.addObject((dict.valueForKey("TUESDAY") as! NSArray) .objectAtIndex(i))
        }
        for var i = 0 ; i < (dict.valueForKey("WEDNESDAY") as! NSArray).count ; i++
        {
            arrDict.addObject((dict.valueForKey("WEDNESDAY") as! NSArray) .objectAtIndex(i))
        }
        tvJSON .reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrDict.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : TableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        let strTitle : NSString=arrDict[indexPath.row] .valueForKey("TITLE") as! NSString
        let strDescription : NSString=arrDict[indexPath.row] .valueForKey("DETAILS") as! NSString
        cell.lblTitle.text=strTitle as String
        cell.lbDetails.text=strDescription as String
        return cell as TableViewCell
    }
}
