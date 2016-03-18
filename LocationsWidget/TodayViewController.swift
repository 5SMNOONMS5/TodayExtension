//
//  TodayViewController.swift
//  LocationsWidget
//
//  Created by Lee-Sheng Chen on 3/16/16.
//  Copyright © 2016 stephen.personal. All rights reserved.
//

import UIKit
import NotificationCenter
import TodayExtensionKit

class TodayViewController: UIViewController, NCWidgetProviding {
  
  @IBOutlet weak var lblLocation: UILabel!
  
  var defaults = NSUserDefaults(suiteName: "group.com.location")
  
  
  var cities = Location().cities
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view from its nib.
    if let city = defaults!.valueForKey("CurrentCity"){
      lblLocation.text = city as? String
      print("new in viewDidLoad")
    }else{
      lblLocation.text = cities[3] as String
      print("old in viewDidLoad")
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData
    
    if let city = defaults!.valueForKey("CurrentCity"){
      lblLocation.text = city as? String
      print("new in widgetPerform")
    }else{
      lblLocation.text = cities[3] as String
      print("new in widgetPerform")
    }
    
    completionHandler(NCUpdateResult.NewData)
  }
  
}
