//
//  ViewController.swift
//  AlertAndActionSheet
//
//  Created by Mohan on 28/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnToast: UIButton!
    @IBOutlet weak var btnCustomToast: UIButton!
    @IBOutlet weak var btnAlert: UIButton!
    @IBOutlet weak var btnActionSheetAlert: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnToast.layer.cornerRadius = 5
        btnCustomToast.layer.cornerRadius = 5
        btnAlert.layer.cornerRadius = 5
        btnActionSheetAlert.layer.cornerRadius = 5

    }
    
    @IBAction func didTapToast(_ sender: Any) {
        toast()
    }
    @IBAction func didTapCustomToast(_ sender: Any) {
        customToast()
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
    
    func toast(){
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.width/2-75, y: self.view.frame.height-100, width: 150, height: 50))
        toastLabel.text = "Toast Test"
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.6)
        toastLabel.alpha = 1.0
        toastLabel.textColor = .white
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 2.0, delay: 1.0, options: .curveEaseInOut, animations: {toastLabel.alpha = 0.0}) {
            (isCompleted) in
            toastLabel.removeFromSuperview()
        }
        
    }
    func customToast(){
        self.view.showToast(toastMessage: "Custom Toast Message", duration: 1.1)
//        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.width/2-75, y: self.view.frame.height-100, width: 150, height: 50))
//        toastLabel.text = "Custom Toast Test"
//        toastLabel.textAlignment = .center
//        toastLabel.backgroundColor = UIColor.red.withAlphaComponent(0.6)
//        toastLabel.alpha = 1.0
//        toastLabel.textColor = .white
//        toastLabel.layer.cornerRadius = 10
//        toastLabel.clipsToBounds = true
//
//
//        self.view.addSubview(toastLabel)
//
//        UIView.animate(withDuration: 2.0, delay: 1.0, options: .curveEaseInOut, animations: {toastLabel.alpha = 0.0}) {
//            (isCompleted) in
//            toastLabel.removeFromSuperview()
//        }
//        toastLabel.isUserInteractionEnabled = true
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTouchToast))
//        gesture.numberOfTouchesRequired = 1
//        gesture.numberOfTapsRequired = 1
//        toastLabel.addGestureRecognizer(gesture)
        
    }
//    @objc private func didTouchToast(){
//        print("toast tapped")
//        alert()
//    }
}


//Toast UIView extension

//MARK: Add Toast method function in UIView Extension so can use in whole project.
extension UIView
{
    @objc private func didTouchToast(){
        print("toast tapped")
    }
func showToast(toastMessage:String,duration:CGFloat)
{
//View to blur bg and stopping user interaction
let bgView = UIView(frame: self.frame)
bgView.backgroundColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(255.0/255.0), alpha: CGFloat(0.6))
bgView.tag = 555
    
    bgView.isUserInteractionEnabled = true
    let gesture = UITapGestureRecognizer(target: self, action: #selector(didTouchToast))
    gesture.numberOfTouchesRequired = 1
    gesture.numberOfTapsRequired = 1
    bgView.addGestureRecognizer(gesture)

//Label For showing toast text
let lblMessage = UILabel()
lblMessage.numberOfLines = 0
lblMessage.lineBreakMode = .byWordWrapping
lblMessage.textColor = .white
lblMessage.backgroundColor = .black
lblMessage.textAlignment = .center
lblMessage.font = UIFont.init(name: "Helvetica Neue", size: 17)
lblMessage.text = toastMessage

//calculating toast label frame as per message content
let maxSizeTitle : CGSize = CGSize(width: self.bounds.size.width-16, height: self.bounds.size.height)
var expectedSizeTitle : CGSize = lblMessage.sizeThatFits(maxSizeTitle)
// UILabel can return a size larger than the max size when the number of lines is 1
expectedSizeTitle = CGSize(width:maxSizeTitle.width.getminimum(value2:expectedSizeTitle.width), height: maxSizeTitle.height.getminimum(value2:expectedSizeTitle.height))
lblMessage.frame = CGRect(x:((self.bounds.size.width)/2) - ((expectedSizeTitle.width+16)/2) , y: (self.bounds.size.height/2) - ((expectedSizeTitle.height+16)/2), width: expectedSizeTitle.width+16, height: expectedSizeTitle.height+16)
lblMessage.layer.cornerRadius = 8
lblMessage.layer.masksToBounds = true
//lblMessage.padding = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
bgView.addSubview(lblMessage)
self.addSubview(bgView)
lblMessage.alpha = 0

UIView.animateKeyframes(withDuration:TimeInterval(duration) , delay: 0, options: [] , animations: {
lblMessage.alpha = 1
}, completion: {
sucess in
UIView.animate(withDuration:TimeInterval(duration), delay: 8, options: [] , animations: {
lblMessage.alpha = 0
bgView.alpha = 0
})
bgView.removeFromSuperview()
})
}
}
extension CGFloat
{
func getminimum(value2:CGFloat)->CGFloat
{
if self < value2
{
return self
}
else
{
return value2
}
}
}

//MARK: Extension on UILabel for adding insets - for adding padding in top, bottom, right, left.
//
//extension UILabel
//{
//private struct AssociatedKeys {
//static var padding = UIEdgeInsets()
//}
//
//var padding: UIEdgeInsets? {
//get {
//return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
//}
//set {
//if let newValue = newValue {
//    objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//}
//}
//}
//
//override open func draw(_ rect: CGRect) {
//if let insets = padding {
//    self.drawText(in: rect.inset(by: insets))
//} else {
//self.drawText(in: rect)
//}
//}
//
//override open var intrinsicContentSize: CGSize {
//get {
//var contentSize = super.intrinsicContentSize
//if let insets = padding {
//contentSize.height += insets.top + insets.bottom
//contentSize.width += insets.left + insets.right
//}
//return contentSize
//}
//}
//}

