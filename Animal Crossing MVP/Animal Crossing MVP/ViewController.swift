//
//  ViewController.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/4/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        let ns = RemoteAnimalService(client: DefaultHTTPClient())
        ns.getCharacters { result in
            switch result {
            case let .success(items):
                print("👀 Items:", items)
            case let .failure(error):
                print("👀 Error:", error)
            }
        }
    }


}

