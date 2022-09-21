//
//  WelcomeViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    var name = ""
    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "Welcome \(name)!"
    }
//    @IBAction func btnBackClicked(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//    }


}
