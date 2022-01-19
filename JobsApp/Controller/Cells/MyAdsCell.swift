////
////  MyAdsCell.swift
////  JobsApp
////
////  Created by Najla Talal on 1/18/22.
////
//
//import UIKit
//
//class MyAdsCell: UICollectionViewCell {
//    //MARK: - lets
//
//    let titleLabel = UILabel(frame: CGRect(x: 100, y: 30,  width: 250 , height: 30 ))
//    let recAdsLabel = UILabel(frame: CGRect(x: 100, y: 50,  width: 250 , height: 30 ))
//    let dateOfRAdsLabel = UILabel(frame: CGRect(x: 10, y: 5,  width: 250 , height: 30 ))
//    let startLabel =  UILabel(frame: CGRect(x: 50, y: 100,  width: 250 , height: 30 ))
//    let imageAds =  UIImageView(frame: CGRect(x: 50, y: 50,  width: 50 , height: 30 ))
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        //MARK: - UILabel
//
//        let textLabel = UILabel(frame: .zero)
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(textLabel)
//        NSLayoutConstraint.activate([
//            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//
//        ])
//
//
//        self.contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        contentView.addSubview(titleLabel)
//        contentView.addSubview(recAdsLabel)
//        contentView.addSubview(dateOfRAdsLabel)
//
//        contentView.addSubview(startLabel)
//
//        contentView.addSubview(imageAds)
//        //MARK: - UI
//
//        titleLabel.textAlignment = .right
//        titleLabel.font = UIFont(name: "Tajawal-Medium", size: 15)
//        recAdsLabel.textAlignment = .right
//        recAdsLabel.font = UIFont(name: "Tajawal-Medium", size: 18)
//
//        recAdsLabel.textColor = #colorLiteral(red: 0.0257745944, green: 0.05412763357, blue: 0.2478517592, alpha: 1)
//        dateOfRAdsLabel.textAlignment = .left
//        dateOfRAdsLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//        startLabel.textColor = #colorLiteral(red: 0.0257745944, green: 0.05412763357, blue: 0.2478517592, alpha: 1)
//
//}
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//
//        fatalError("Interface Builder is not supported!")
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        fatalError("Interface Builder is not supported!")
//    }
//
//
//
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//
//    }
//
//}
