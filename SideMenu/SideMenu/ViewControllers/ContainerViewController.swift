//
//  ViewController.swift
//  SideMenu
//
//  Created by Mohan on 27/09/22.
//

import UIKit



class ContainerViewController: UIViewController {
    
    enum MenuState{
        case opened
        case closed
    }

    private var menuState: MenuState = .closed

    let menuVc = MenuViewController()
    let homeVc = HomeViewController()
    var navVc:UINavigationController?
    lazy var infoVc = InfoViewController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        addChildVcs()
    }
    private func addChildVcs(){
        //Menu
        menuVc.delegate = self
        addChild(menuVc)
        view.addSubview(menuVc.view)
        menuVc.didMove(toParent: self)
        
        //Home
        homeVc.delegate = self
        let navVc = UINavigationController(rootViewController: homeVc)
        addChild(navVc)
        view.addSubview(navVc.view)
        navVc.didMove(toParent: self)
        self.navVc = navVc
    }

}

extension ContainerViewController: HomeViewControllerDelegate{
    func didTapMenu() {
        toggleMenu(completion: nil)
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState{
        case .closed:
            //open it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVc?.view.frame.origin.x = self.homeVc.view.frame.size.width-100

                
            } completion: { [weak self] done in
                if done{
                    self?.menuState = .opened
                }
            }

        
        case .opened:
            //close it
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                
                self.navVc?.view.frame.origin.x = 0
                
            } completion: { [weak self] done in
                if done{
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}

extension ContainerViewController: MenuViewControllerDelegate{
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        toggleMenu (completion: nil)
        switch menuItem{
        case .home:
            self.resettohome()
        case .info:
            //Add info child view
            self.addinfo()
        case .appRating:
            break
        case .settings:
            break
        }
    }
     
    func addinfo(){

        let vc = infoVc
        homeVc.addChild(vc)
        homeVc.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVc)
        homeVc.title  = vc.title
    }
    
    func resettohome(){
        infoVc.view.removeFromSuperview()
        infoVc.didMove(toParent: nil)
        homeVc.title = "Home"
    }
}

