//
//  ViewController.swift
//  Shopping
//
//  Created by Đặng Quang Hưng on 5/14/20.
//  Copyright © 2020 Đặng Quang Hưng. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var items: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share))
    }

    @objc
    private func share() {
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }

    @objc
    private func addItem() {
        let ac = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        ac.addTextField { (textField: UITextField) in
            textField.placeholder = "Enter item"
        }
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            if let `self` = self,
                let text = ac.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                !text.isEmpty {
                self.items.insert(text, at: 0)
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
        }))
        present(ac, animated: true)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
}

