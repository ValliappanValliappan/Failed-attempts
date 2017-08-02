//
//  ViewController.swift
//  AmmaApp
//
//  Created by Chettiar Valliappan, Valliappan on 8/18/16.
//  Copyright © 2016 Ratan. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var i:Int=0
    var test = 23
    var itemArray = ["idly","sambhar"]
    @IBOutlet var tableView: UITableView!
    @IBOutlet var nameField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self//tells the compiler that this class has implemented methods from the UITableViewDataSource protocol
        //if you dont type this the compiler is going to look at the implemented methods just like it looks at any other method
        tableView.delegate=self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print(tableView.cellForRow(at: indexPath)?.textLabel?.text)
    }

    
 //   init(){
   //     super.init(nibName: String?(), bundle: Bundle?())
    //}
    required init?(coder aDecoder: NSCoder) {
        i=0
        super.init(coder:aDecoder)
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1:UITableViewCell=tableView.dequeueReusableCell(withIdentifier: "celllls", for: indexPath)
        cell1.textLabel?.text=itemArray[indexPath.row]
        return cell1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
