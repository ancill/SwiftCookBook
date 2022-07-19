//
//  ViewController.swift
//  AnimeViewer
//
//  Created by 19072382 on 16.07.2022.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]() {
        didSet {
            pictures.sort { $0 > $1 }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "AnimeViewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            print(items)
            if item.hasPrefix("photo") {
                pictures.append(item)
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action:
            #selector(shareApp))
    }
    
    @objc func shareApp() {
  
        guard let myWebsite = URL(string: "http://itunes.apple.com/app/idXXXXXXXXX") else {
            print("No app found")
            return
        }
                
        let objectsToShare = ["Send my app to friends", myWebsite] as [Any]
        let vc = UIActivityViewController(activityItems: [objectsToShare], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as? DetailsViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.totalPictureCount = pictures.count
            vc.numberOfPicture = indexPath.row + 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
