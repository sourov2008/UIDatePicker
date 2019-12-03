//
//  UITextField+Extension.swift
//  UIDatePicker
//
//  Created by shourob datta on 12/3/19.
//  Copyright © 2019 shourov datta. All rights reserved.
//

import UIKit
extension UITextField {
    
    func setInputViewDatePicker(target: Any, selector: Selector, title: String, maxDate: Date!, minDate: Date!, dateType: UIDatePicker.Mode) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        //let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))
        let datePicker = UIDatePicker()
        datePicker.backgroundColor = UIColor(white: 1, alpha: 0.5)
        datePicker.datePickerMode = dateType
        if (maxDate != nil) {
            datePicker.maximumDate = maxDate
        }
        if (minDate != nil) {
            datePicker.maximumDate = minDate
        }
        self.inputView = datePicker
        
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        toolBar.tintColor = .darkGray
        toolBar.backgroundColor = #colorLiteral(red: 0.191891104, green: 0.2157090902, blue: 0.2459823489, alpha: 1)
        toolBar.alpha = 0.80
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        cancelButton.tintColor = .red
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        doneButton.tintColor = .blue
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let titleText = UIBarButtonItem(title: title, style: .plain, target: self, action: nil);
        titleText.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: UIControl.State.normal)
        toolBar.setItems([cancelButton,spaceButton,titleText, spaceButton, doneButton], animated: false)

        self.inputAccessoryView = toolBar //9
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
    
}
