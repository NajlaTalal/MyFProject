//
//  DetailsVC.swift
//  JobsApp
//
//  Created by Najla Talal on 1/11/22.
//

import UIKit

class DetailsVC: UIViewController {
    
    //MARK: -  Outlet
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var detailslabel: UILabel!
    
    //MARK: - Variables
    var titleAd = ""
    var details = ""
    //MARK: -  ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        titlelabel.text = titleAd
        detailslabel.text = details
        titlelabel.textColor = #colorLiteral(red: 0.0257745944, green: 0.05412763357, blue: 0.2478517592, alpha: 1)
        titlelabel.font = UIFont(name: "Tajawal-Medium", size: 30)
        titlelabel.textAlignment = .center
        detailslabel.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        detailslabel.font = UIFont(name: "Tajawal-Medium", size: 18)
        detailslabel.textAlignment = .center
      
    }
    
    
    
    
    
}

