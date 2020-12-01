// ----------------------------------------------------------------------------
//
//  MainViewControllerPresenter.swift
//  Baby Sleep
//
//  Created by Aleksandr Serov on 01.12.2020.
//  Copyright © 2020 Aleksandr Serov. All rights reserved.
//
// ----------------------------------------------------------------------------

import FirebaseDatabase
import Foundation

// ----------------------------------------------------------------------------

protocol MainViewControllerProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

protocol MainVCPresenterProtocol {
    init(view: MainViewControllerProtocol, networkService: NetworkService)
    var sounds: [SoundModel]? { get set }
    func getSound()
}

class MainVCPresenter: MainVCPresenterProtocol {
    
    weak var view: MainViewControllerProtocol?
    private let networkService: NetworkService
    var sounds: [SoundModel]?


    required init(view: MainViewControllerProtocol, networkService: NetworkService) {
        self.view = view
        self.networkService = networkService
    }

    func getSound() {
        networkService.fetchData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let sound):
                self.sounds = sound
                DispatchQueue.main.async {
                    self.view?.succes()
                }
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
}
