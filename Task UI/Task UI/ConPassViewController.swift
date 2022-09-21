//
//  ConPassViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class ConPassViewController: UIViewController {

    var name = ""
    var password = ""
    
    @IBOutlet weak var conPass: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 25
        nextButton.layer.masksToBounds = true
        conPass.layer.cornerRadius = 25
        conPass.layer.masksToBounds = true
        title = "Sign Up"
    }
    @IBAction func btnFinishTapped(_ sender: Any) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "WelcomeViewControllerID")
//        self.navigationController?.pushViewController(vc, animated: true)
        if password == conPass.text{
            performSegue(withIdentifier: "goToNext", sender: self)
        }else{
            print("password doesn't match")
        }
       
    }
    
    @IBAction func skipBtnTapped(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(identifier: "WelcomeViewControllerID")
//        self.navigationController?.pushViewController(vc, animated: true)
        performSegue(withIdentifier: "goToWelcome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNext"{
            let destinationVc = segue.destination as? WelcomeViewController
                destinationVc?.name = name
            }
    }

}
