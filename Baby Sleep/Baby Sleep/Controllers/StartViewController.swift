//
//  ViewController.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 10.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
//MARK:- Outlets
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
//MARK:- Methods
    private func setupButton() {
        startButton.backgroundColor = UIColor.buttonColor
        startButton.setTitle("Начать", for: .normal)
        startButton.layer.cornerRadius = 32
        startButton.setTitleColor(.white, for: .normal)
    }
 //MARK:-Actions
    @IBAction func startButtonAction(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
    }
}


