//
//  ViewController.swift
//  DisasterManagement
//
//  Created by Chettiar Valliappan, Valliappan on 2/6/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func moveToWhatToDoScreen(button:UIButton){
        let next=WhatToDoViewController()
        self.present(next, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

