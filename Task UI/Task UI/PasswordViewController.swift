//
//  PasswordViewController.swift
//  Task UI
//
//  Created by Mohan on 20/09/22.
//

import UIKit

class PasswordViewController: UIViewController {
    
    var name = ""
    var iconClick = false
    var imageIcon = UIImageView()
    
    @IBOutlet weak var passwordtxt: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 20
        nextButton.layer.masksToBounds = true
        passwordtxt.layer.cornerRadius = 25
        passwordtxt.layer.masksToBounds = true
        title = "Sign Up"
        
        //eye icon in password field
        
        imageIcon.image = UIImage(systemName: "eye.slash")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.slash")!.size.width, height: UIImage(systemName: "eye.slash")!.size.height)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "eye.slash")!.size.width, height: UIImage(systemName: "eye.slash")!.size.height)
        passwordtxt.rightViewMode = .always
        passwordtxt.rightView = contentView
        contentView.tintColor = .black
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageIcon.isUserInteractionEnabled = true
        imageIcon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer){
        
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if iconClick{
            iconClick = false
            tappedImage.image = UIImage(systemName: "eye")
            passwordtxt.isSecureTextEntry = false
        }
        else{
            iconClick = true
            tappedImage.image = UIImage(systemName: "eye.slash")
            passwordtxt.isSecureTextEntry = true
        }
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
            let destinationVc = segue.destination as? ConPassViewController
                destinationVc?.name = name
            if let password = passwordtxt.text{
                destinationVc?.password = password
            }
            }
    }
    
    fileprivate func Validation() {
        if let pass = passwordtxt.text{
            if pass == ""{
                openAlert(title: "Alert", message: "Please enter password.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else if !pass.validatePassword(){
                openAlert(title: "Alert", message: "Enter Password of minimum Eight characters with atleast one alphabet and one number", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else{
                performSegue(withIdentifier: "goToNext", sender: self)
            }
        }
    }
}
