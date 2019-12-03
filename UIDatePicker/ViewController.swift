//
//  ViewController.swift
//  UIDatePicker
//
//  Created by shourob datta on 12/3/19.
//  Copyright © 2019 shourov datta. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myTextField.setInputViewDatePicker(target: self, selector:  #selector(tapDone), title: "Select a date", maxDate: nil, minDate: nil, dateType: UIDatePicker.Mode.time)
    }
    
    
    @objc func tapDone() {
        if let datePicker = self.myTextField.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateStyle = .full
            self.myTextField.text = dateformatter.string(from: datePicker.date) 
        }
        self.myTextField.resignFirstResponder()
    }
    

}

