//
//  MainViewController.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 12.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        topView.backgroundColor = .background
        bottomView.backgroundColor = .background

    }

}
