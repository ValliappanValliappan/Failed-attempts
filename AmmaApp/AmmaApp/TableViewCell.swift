//
//  TableViewCell.swift
//  AmmaApp
//
//  Created by Chettiar Valliappan, Valliappan on 8/19/16.
//  Copyright © 2016 Ratan. All rights reserved.
//
import UIKit

class TableViewCell: UITableViewCell,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet var pickerView:UIPickerView!=UIPickerView()
    var j=Int()
    var arrayOfCount=[Int]()
    var counts=["0","1","2","3","4","5","6","7","8","9","10"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerView.delegate=self
        pickerView.dataSource=self
        // Initialization code
        let fileGuru=FileManager()
        let path:String="/Users/valli/Desktop/something.txt"
        fileGuru.createFile(atPath: path, contents:nil, attributes:nil)
        let newString:NSString="hello dubaiah"
        try! newString.write(toFile: path, atomically: true, encoding: String.Encoding.utf8.rawValue)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        arrayOfCount.append(pickerView.selectedRow(inComponent: component))
        print(arrayOfCount)
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return counts[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return counts.count
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

