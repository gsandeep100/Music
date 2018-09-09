//
//  PickerView.swift
//  Music
//
//  Created by Sandeep on 08/09/2018.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
import UIKit
class PickerView : UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    var pickerData : [String]!
    var pickerTextField : UITextField!
    var musdelegate: MusicDelegate?
    init(pickerData: [String], dropdownField: UITextField,musdelegate: MusicDelegate) {
        super.init(frame: CGRect(x: 0, y: UIScreen.main.bounds.height-200, width: UIScreen.main.bounds.width, height: 200))
        
        self.pickerData = pickerData
        self.pickerTextField = dropdownField
        
        self.delegate = self
        self.dataSource = self
        self.musdelegate = musdelegate
        
        DispatchQueue.main.async {
            if pickerData.count > 0 {
                self.pickerTextField.text = self.pickerData[0]
                self.pickerTextField.isEnabled = true
            } else {
                self.pickerTextField.text = nil
                self.pickerTextField.isEnabled = false
            }
    }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return pickerData.count
    }
    
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return pickerData[row]
    }
    
    // When user selects an option, this function will set the text of the text field to reflect
    // the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickerData[row]
        self.musdelegate?.selectCategory(category: pickerTextField.text!)
    }
    
    
}
