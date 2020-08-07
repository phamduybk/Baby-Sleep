//
//  MainViewCell.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 17.07.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseUI



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
    
    func configure(with model: Model) {
        image.image = model.image
        nameLabel.text = model.name
        deleteHighlites()
    }
    
    
    func highlights(with model: Model) {
        if isSelected {
            switch model.color {
            case .watterFallColor:
                let color = UIColor.watterFallColor
                makeHighlites(color: color)
            case .forestColor:
                let color = UIColor.forestColor
                makeHighlites(color: color)
            case .streamColor:
                let color = UIColor.streamColor
                makeHighlites(color: color)
            case .seaColor:
                let color = UIColor.seaColor
                makeHighlites(color: color)
            case .rainColor:
                let color = UIColor.rainColor
                makeHighlites(color: color)
            case .stormColor:
                let color = UIColor.stormColor
                makeHighlites(color: color)
            case .hairdryerColor:
                let color = UIColor.hairdryerColor
                makeHighlites(color: color)
            case .whiteNoiseColor:
                let color = UIColor.whiteNoiseColor
                makeHighlites(color: color)
            case .vacuumColor:
                let color = UIColor.vacuumColor
                makeHighlites(color: color)
            case .hoodsColor:
                let color = UIColor.hoodsColor
                makeHighlites(color: color)
            case .carColor:
                let color = UIColor.carColor
                makeHighlites(color: color)
            }
        } else {
            nameLabel.textColor = .white
            nameLabel.layer.shadowRadius = 0.0
            nameLabel.layer.shadowOpacity = 0.0
            nameLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
            nameLabel.layer.masksToBounds = false
        }
    }
    
    private func makeHighlites(color: UIColor) {
        nameLabel.textColor = color
        nameLabel.layer.shadowColor = color.cgColor
        nameLabel.layer.shadowRadius = 3.0
        nameLabel.layer.shadowOpacity = 1.0
        nameLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        nameLabel.layer.masksToBounds = false
        
        contentView.layer.shadowColor = color.cgColor
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
        contentView.layer.masksToBounds = false
    }
    
    func deleteHighlites() {
        nameLabel.textColor = .white
        nameLabel.layer.shadowColor = nil
        contentView.layer.shadowColor = nil
    }
    
    let storageRef = Storage.storage().reference()
    
    func configureWithFirebase(with model: Sound) {
        nameLabel.text = model.titleRu
        let ref = storageRef.child(model.imageUrl)
        image.sd_setImage(with: ref, placeholderImage: UIImage(named: model.titleEn))
    }
    
}
