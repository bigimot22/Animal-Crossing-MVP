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
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.text = "species"
        return label
    }()
    
    private lazy var speciesIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pawprint.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var speciesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var personalityLabel: UILabel = {
        let label = UILabel()
        label.text = "personality"
        return label
    }()
    
    private lazy var personalityIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "leaf.circle.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var personalityStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        return stack
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
    func render(
        title: String,
        imageUrl: String,
        species: String,
        personality: String
    ) {
        nameLabel.text = title
        speciesLabel.text = species
        personalityLabel.text = personality
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
        speciesStackView.addArrangedSubview(speciesIcon)
        speciesStackView.addArrangedSubview(speciesLabel)
        personalityStackView.addArrangedSubview(personalityIcon)
        personalityStackView.addArrangedSubview(personalityLabel)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(speciesStackView)
        infoStackView.addArrangedSubview(personalityStackView)
        self.addSubview(infoStackView)
        layoutImageContainer()
        layoutInfoStack()
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
    
    func layoutInfoStack() {
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoStackView.topAnchor
                .constraint(equalTo: self.topAnchor, constant: cellSpacing),
            infoStackView.leadingAnchor
                .constraint(equalTo: imageContainer.trailingAnchor, constant: cellSpacing),
            infoStackView.bottomAnchor
                .constraint(equalTo: self.bottomAnchor),
            infoStackView.trailingAnchor
                .constraint(equalTo: self.trailingAnchor, constant: -cellPadding)
        ])
    }
    
}

