//
//  ViewController.swift
//  ExpandableSections
//
//  Created by Mohan on 14/09/22.
//

import UIKit

class Section{
    
    let title:String
    let options:[String]
    var isOpened:Bool = false
    init( title:String,
    options:[String],
    isOpened:Bool = false) {
        self.title = title
        self.options = options
        self.isOpened = isOpened
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    private let tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //set up models
        
        sections = [
        
            Section(title: "Fruits", options: ["Apple", "Orange", "Grapes"]),
            Section(title: "Animals", options: ["Dog", "Cat", "Horse", "Goat"]),
            Section(title: "Birds", options: ["Peacock", "Parrot", "Crow"]),
            Section(title: "Countries", options: ["India", "USA", "UK"])
        ]
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        
        if section.isOpened{
            return section.options.count + 1
        }
        else{
            return 1
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0{
           
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .none
        }
        else{
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
            cell.backgroundColor = .lightGray
        }
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0{
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        }
        else{
            print("cell tapped")
        }
    }
    
    
    
}

