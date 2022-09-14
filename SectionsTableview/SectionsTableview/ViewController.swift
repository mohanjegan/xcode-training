//
//  ViewController.swift
//  SectionsTableview
//
//  Created by Mohan on 14/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var tableView: UITableView!
    
    
    let data = [
        ["Apples", "Oranges", "Grapes"],
        ["Cat", "Dog", "Horse", "Cow"],
        ["India", "USA", "UK", "Canada", "Brazil"]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        //table header footer
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        header.backgroundColor = .darkGray
        footer.backgroundColor = .darkGray
        
        let headerLabel = UILabel(frame: header.bounds)
        headerLabel.text = "Table Header"
        headerLabel.textAlignment = .center
        header.addSubview(headerLabel)
        
        let footerLabel = UILabel(frame: footer.bounds)
        footerLabel.text = "Table Footer"
        footerLabel.textAlignment = .center
        footer.addSubview(footerLabel)
        
        
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
        
    
       

    }
}
extension ViewController: UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

extension ViewController: UITableViewDataSource{
    
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20.0
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Section \(section)"
//    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        
        sectionHeaderView.backgroundColor = .lightGray
        
        let sectionHeaderLabel = UILabel(frame: sectionHeaderView.bounds)
        sectionHeaderLabel.text = "Section \(section)"
        sectionHeaderView.addSubview(sectionHeaderLabel)
        
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        
        sectionFooterView.backgroundColor = .lightGray
        
        let sectionFooterLabel = UILabel(frame: sectionFooterView.bounds)
        sectionFooterLabel.text = "Section End"
        sectionFooterView.addSubview(sectionFooterLabel)
        
        return sectionFooterView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        
        cell.backgroundColor = .gray
        return cell
    }
}
