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
    
 private let network = NetworkService()
    
    //MARK:- UI
    let startButton = UIButton()
    // View for animation with Lottie
    let backgroundView = AnimationView()
    var sounds: [Sound] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 // get model for nature sounds
        network.fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sound):
                self.sounds = sound
                DispatchQueue.main.async {
                self.setupButton()
                }
            case .failure(let error):
                print(error)
            }
        }
        setupBackgroundView()
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
        let destinationVC = MainViewController()
        destinationVC.natureSounds = sounds
        destinationVC.modalPresentationStyle = .fullScreen
        self.show(destinationVC, sender: nil)
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


