//
//  ViewController.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 10.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit
import SnapKit
import Lottie
import FirebaseDatabase

class StartViewController: UIViewController {
    
    //MARK:- UI
    let startButton = UIButton()
    // View for animation with Lottie
    let backgroundView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
        setupButton()
    }
    
    //MARK:- Methods
    private func setupButton() {
        startButton.backgroundColor = UIColor.buttonColor
        startButton.setTitle("Начать", for: .normal)
        startButton.layer.cornerRadius = 32
        startButton.setTitleColor(.white, for: .normal)
        startButton.titleLabel?.font = UIFont(name: "MontserratAlternates-Black", size: 25.0)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        self.view.addSubview(startButton)
        // set constrains
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(182)
            make.height.equalTo(64)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    }
  
    @objc private func startButtonAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupBackgroundView() {
        self.view.addSubview(backgroundView)
        backgroundView.contentMode = .scaleAspectFill
        let animation = Animation.named("background")
        backgroundView.animation = animation
        backgroundView.play()
        backgroundView.loopMode = .loop
        
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
    }
 
}


