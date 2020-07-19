//
//  MainViewCell.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 17.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit
import SnapKit

class MainViewCell: UICollectionViewCell {
    
    let image = UIImageView()
    let nameLabel = UILabel()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImage()
        setupNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupImage() {
        contentView.addSubview(image)
        image.contentMode = .scaleAspectFill
        
        image.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(142)
        }
  
    }
    
    private func setupNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.font = UIFont(name: "MontserratAlternates-Regular", size: 16.0)
        nameLabel.textColor = .white
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(image)
            make.top.equalTo(image.snp.bottom).offset(16)
            make.height.equalTo(20)
        }
    }
    
    func configute(with model: Model) {
        image.image = model.image
        nameLabel.text = model.name
        
        switch model.color {
        case .watterFallColor:
            nameLabel.textColor = UIColor.watterFallColor
            nameLabel.layer.shadowColor = UIColor.watterFallColor.cgColor
        case .forestColor:
            nameLabel.textColor = UIColor.forestColor
            nameLabel.layer.shadowColor = UIColor.rainColor.cgColor
        case .streamColor:
            nameLabel.textColor = UIColor.streamColor
            nameLabel.layer.shadowColor = UIColor.streamColor.cgColor
        case .seaColor:
            nameLabel.textColor = UIColor.seaColor
            nameLabel.layer.shadowColor = UIColor.seaColor.cgColor
        case .rainColor:
            nameLabel.textColor = UIColor.rainColor
            nameLabel.layer.shadowColor = UIColor.rainColor.cgColor
        case .stormColor:
            nameLabel.textColor = UIColor.stormColor
            nameLabel.layer.shadowColor = UIColor.stormColor.cgColor
        case .hairdryerColor:
            nameLabel.textColor = UIColor.hairdryerColor
            nameLabel.layer.shadowColor = UIColor.hairdryerColor.cgColor
        case .whiteNoiseColor:
            nameLabel.textColor = UIColor.whiteNoiseColor
            nameLabel.layer.shadowColor = UIColor.whiteNoiseColor.cgColor
        case .vacuumColor:
            nameLabel.textColor = UIColor.vacuumColor
            nameLabel.layer.shadowColor = UIColor.vacuumColor.cgColor
        case .hoodsColor:
            nameLabel.textColor = UIColor.hoodsColor
            nameLabel.layer.shadowColor = UIColor.hoodsColor.cgColor
        case .carColor:
            nameLabel.textColor = UIColor.carColor
            nameLabel.layer.shadowColor = UIColor.carColor.cgColor
        }
    }
    
    
}
