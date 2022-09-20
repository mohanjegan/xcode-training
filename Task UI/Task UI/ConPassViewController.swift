//
//  ConPassViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class ConPassViewController: UIViewController {

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
    @IBAction func btnFinishTapped(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "WelcomeViewControllerID")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "WelcomeViewControllerID")
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
