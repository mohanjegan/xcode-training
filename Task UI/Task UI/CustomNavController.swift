//
//  CustomNavController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class CustomNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    

  

}
