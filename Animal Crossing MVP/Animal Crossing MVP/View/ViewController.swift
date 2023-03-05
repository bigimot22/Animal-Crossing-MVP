//
//  ViewController.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/4/23.
//

import UIKit

protocol AnimalViewProtocol: AnyObject {
  func success()
  func failure(error: Error)
}

class ViewController: UIViewController {
    var presenter: AnimalPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        presenter.getAnimals()
    }


}

extension ViewController: AnimalViewProtocol {
    func success() {
        print("👀 got items")
    }
    
    func failure(error: Error) {
        print("👀 got error:", error)
    }
    
    
}
