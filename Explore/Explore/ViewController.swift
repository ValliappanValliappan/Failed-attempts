//
//  ViewController.swift
//  Explore
//
//  Created by Chettiar Valliappan, Valliappan on 4/10/17.
//  Copyright © 2017 Ratan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func start(button:UIButton){
        let mainView=MainViewController()
        present(mainView, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

