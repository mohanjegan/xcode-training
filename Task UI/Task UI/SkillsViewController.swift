//
//  SkillsViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class SkillsViewController: UIViewController {
    
    var name = ""
    @IBOutlet weak var skill: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    let skillSet = ["Java", "Angular", "Swift", "Kotlin", "NodeJs", "ReactJs", "DevOps"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 25
        nextButton.layer.masksToBounds = true
        skill.layer.cornerRadius = 25
        skill.layer.masksToBounds = true
        //placeholder icon in text field
        skill.rightViewMode = .always
        let rightView  = UIImageView(frame: CGRect(x: skill.frame.width-30, y: skill.frame.height/2-10, width: 25, height: 20))
        rightView.tintColor = .black
        rightView.image = UIImage(systemName: "text.badge.checkmark")
        skill.addSubview(rightView)
        title = "Sign Up"
        
        pickerView.delegate =  self
        pickerView.dataSource = self
        
        skill.inputView = pickerView
        skill.textAlignment = .center
        
    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "BirthdateViewControllerID")
//        self.navigationController?.pushViewController(vc, animated: true)
        performSegue(withIdentifier: "goToNext", sender: self)
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
        if skill.text == ""{
            skill.text = skillSet[row]
        }else{
        skill.text?.append(", \(skillSet[row])")
        }
        skill.resignFirstResponder()
    }
    
}
