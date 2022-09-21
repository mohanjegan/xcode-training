//
//  BirthdateViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class BirthdateViewController: UIViewController {
    var name = ""
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
        
        brthDateTxt.inputView = datepicker
        brthDateTxt.textAlignment = .center
        createDatePicker()
        //placeholder icon on textfield
        brthDateTxt.rightViewMode = .always
        let rightView  = UIImageView(frame: CGRect(x: brthDateTxt.frame.width-30, y: brthDateTxt.frame.height/2-10, width: 25, height: 20))
        rightView.tintColor = .black
        rightView.image = UIImage(systemName: "calendar.badge.plus")
        brthDateTxt.addSubview(rightView)
    }
    @IBAction func btnNextTapped(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "PasswordViewControllerID")
//        self.navigationController?.pushViewController(vc, animated: true)
        performSegue(withIdentifier: "goToNext", sender: self)
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "WelcomeViewControllerID")
//        self.navigationController?.pushViewController(vc, animated: true)
        performSegue(withIdentifier: "goToWelcome", sender: self)
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
            
            //date picker style
            datepicker.preferredDatePickerStyle = .wheels
            
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext"{
            let destinationVc = segue.destination as? PasswordViewController
                destinationVc?.name = name
            }
    }
}
