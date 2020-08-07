//
//  MainViewController.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 12.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

private let identifier = "cell"

class MainViewController: UIViewController {
    
    let natureModels: [Model] = [Model(name: "Водопад", image: UIImage(named: "waterFall") ?? UIImage(), audio: "waterFall", color: .watterFallColor),
                                 Model(name: "Лес", image: UIImage(named: "forest") ?? UIImage(), audio: "forest", color: .forestColor),
                                 Model(name: "Ручей", image: UIImage(named: "stream") ?? UIImage(), audio: "stream", color: .streamColor),
                                 Model(name: "Море", image: UIImage(named: "sea") ?? UIImage(), audio: "sea", color: .seaColor),
                                 Model(name: "Дождь", image: UIImage(named: "rain") ?? UIImage(), audio: "rain", color: .rainColor),
                                 Model(name: "Гроза", image: UIImage(named: "storm") ?? UIImage(), audio: "storm", color: .stormColor)
    ]
    
    let noiseModels: [Model] = [Model(name: "Фен", image: UIImage(named: "hairdryer") ?? UIImage(), audio: "hairdryer", color: .hairdryerColor),
                                Model(name: "Белый шум", image: UIImage(named: "whiteNoise") ?? UIImage(), audio: "whiteNoise", color: .whiteNoiseColor),
                                Model(name: "Пылесос", image: UIImage(named: "vacuum") ?? UIImage(), audio: "vacuum", color: .vacuumColor),
                                Model(name: "Вытяжка", image: UIImage(named: "hoods") ?? UIImage(), audio: "hoods", color: .hoodsColor),
                                Model(name: "Авто", image: UIImage(named: "car") ?? UIImage(), audio: "car", color: .carColor)
    ]
    
    var testArray: [Sound] = []
    
    var noiseFlag = false
    var player: AVAudioPlayer?
    
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
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 30, left: 15, bottom: 30, right: 15)
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(MainViewCell.self, forCellWithReuseIdentifier: identifier)
        cv.isUserInteractionEnabled = true
        return cv
    }()
    
    @objc
    
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
        print(testArray)
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
        guard let image = UIImage(named: "Play") else { return }
        stopPlayButton.setImage(image, for: .normal)
        stopPlayButton.addTarget(self, action: #selector(playerPause), for: .touchUpInside)
        self.view.addSubview(stopPlayButton)
        
        //constraints
        stopPlayButton.snp.makeConstraints { make in
            make.bottom.equalTo(bottomImage.snp.bottom).inset(50)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func playerPause(){
        player?.pause()
        stopPlayButton.setImage(UIImage(named: "Play"), for: .normal)
    }
    
    private func setupVolumeSlider() {
        volumeSlider.value = 0.5
        volumeSlider.tintColor = .white
        guard let loudImage = UIImage(named: "SoundLoud") else { return }
        guard let quiteImage = UIImage(named: "SoundQuiet") else { return }
        loudVolumeImage.image = loudImage
        quiteVolumeImage.image = quiteImage
        volumeSlider.addTarget(self, action: #selector(changeVolume), for: .valueChanged)
        self.view.addSubview(volumeSlider)
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
    
    @objc func changeVolume(_ slider: UISlider) {
        let value = volumeSlider.value
        player?.volume = value
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
        noiseFlag = false
        noiseDot.isHidden = true
        noiseLable.titleLabel?.alpha = 0.5
        natureDot.isHidden = false
        natureLabel.titleLabel?.alpha = 1
        collectionView.reloadData()
        
    }
    
    @objc func noiseButtonAction() {
        noiseFlag = true
        natureDot.isHidden = true
        natureLabel.titleLabel?.alpha = 0.5
        noiseDot.isHidden = false
        noiseLable.titleLabel?.alpha = 1
        collectionView.reloadData()
        
    }
    
}



extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 176)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if noiseFlag == true {
            return noiseModels.count
        } else {
            return testArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if noiseFlag == true {
            let model = noiseModels[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MainViewCell else { return UICollectionViewCell() }
            cell.configure(with: model)
            return cell
        } else {
            let model = testArray[indexPath.row]
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? MainViewCell else { return UICollectionViewCell() }
            cell.configureWithFirebase(with: model)
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MainViewCell {
            if noiseFlag == false {
                let model = natureModels[indexPath.row]
                playAudio(audio: model.audio)
                cell.highlights(with: model)
            } else {
                let model = noiseModels[indexPath.row]
                playAudio(audio: model.audio)
                cell.highlights(with: model)
            }
        }
        addHapticFeedback()
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? MainViewCell {
            cell.deleteHighlites()
        }
    }
    
    // Method for start playing
    private func playAudio(audio: String) {
        let urlString = Bundle.main.path(forResource: audio, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            try AVAudioSession.sharedInstance().setCategory(.playback)
            guard let urlString = urlString else { return }
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            guard let player = player else { return }
            player.volume = 0
            player.play()
            player.setVolume(volumeSlider.value, fadeDuration: 60.0)
            stopPlayButton.setImage(UIImage(named: "Pause"), for: .normal)
        } catch {
            print("Play error")
        }
    }
    
    //Method for add Haptic feedback
    private func addHapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
    }
}
