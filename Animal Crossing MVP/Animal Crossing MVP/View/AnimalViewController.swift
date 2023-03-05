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

class AnimalViewController: UIViewController {
    var presenter: AnimalPresenter!
    
    lazy var tableview: UITableView = {
      let table = UITableView()
      table.rowHeight = 100
      return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        presenter.getAnimals()
        setViews()
    }


}

extension AnimalViewController: AnimalViewProtocol {
    func success() {
        tableview.reloadData()
    }
    
    func failure(error: Error) {
        print("👀 got error:", error)
        //TODO: Show error view
    }
    
    
}

private extension AnimalViewController {
    func setViews() {
      setListView()
      view.addSubview(tableview)
      addConstraints()
    }
    
    func setListView() {
      tableview.register(AnimalCell.self, forCellReuseIdentifier: AnimalCell.identifier)
      tableview.dataSource = self
    }
    
    func addConstraints() {
      tableview.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        tableview.topAnchor.constraint(equalTo: view.topAnchor),
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    }
    
}

extension AnimalViewController: UITableViewDataSource {
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return presenter.animals.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cell = tableview.dequeueReusableCell(
        withIdentifier: AnimalCell.identifier,
        for: indexPath) as? AnimalCell
    else {
      fatalError("Failed to dequeue a cell with identifier \(AnimalCell.identifier) matching type \(AnimalCell.self)")
    }
    
    let animal = presenter.animals[indexPath.row]
    cell.render(title: animal.name, imageUrl: animal.avatarURL)
    return cell
  }
  
  
}
