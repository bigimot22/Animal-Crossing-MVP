//
//  AnimalPresenter.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/5/23.
//

import Foundation

protocol AnimalPresenter: AnyObject {
    var animals: [Animal] { get set }
    func getAnimals()
}

class DefaultAnimalPresenter: AnimalPresenter {
    let animalService: AnimalService
    weak var view: AnimalViewProtocol?
    var animals: [Animal]
    
    init(
        animalService: AnimalService,
        view: AnimalViewProtocol? = nil
    ) {
        self.animalService = animalService
        self.view = view
        self.animals = []
    }
    
    func getAnimals() {
        animalService.getAnimals {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(items):
                    self?.animals = items
                    self?.view?.success()
                case let .failure(error):
                    self?.view?.failure(error: error)
                }
            }
        }
    }
    
}
