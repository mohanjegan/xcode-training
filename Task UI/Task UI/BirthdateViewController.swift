//
//  BirthdateViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class BirthdateViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var brthDateTxt: UITextField!
    let datepicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 25
        nextButton.layer.masksToBounds = true
        brthDateTxt.layer.cornerRadius = 25
        brthDateTxt.layer.masksToBounds = true
        title = "Sign Up"
        createDatePicker()
    }
    @IBAction func btnNextTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "PasswordViewControllerID")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "WelcomeViewControllerID")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
        func createDatePicker(){
            //Toolbar
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
    
            //bar button
            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            toolbar.setItems([doneBtn], animated: true)
    
            //assign toolbar
            brthDateTxt.inputAccessoryView = toolbar
    
            //assign datepicker to text field
            brthDateTxt.inputView = datepicker
            
            //data picker mode
            datepicker.datePickerMode = .date
    
        }
    
    @objc func donePressed(){
        //formatter
        let  formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        brthDateTxt.text = formatter.string(from: datepicker.date)
        self.view.endEditing(true)
    }
}
