//
//  BirthdateViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class BirthdateViewController: UIViewController {
    
    var name = ""
    var imageIcon = UIImageView()
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var brthDateTxt: UITextField!
    let datepicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 20
        nextButton.layer.masksToBounds = true
        brthDateTxt.layer.cornerRadius = 25
        brthDateTxt.layer.masksToBounds = true
        title = "Sign Up"
        brthDateTxt.inputView = datepicker
        createDatePicker()
        //placeholder icon on textfield
        imageIcon.image = UIImage(systemName: "calendar.badge.plus")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "calendar.badge.plus")!.size.width, height: UIImage(systemName: "calendar.badge.plus")!.size.height)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "calendar.badge.plus")!.size.width, height: UIImage(systemName: "calendar.badge.plus")!.size.height)
        brthDateTxt.rightViewMode = .always
        brthDateTxt.rightView = contentView
        contentView.tintColor = .black
    }
    @IBAction func btnNextTapped(_ sender: Any) {

        Validation()
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "WelcomeViewControllerID")
//        self.navigationController?.pushViewController(vc, animated: true)
        performSegue(withIdentifier: "goToWelcome", sender: self)
    }
    
    fileprivate func Validation() {
        if let name = brthDateTxt.text{
            if name == ""{
                openAlert(title: "Alert", message: "Please add Date of Birth.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else{
                performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
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
            brthDateTxt.inputView = datepicker
            datepicker.preferredDatePickerStyle = .wheels
            datepicker.datePickerMode = .date
            datepicker.maximumDate = Date()

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
