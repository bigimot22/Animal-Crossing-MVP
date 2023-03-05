//
//  AnimalCell.swift
//  Animal Crossing MVP
//
//  Created by Johandre Delgado Moreno on 3/5/23.
//

import UIKit
import SDWebImage

class AnimalCell: UITableViewCell {
    static let identifier = "AnimalCell"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray6
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = imageCornerRadius
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemIndigo.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AnimalCell {
    func render(title: String, imageUrl: String) {
        nameLabel.text = title
        let url = URL(string: imageUrl)
        imageContainer.sd_setImage(
            with: url,
            placeholderImage: UIImage(systemName: "photo.circle")
        )
    }
    
}

private extension AnimalCell {
    var cellPadding: Double { 16.0 }
    var cellSpacing: Double { 8.0 }
    var imageCornerRadius: Double { 35.0 }
    var imageWidth: Double { 70.0 }
    
    func setupViews() {
        self.addSubview(nameLabel)
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
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor
                .constraint(equalTo: self.topAnchor),
            nameLabel.leadingAnchor
                .constraint(equalTo: imageContainer.trailingAnchor, constant: cellSpacing),
            nameLabel.bottomAnchor
                .constraint(equalTo: self.bottomAnchor),
            nameLabel.trailingAnchor
                .constraint(equalTo: self.trailingAnchor, constant: -cellPadding)
        ])
    }
    
}

