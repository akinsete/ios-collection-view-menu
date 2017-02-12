//
//  CollectionViewCell.swift
//  Example
//
//  Created by Benjamin Emdon on 2016-12-28.
//  Copyright © 2016 Benjamin Emdon.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

	let titleLabel = UILabel()
	var mainView = UIView()

	override init(frame: CGRect) {
		super.init(frame: frame)

        mainView = (Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?[0] as? HeaderView)!;

        mainView.frame = CGRect(x:0, y:0, width:frame.size.width,height:frame.size.height);
		// subview config
		titleLabel.textAlignment = .left
		mainView.backgroundColor = UIColor.white
		mainView.layer.cornerRadius = 0
        
        mainView.layer.borderColor = UIColor.black.cgColor;
        mainView.layer.borderWidth = 0.5;


		// prepare subviews for layout
		contentView.addSubview(mainView)
		mainView.translatesAutoresizingMaskIntoConstraints = false
		mainView.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		mainView.layoutMargins = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)

		NSLayoutConstraint.activate([
			mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
			mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

			titleLabel.leadingAnchor.constraint(equalTo: mainView.layoutMarginsGuide.leadingAnchor),
			titleLabel.bottomAnchor.constraint(equalTo: mainView.layoutMarginsGuide.bottomAnchor)
			])
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

