//
//  ViewController.swift
//  PodSideMenu
//
//  Created by Mohan on 28/09/22.
//
import SideMenu
import UIKit

class ViewController: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    private let infoController = InfoViewController()
    private let settingsController = SettingsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let menu = MenuController(with: SideMenuItems.allCases)
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.rightMenuNavigationController  = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        addChildController()
        
    }
    
    @IBAction func didTapMenuBtn(){
        present(sideMenu!, animated: true)
    }
    
    private func addChildController(){
        addChild(infoController)
        addChild(settingsController)
        
        view.addSubview(infoController.view)
        view.addSubview(settingsController.view)
        
        infoController.view.frame = view.bounds
        settingsController.view.frame = view.bounds
        
        infoController.didMove(toParent: self)
        settingsController.didMove(toParent: self)
        
        settingsController.view.isHidden = true
        infoController.view.isHidden = true
    }
    
    func didSelectMenuItem(named: SideMenuItems) {
        sideMenu?.dismiss(animated: true, completion: nil)
        title = named.rawValue
        
        switch named{
        case.home:
            settingsController.view.isHidden = true
            infoController.view.isHidden = true
        case.info:
            settingsController.view.isHidden = true
            infoController.view.isHidden = false
        case.settings:
            settingsController.view.isHidden = false
            infoController.view.isHidden = true
        }
    }
}


