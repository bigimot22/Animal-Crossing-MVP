//
//  AnimalCell.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/5/23.
//

import UIKit

class AnimalCell: UITableViewCell {
    static let identifier = "AnimalCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemIndigo
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageCornerRadius
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AnimalCell {
    func render(title: String, imageUrl: String) {
        titleLabel.text = title
        let url = URL(string: imageUrl)
        imageContainer.image = UIImage(systemName: "photo.circle")
    }
    
}

private extension AnimalCell {
    var cellPadding: Double { 16.0 }
    var cellSpacing: Double { 8.0 }
    var imageCornerRadius: Double { 34.0 }
    var imageWidth: Double { 100.0 }
    
    func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(imageContainer)
        layoutImageContainer()
        layoutTitle()
    }
    
    func layoutImageContainer() {
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageContainer.topAnchor
                .constraint(equalTo: self.topAnchor, constant: cellPadding),
            imageContainer.leadingAnchor
                .constraint(equalTo: self.leadingAnchor, constant: cellPadding),
            imageContainer.bottomAnchor
                .constraint(equalTo: self.bottomAnchor, constant: -cellPadding),
            imageContainer.widthAnchor
                .constraint(equalToConstant: imageWidth)
        ])
    }
    
    func layoutTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor
                .constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor
                .constraint(equalTo: imageContainer.trailingAnchor, constant: cellSpacing),
            titleLabel.bottomAnchor
                .constraint(equalTo: self.bottomAnchor),
            titleLabel.trailingAnchor
                .constraint(equalTo: self.trailingAnchor, constant: -cellPadding)
        ])
    }
    
}

