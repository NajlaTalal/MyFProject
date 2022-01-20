//
//  NavigationController.swift
//  JobsApp
//
//  Created by Najla Talal on 1/16/22.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "GovernmentalJobs") as! GovernmentalJobs
        self.present(newViewController, animated: true, completion: nil)
    }
    

}
