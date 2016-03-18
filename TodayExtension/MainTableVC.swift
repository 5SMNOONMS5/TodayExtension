//
//  ViewController.swift
//  TodayExtension
//
//  Created by Lee-Sheng Chen on 3/16/16.
//  Copyright © 2016 stephen.personal. All rights reserved.
//

import UIKit
import TodayExtensionKit

let cellID = "cellID"

class MainTableVC: UITableViewController {
  
  var cities = Location().cities
  
  var defaults = NSUserDefaults(suiteName: "group.com.location")!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return cities.count
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 44.0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    var cell = self.tableView.dequeueReusableCellWithIdentifier(cellID)
    cell = UITableViewCell.init(style: .Value1, reuseIdentifier: cellID)
    cell!.textLabel?.text = "\(cities[indexPath.row])"
    return cell!
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let cell = self.tableView.cellForRowAtIndexPath(indexPath)
    cell?.accessoryType = .Checkmark
    
    defaults.setValue(cities[indexPath.row] as String, forKey: "CurrentCity")
  }
  
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    let cell = self.tableView.cellForRowAtIndexPath(indexPath)
    cell?.accessoryType = .None
  }
  
}

