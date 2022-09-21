//
//  NameViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 20
        nextButton.layer.masksToBounds = true
        nameTxt.layer.cornerRadius = 25
        nameTxt.layer.masksToBounds = true
        title = "Sign Up"
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
            let destinationVc = segue.destination as? SkillsViewController
            if let name = nameTxt.text{
                destinationVc?.name = name
            }
            }
    }
    fileprivate func Validation() {
        if let name = nameTxt.text{
            if name == ""{
                openAlert(title: "Alert", message: "Please add Name.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else{
                performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
}
