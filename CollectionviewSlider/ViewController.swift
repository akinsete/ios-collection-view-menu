//
//  ViewController.swift
//  Example
//
//  Created by Benjamin Emdon on 2016-12-28.
//  Copyright © 2016 Benjamin Emdon. 
//

import UIKit
import CenteredCollectionView

class ViewController: UIViewController {

	let centeredCollectionView = CenteredCollectionView()
	let cellPercentWidth: CGFloat = 0.7
	var scrollToEdgeEnabled = false
    
    @IBOutlet weak var label_menu_name: UILabel!
    var menus = [String]();

    @IBOutlet weak var containerView: UIView!
    
	override func viewDidLoad() {
		super.viewDidLoad()
        
        menus.append("Create")
        menus.append("Show")
        menus.append("Edit")
        menus.append("Sell")
        menus.append("Jayven")
        
        label_menu_name.text = menus[0]
    
		view.backgroundColor = UIColor.lightGray
		centeredCollectionView.backgroundColor = UIColor.clear
		view.backgroundColor = UIColor.white

		// delegate & data source
		centeredCollectionView.delegate = self
		centeredCollectionView.dataSource = self

		// layout subviews
		let stackView = UIStackView()
		stackView.axis = .vertical
        stackView.distribution  = UIStackViewDistribution.equalSpacing

		stackView.addArrangedSubview(centeredCollectionView)

        //centeredCollectionView.backgroundColor = UIColor.darkGray
		containerView.addSubview(stackView)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
			stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
			])
//
//		// register collection cells
		centeredCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))

		// configure layout
		centeredCollectionView.itemSize = CGSize(width: view.bounds.width * cellPercentWidth, height: view.bounds.height * cellPercentWidth * cellPercentWidth)
		//centeredCollectionView.minimumLineSpacing = 10
        
		centeredCollectionView.showsVerticalScrollIndicator = false
		centeredCollectionView.showsHorizontalScrollIndicator = false
        
    }
}


extension ViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("Selected Cell #\(indexPath.row)")
//        if (scrollToEdgeEnabled){let currentCenteredPage = centeredCollectionView.currentCenteredPage}; currentCenteredPage != indexPath.row {
//			centeredCollectionView.scrollTo(index: indexPath.row, animated: true)
//		}
	}
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return menus.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as! CollectionViewCell
		//cell.titleLabel.text = "Cell #\(indexPath.row)"
		return cell
	}

	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        label_menu_name.text = menus[centeredCollectionView.currentCenteredPage]

		print("Current centered index:" + String(centeredCollectionView.currentCenteredPage))
	}

	func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        label_menu_name.text = menus[centeredCollectionView.currentCenteredPage]

		print("Current centered index: " + String(centeredCollectionView.currentCenteredPage))
	}
}

