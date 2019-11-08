//
//  ViewController.swift
//  Project1
//
//  Created by Đặng Quang Hưng on 11/9/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        if let path = Bundle.main.resourcePath {
            if let items = try? fm.contentsOfDirectory(atPath: path) {
                pictures += items.filter({ $0.hasPrefix("nssl") })
                print(pictures)
            }
        }
    }


}

