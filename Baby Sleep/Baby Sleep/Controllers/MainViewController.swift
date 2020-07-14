//
//  MainViewController.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 12.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    //MARK:- UI
    let topView = UIView()
    let bottomView = UIView()
    let topImage = UIImageView()
    let bottomImage = UIImageView()
    let stopPlayButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        setupTop()
        setupBottom()
        setupStopPlayButton()
    }
    //MARK:- Methods
    
    private func setupTop() {
        topView.backgroundColor = .background
        guard let image = UIImage(named: "TopWave") else { return }
        topImage.image = image
        topImage.contentMode = .scaleToFill
        self.view.addSubview(topView)
        self.view.addSubview(topImage)
        // constraints
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        topImage.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalTo(topView)
        }
        
    }
    
    private func setupBottom() {
        bottomView.backgroundColor = .background
        guard let image = UIImage(named: "BottomWave") else { return }
        bottomImage.image = image
        bottomImage.contentMode = .scaleToFill
        self.view.addSubview(bottomView)
        self.view.addSubview(bottomImage)
        // constraints
        
        bottomView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(307)
        }
        
        bottomImage.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(bottomView)
        }
        
    }
    
    private func setupStopPlayButton() {
        guard let image = UIImage(named: "Pause") else { return }
        stopPlayButton.setImage(image, for: .normal)
        self.view.addSubview(stopPlayButton)
        
        //constraints
        stopPlayButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomView.snp.bottom).inset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    
}
