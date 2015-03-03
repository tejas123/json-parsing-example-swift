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
    var arrDict :NSMutableArray=[]
    @IBOutlet weak var tvJSON: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        jsonParsing()
        tvJSON .reloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jsonParsing()
    {
        let path: NSString = NSBundle.mainBundle().pathForResource("days", ofType: "json")!
    
        var data : NSData = NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMapped, error: nil)!
        
        var dict: NSDictionary!=NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary

        
        for var i = 0 ; i < (dict.valueForKey("MONDAY") as NSArray).count ; i++
        {
            arrDict.addObject((dict.valueForKey("MONDAY") as NSArray) .objectAtIndex(i))
        }
        for var i = 0 ; i < (dict.valueForKey("TUESDAY") as NSArray).count ; i++
        {
            arrDict.addObject((dict.valueForKey("TUESDAY") as NSArray) .objectAtIndex(i))
        }
        for var i = 0 ; i < (dict.valueForKey("WEDNESDAY") as NSArray).count ; i++
        {
            arrDict.addObject((dict.valueForKey("WEDNESDAY") as NSArray) .objectAtIndex(i))
        }

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
        var cell : TableViewCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as TableViewCell
        if(cell == nil)
        {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as TableViewCell;
        }
        let strTitle : NSString=arrDict[indexPath.row] .valueForKey("TITLE") as NSString
        let strDescription : NSString=arrDict[indexPath.row] .valueForKey("DETAILS") as NSString
        cell.lblTitle.text=strTitle
        cell.lbDetails.text=strDescription
        return cell as TableViewCell
    }



}

