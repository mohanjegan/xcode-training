//
//  ViewController.swift
//  Json-in-collectionview
//
//  Created by Mohan on 26/09/22.
//

import UIKit
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

struct Hero: Decodable {
    let localized_name: String
    let img: String
}

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var heros = [Hero]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        let url = URL(string: "https://api.opendota.com/api/herostats")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil{
                do{
                    self.heros = try JSONDecoder().decode([Hero].self, from: data!)
                }catch{
                    print("json error")
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()                }
            }
        }.resume()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  heros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.nameLbl.text = heros[indexPath.row].localized_name.capitalized
       
        
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + heros[indexPath.row].img

        cell.imageView.downloaded(from: completeLink)
        
        cell.imageView.clipsToBounds = true
        cell.imageView.layer.cornerRadius = cell.imageView.frame.width / 2
        cell.imageView.contentMode = .scaleAspectFill
        return cell
    }

}

