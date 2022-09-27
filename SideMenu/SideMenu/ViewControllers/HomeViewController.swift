//
//  HomeViewController.swift
//  SideMenu
//
//  Created by Mohan on 27/09/22.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func didTapMenu()
}
class HomeViewController: UIViewController {

    weak var delegate: HomeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Home"
        navigationItem.leftBarButtonItem  = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenu))

    }

    @objc func didTapMenu(){
        
        delegate?.didTapMenu()
        
    }

}
