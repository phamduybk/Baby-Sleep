//
//  MainViewController.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 12.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit
import SnapKit

private let identifier = "cell"

class MainViewController: UIViewController {
    
    let natureModels: [Model] = [Model(name: "Водопад", image: UIImage(named: "waterFall") ?? UIImage(), audio: "waterFall"),
                           Model(name: "Лес", image: UIImage(named: "forest") ?? UIImage(), audio: "forest"),
                           Model(name: "Ручей", image: UIImage(named: "stream") ?? UIImage(), audio: "stream"),
                           Model(name: "Море", image: UIImage(named: "sea") ?? UIImage(), audio: "sea"),
                           Model(name: "Дождь", image: UIImage(named: "rain") ?? UIImage(), audio: "rain"),
                           Model(name: "Гроза", image: UIImage(named: "storm") ?? UIImage(), audio: "rain")
    ]
    
    let noiseModels: [Model] = [
        
    ]
    
    
    //MARK:- UI
    let topImage = UIImageView()
    let topTriangle = UIImageView()
    let natureLabel = UIButton()
    let natureDot = UIImageView()
    let noiseDot = UIImageView()
    let noiseLable = UIButton()
    let bottomImage = UIImageView()
    let bottomTriangle = UIImageView()
    let stopPlayButton = UIButton()
    let volumeSlider = UISlider()
    let loudVolumeImage = UIImageView()
    let quiteVolumeImage = UIImageView()
    let trackSlider = UISlider()
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 50, left: 35, bottom: 80, right: 35)
        layout.minimumLineSpacing = 50
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MainViewCell.self, forCellWithReuseIdentifier: identifier)
        return cv
    }()
    
    //    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
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
        setupNatureLabel()
        setupNoiseLabel()
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
            make.height.equalTo(148)
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
    
    private func setupNatureLabel() {
        natureLabel.setTitle("Природа", for: .normal)
        natureLabel.titleLabel?.font = UIFont(name: "MontserratAlternates-Regular", size: 20.0)
        natureLabel.tintColor = .white
        natureLabel.addTarget(self, action: #selector(natureButtonAction), for: .touchUpInside)
        self.view.addSubview(natureLabel)
        
        guard  let image = UIImage(named: "Oval") else { return }
        natureDot.image = image
        self.view.addSubview(natureDot)
        
        natureLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(60)
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(24)
            make.width.equalTo(101)
        }
        
        natureDot.snp.makeConstraints { make in
            make.width.height.equalTo(6)
            make.centerX.equalTo(natureLabel)
            make.top.equalTo(natureLabel.snp.bottom).offset(5)
        }
        
    }
    
    private func setupNoiseLabel() {
        noiseLable.setTitle("Шум", for: .normal)
        noiseLable.titleLabel?.font = UIFont(name: "MontserratAlternates-Regular", size: 20.0)
        noiseLable.tintColor = .white
        noiseLable.titleLabel?.alpha = 0.5
        noiseLable.addTarget(self, action: #selector(noiseButtonAction), for: .touchUpInside)
        self.view.addSubview(noiseLable)
        
        guard  let image = UIImage(named: "Oval") else { return }
        noiseDot.image = image
        noiseDot.isHidden = true
        self.view.addSubview(noiseDot)
        
        
        noiseLable.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(61)
            make.top.equalToSuperview().offset(80)
            make.height.equalTo(24)
            make.width.equalTo(53)
        }
        
        noiseDot.snp.makeConstraints { make in
            make.height.width.equalTo(6)
            make.centerX.equalTo(noiseLable)
            make.top.equalTo(noiseLable.snp.bottom).offset(5)
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
        collectionView.delegate = self
        collectionView.dataSource = self
        
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

    @objc func natureButtonAction() {
        noiseDot.isHidden = true
        noiseLable.titleLabel?.alpha = 0.5
        natureDot.isHidden = false
        natureLabel.titleLabel?.alpha = 1
    }
    
    @objc func noiseButtonAction() {
           natureDot.isHidden = true
           natureLabel.titleLabel?.alpha = 0.5
        noiseDot.isHidden = false
        noiseLable.titleLabel?.alpha = 1
       }

}



extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 176)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MainViewCell else { return UICollectionViewCell() }
        cell.configute(with: model)
        return cell
    }
}
