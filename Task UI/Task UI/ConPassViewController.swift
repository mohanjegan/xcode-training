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
    var iconClick = false
    var imageIcon = UIImageView()
    
    @IBOutlet weak var conPassTxt: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.layer.cornerRadius = 20
        nextButton.layer.masksToBounds = true
        conPassTxt.layer.cornerRadius = 25
        conPassTxt.layer.masksToBounds = true
        title = "Sign Up"
        
        //eye icon in password field
        
        imageIcon.image = UIImage(systemName: "eye.slash")
        let contentView = UIView()
        contentView.addSubview(imageIcon)
        
        contentView.frame = CGRect(x: 0, y: 0, width: UIImage(systemName: "eye.slash")!.size.width, height: UIImage(systemName: "eye.slash")!.size.height)
        
        imageIcon.frame = CGRect(x: -10, y: 0, width: UIImage(systemName: "eye.slash")!.size.width, height: UIImage(systemName: "eye.slash")!.size.height)
        conPassTxt.rightViewMode = .always
        conPassTxt.rightView = contentView
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
            conPassTxt.isSecureTextEntry = false
        }
        else{
            iconClick = true
            tappedImage.image = UIImage(systemName: "eye.slash")
            conPassTxt.isSecureTextEntry = true
        }
    }
    @IBAction func btnFinishTapped(_ sender: Any) {

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
            let destinationVc = segue.destination as? WelcomeViewController
                destinationVc?.name = name
            }
    }
    
    fileprivate func Validation() {
        if let conpass = conPassTxt.text{
            if conpass == ""{
                openAlert(title: "Alert", message: "Please enter password.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }
            else{
                if password == conPassTxt.text{
                    performSegue(withIdentifier: "goToNext", sender: self)
                }else{
                    openAlert(title: "Alert", message: "Password doesn't match", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                        print("Okay clicked!")
                    }])
                }
            }
        }
    }

}
