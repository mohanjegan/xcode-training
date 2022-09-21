//
//  NameViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 25
        nextButton.layer.masksToBounds = true
        text.layer.cornerRadius = 25
        text.layer.masksToBounds = true
        title = "Sign Up"
    }
    
    @IBAction func btnNextTapped(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "SkillsViewControllerID")
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
            let destinationVc = segue.destination as? SkillsViewController
            if let name = text.text{
                destinationVc?.name = name
            }
            }
    }
   
}