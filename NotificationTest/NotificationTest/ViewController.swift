//
//  ViewController.swift
//  NotificationTest
//
//  Created by Chettiar Valliappan, Valliappan on 7/20/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let content=UNMutableNotificationContent()
        content.body="Adolf Hitler was rude"
        content.title="Fun fact"
        let trigger=UNTimeIntervalNotificationTrigger(timeInterval:5,repeats:false)
        let request=UNNotificationRequest(identifier: "something", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
    
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

