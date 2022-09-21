//
//  SkillsViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class SkillsViewController: UIViewController {
    
    var name = ""
    var imageIcon = UIImageView()
    
    @IBOutlet weak var skillTxt: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    let skillSet = ["Java", "Angular", "Swift", "Kotlin", "NodeJs", "ReactJs", "DevOps"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 20
        nextButton.layer.masksToBounds = true
        skillTxt.layer.cornerRadius = 25
        skillTxt.layer.masksToBounds = true
        title = "Sign Up"
        //placeholder icon in text field
        imageIcon.image = UIImage(systemName: "calendar.badge.plus")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "text.badge.checkmark")!.size.width, height: UIImage(systemName: "text.badge.checkmark")!.size.height)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "text.badge.checkmark")!.size.width, height: UIImage(systemName: "text.badge.checkmark")!.size.height)
        skillTxt.rightViewMode = .always
        skillTxt.rightView = contentView
        contentView.tintColor = .black

        //pickerview in textfield
        skillTxt.inputView = pickerView
        pickerView.delegate =  self
        pickerView.dataSource = self
        
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext"{
            let destinationVc = segue.destination as? BirthdateViewController
                destinationVc?.name = name
            }
    }

    
    fileprivate func Validation() {
        if let name = skillTxt.text{
            if name == ""{
                openAlert(title: "Alert", message: "Please add Skill.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else{
                performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
    
}

extension SkillsViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return skillSet.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return skillSet[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if skillTxt.text == ""{
            skillTxt.text = skillSet[row]
        }else{
            skillTxt.text?.append(", \(skillSet[row])")
        }
        skillTxt.resignFirstResponder()
    }
    
}
