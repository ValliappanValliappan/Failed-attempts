//
//  MainViewController.swift
//  Explore
//
//  Created by Chettiar Valliappan, Valliappan on 4/10/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit
import CoreLocation
class MainViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var speedField:UITextField!
    var directions:[String]!=[String]()
    var intervals:[TimeInterval]=[TimeInterval]()
    var speeds=[Double]()
    var speedHelp=CLLocation()
    var angleHelp:CLHeading!=CLHeading()
    var heading:CLLocationDirection!=CLLocationDirection()
    var startDate:Date!
    override func viewDidLoad() {
        super.viewDidLoad()
        speedField.delegate=self
        heading=angleHelp.magneticHeading//DOESNT WORK FOR SOME REASON. TEST IT ON A DEVICE
        speedField.text="\(speedHelp.speed)"
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func speedUpdate(_ sender: UITextField) {
        let speed=speedHelp.speed
        speeds.insert(speed, at: 0)
        if(heading < angleHelp.magneticHeading+10 && heading > angleHelp.magneticHeading-10){
            if(speed != 0 && startDate == nil){//when user continues to walk until turning
            startDate=Date()
            }
            else if(speed == 0 && startDate != nil){//When user stops in the middle
                let stopDate=Date()
                let currentInterval=stopDate.timeIntervalSince(startDate)
                startDate=nil
                intervals.insert(currentInterval, at: 0)
            }
    }
        else{
            //Recording data for movement before turning
            let totalTimeTaken = addUpAllElements(array: intervals)
            let averageSpeed = addUpAllElements(array: speeds)/(speeds.count as! Double)
            let distance = totalTimeTaken*averageSpeed
            directions.insert("Turn \(heading) degrees",at: 0)
            directions.insert("Move \(distance)m forward", at: 0)
            //Recorded the data for movement before turning
            
            //Changing heading after turning
            heading=angleHelp.magneticHeading
            
        }
        
    
        sender.text = "\(speed)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addUpAllElements(array:[Double])->Double{
        var result=0.0
        for i in array{
            result+=i
        }
        return result
    }
}
