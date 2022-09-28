//
//  ViewController.swift
//  AlertAndActionSheet
//
//  Created by Mohan on 28/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapAlert(_ sender: Any) {
        alert()
    }
    @IBAction func didTapActionSheet(_ sender: Any) {
        actionSheet()
    }
    func alert(){
        let alert = UIAlertController(title: "Alert", message: "Alert message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Allow", style: .default, handler: { (UIAlertAction) in
            print("Allow Tapped")
        }))
        alert.addAction(UIAlertAction(title: "Allow Once", style: .default, handler: { (UIAlertAction) in
            print("Allow Once Tapped")
        }))
        alert.addAction(UIAlertAction(title: "Deny", style: .destructive, handler: { (UIAlertAction) in
            print("Deny Tapped")
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (UIAlertAction) in
            print("Dismiss Tapped")
        }))
        
        present(alert, animated: true)
        
    }
    func actionSheet(){
        let actionSheet = UIAlertController(title: "Alert", message: "Alert message", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Allow", style: .default, handler: { (UIAlertAction) in
            print("Allow Tapped")
        }))
        actionSheet.addAction(UIAlertAction(title: "Allow Once", style: .default, handler: { (UIAlertAction) in
            print("Allow Once Tapped")
        }))
        actionSheet.addAction(UIAlertAction(title: "Deny", style: .destructive, handler: { (UIAlertAction) in
            print("Deny Tapped")
        }))
        actionSheet.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (UIAlertAction) in
            print("Dismiss Tapped")
        }))
        
        present(actionSheet, animated: true)
        
    }
}

