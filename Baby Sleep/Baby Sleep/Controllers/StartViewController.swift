//
//  ViewController.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 10.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
//MARK:- Outlets
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    let background = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        backgroundImage.image = UIImage(named: "back")
        backgroundImage.contentMode = .scaleAspectFill
    }
//MARK:- Methods
    private func setupButton() {
        startButton.backgroundColor = UIColor.buttonColor
        startButton.setTitle("Начать", for: .normal)
        startButton.layer.cornerRadius = 32
        startButton.setTitleColor(.white, for: .normal)
    }
    
    
//    private func setupBackground() {
//        background.translatesAutoresizingMaskIntoConstraints = false
//        background.image = UIImage(named: "back")
//        background.contentMode = .scaleAspectFill
//        view.addSubview(background)
//
//        background.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        background.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        background.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        background.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
    
 //MARK:-Actions
    @IBAction func startButtonAction(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
    }
}


