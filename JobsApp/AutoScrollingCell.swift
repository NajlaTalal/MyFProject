//
//  AutoScrollingCell.swift
//  JobsApp
//
//  Created by Najla Talal on 1/1/22.
//

import UIKit

class AutoScrollingCell: UICollectionViewCell {
    
    let cellID = "cellID"
    
    let info = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height - 20)
        info.frame = CGRect(x: 0, y: 0, width: contentView.frame.width - 30 , height: self.frame.height)
        info.textColor = #colorLiteral(red: 0.1674584448, green: 0.3054045737, blue: 0.260445863, alpha: 1)
//        info.shadowOffset = CGSize(width: 1, height: 1)
//        info.shadowColor = #colorLiteral(red: 0.1674584448, green: 0.3054045737, blue: 0.260445863, alpha: 1)
        info.font = .boldSystemFont(ofSize: 17)
        info.numberOfLines = 0
        info.textAlignment = .right
//        info.font = UIFont(name: "Amiri-Bold", size: 23)
        self.addSubview(info)
        
        }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
