//
//  LoginTableViewController.swift
//  Login-CoreData
//
//  Created by Mohan on 13/09/22.
//

import UIKit

private var models = [User_Details]()

class LoginTableViewController: UITableViewController {
    
    struct Credential: Codable{
        var email:String
        var password: String
    }
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.dismissKeyboard()
    }
    
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        ValidationCode()
    }
    
    @IBAction func btnSignupClicked(_ sender: UIButton) {
        if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
    }
    

}

extension LoginTableViewController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tableViewHeight = self.tableView.frame.height
        let contentHeight = self.tableView.contentSize.height
        
        let centeringInset = (tableViewHeight - contentHeight) / 2.0
        let topInset = max(centeringInset, 0.0)
        
        self.tableView.contentInset = UIEdgeInsets(top: topInset, left: 0.0, bottom: 0.0, right: 0.0)
    }
}

extension LoginTableViewController{
    fileprivate func ValidationCode() {
        if let email = txtEmail.text, let password = txtPassword.text{
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else{
                validateUser()
//                checkId(logemail: email, logpassword: password)
//                Navigation - Home Screen
            }
        }else{
            openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
        }
    }
 //coredata
//    func checkId(logemail: String, logpassword: String) {
//
//        do {
//
//                   try context.fetch(User_Details.fetchRequest())
//            DispatchQueue.main.async { [self] in
//                    let item = User_Details(context: context)
//                    if(item.email == logemail)
//                    {
//                        if(item.password == logpassword){
//                            print("logged in")
//                        }
//                        else{
//                            print("password incorrect")
//                        }
//                    }
//                    else{
//                        print("invalid email")
//                    }
//                   }
//               }
//               catch  {
//                   //error
//               }
//    }
    
    
    func validateUser(){
        if let email = txtEmail.text, let password = txtPassword.text
        {
           let data = UserDefaults.standard.value(forKey: "credentials") as! Data
        if let users = try? PropertyListDecoder().decode(Array<Credential>.self, from: data){
            
            let credential = Credential(email: email, password: password)
            
            for user in users{
                if user.email == credential.email{
                    if user.password == credential.password{
                      //gotowelcome page
                        print("welcome")
                        
                        break
                    }else{
                        print("wrong password")
                        openAlert(title: "Alert", message: "Wrong password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                            print("Okay clicked!")
                        }])
                    }
                }else{
                    print("invalid email")
                    openAlert(title: "Alert", message: "email not found", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                        print("Okay clicked!")
                    }])
                }
            }
        }
        }else{
            print("error")
        }
}

}

