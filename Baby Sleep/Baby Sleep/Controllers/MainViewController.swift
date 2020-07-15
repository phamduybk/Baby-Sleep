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
    let topImage = UIImageView()
    let topTriangle = UIImageView()
    let bottomImage = UIImageView()
    let bottomTriangle = UIImageView()
    let stopPlayButton = UIButton()
    let volumeSlider = UISlider()
    let loudVolumeImage = UIImageView()
    let quiteVolumeImage = UIImageView()
    let trackSlider = UISlider()
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .background
        setupTopRectangle()
        setupBottomRectangle()
        setupStopPlayButton()
        setupVolumeSlider()
        setupTrackSlider()
        setupCollectionView()
        setupTopTriangle()
        setupBottomTriangle()
    }
    //MARK:- Methods
    
    private func setupTopRectangle() {
        guard let image = UIImage(named: "Rectangletop") else { return }
        topImage.backgroundColor = .background
        topImage.image = image
        topImage.contentMode = .scaleToFill
        self.view.addSubview(topImage)
        
        topImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.16)
        }
    }
    
    private func setupBottomRectangle() {
        guard let image = UIImage(named: "Rectanglebottom") else { return }
        bottomImage.image = image
        bottomImage.backgroundColor = .background
        bottomImage.contentMode = .scaleToFill
        self.view.addSubview(bottomImage)
        
        bottomImage.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(227)
        }
    }
 
    private func setupStopPlayButton() {
        guard let image = UIImage(named: "Pause") else { return }
        stopPlayButton.setImage(image, for: .normal)
        self.view.addSubview(stopPlayButton)
        
        //constraints
        stopPlayButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomImage.snp.bottom).inset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupVolumeSlider() {
        self.view.addSubview(volumeSlider)
        volumeSlider.tintColor = .white
        guard let loudImage = UIImage(named: "SoundLoud") else { return }
        guard let quiteImage = UIImage(named: "SoundQuiet") else { return }
        loudVolumeImage.image = loudImage
        quiteVolumeImage.image = quiteImage
        self.view.addSubview(loudVolumeImage)
        self.view.addSubview(quiteVolumeImage)
        
        // constraint
        
        volumeSlider.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(241)
            make.bottom.equalTo(stopPlayButton.snp.bottom).inset(60)
            
        }
        loudVolumeImage.snp.makeConstraints { make in
            make.centerY.equalTo(volumeSlider)
            make.leading.equalTo(volumeSlider.snp.trailing).offset(16)
        }
        
        quiteVolumeImage.snp.makeConstraints { make in
            make.centerY.equalTo(volumeSlider)
            make.trailing.equalTo(volumeSlider.snp.leading).offset(-16)
        }
    }
    
    private func setupTrackSlider() {
        self.view.addSubview(trackSlider)
        trackSlider.tintColor = .white
        
        
        trackSlider.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(241)
            make.bottom.equalTo(volumeSlider.snp.bottom).inset(66)
        }
    }
    
    private func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .background
 // constraint
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(topImage.snp.bottom)
            make.bottom.equalTo(bottomImage.snp.top)
        }
    }
    
    private func setupTopTriangle() {
        guard let image = UIImage(named: "triangletop") else { return }
        topTriangle.image = image
        self.view.addSubview(topTriangle)
        
        
        topTriangle.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.top.equalTo(topImage.snp.bottom)
            make.width.height.equalTo(80)
        }
    }
    
    private func setupBottomTriangle() {
        guard let image = UIImage(named: "trianglebottom") else { return }
        bottomTriangle.image = image
        self.view.addSubview(bottomTriangle)
        
        bottomTriangle.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalTo(bottomImage.snp.top)
            make.width.height.equalTo(80)
        }
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
