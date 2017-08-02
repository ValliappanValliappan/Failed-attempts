//
//  ViewController.swift
//  Encryptor
//
//  Created by Chettiar Valliappan, Valliappan on 11/11/16.
//  Copyright © 2016 Ratan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
@IBOutlet var EncryptedMessage:UILabel!
    @IBOutlet var message:UITextField!
    @IBOutlet var shiftWord:UITextField!
    var alphabet:[Character]=["0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func encryptTheMessage(button:UIButton){
        var shiftNumbers=(shiftWord.text)?.lowercaseString
        var indexes:[Int]=[Int]()
        for chars in (shiftNumbers?.characters)!{
            for nums in alphabet{
                if(nums==chars){
                    indexes.append(alphabet.indexOf(nums)!)
                }
                else{
                    continue
                }
            }
            for(int j=1;;j+=1){                    //ABANDONED PROJECT
                
            }
        }
        
        for hello in indexes{
            print(hello)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

