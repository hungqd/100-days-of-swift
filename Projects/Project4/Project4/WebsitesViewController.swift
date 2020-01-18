//
//  WebsitesViewController.swift
//  Project4
//
//  Created by Đặng Quang Hưng on 1/18/20.
//  Copyright © 2020 Đặng Quang Hưng. All rights reserved.
//

import UIKit

class WebsitesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Websites"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "siteItemCell")!
        cell.textLabel?.text = websites[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SiteViewController") as!  ViewController
        vc.site = websites[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
