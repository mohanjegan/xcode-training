//
//  ViewController.swift
//  MyPermissions
//
//  Created by Mohan on 15/09/22.
//

import UIKit
import SPPermissions

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton(){
        
        let controller = SPPermissions.list([.camera, .microphone, .locationAlwaysAndWhenInUse])
        
        controller.titleText = "Permissions"
        controller.headerText = "Please Allow to get Started"
        controller.footerText = "These are Required!"
    
        controller.present(on: self)
        
    }

}

