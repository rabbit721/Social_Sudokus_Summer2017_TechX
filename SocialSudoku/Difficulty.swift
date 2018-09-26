//
//  Difficulty.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 09/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import Foundation
import UIKit

class Difficulty : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var difs = ["Easy","Medium","Difficult","Evil"]
    
    @IBOutlet weak var diffPicker : UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return difs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        NewGame.gameLevel = difs[row]
        
    }
}
