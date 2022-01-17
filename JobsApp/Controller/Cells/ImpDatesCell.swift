//
//  ImpDatesCell.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit

class ImpDatesCell: UITableViewCell {
    
    public let visualLayer = CAShapeLayer()
    @IBOutlet weak var ImpDatesLab: UILabel!
    
    
    //MARK: - layoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: -30, bottom: 8, right: -30))
    }
}




