//
//  ViewController.swift
//  Project3
//
//  Created by Đặng Quang Hưng on 11/9/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        if let path = Bundle.main.resourcePath {
            if let items = try? fm.contentsOfDirectory(atPath: path) {
                pictures += items.filter({ $0.hasPrefix("nssl") }).sorted()
                print(pictures)
            }
        }
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
        if let detailVC = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            detailVC.selectedImage = pictures[indexPath.row]
            detailVC.displayName = "Picture \(indexPath.row + 1) of \(pictures.count)"
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

