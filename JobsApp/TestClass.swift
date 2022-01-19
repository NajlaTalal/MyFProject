//
//  TestClass.swift
//  JobsApp
//
//  Created by Najla Talal on 1/19/22.
//

import UIKit

class TestClass: UIViewController {

    @IBOutlet weak var segmentTest: UISegmentedControl!
    
    let arrTitle = ["fahad","Ali","Njla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentTest.removeAllSegments()
        for indexNumber in 0..<arrTitle.count{
            print(indexNumber)
            segmentTest.insertSegment(withTitle: arrTitle[indexNumber], at: indexNumber, animated: true)
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func actionSelected(_ sender: Any) {
        print(arrTitle[segmentTest.selectedSegmentIndex])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
