//
//  WelcomeViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let alert = UIAlertController(title: "Welcome", message: "Hello", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler:nil)
//        self.present(alert, animated: true)
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
