//
//  PrivateSectorJobs.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit

class PrivateSectorJobs: UIViewController {
//    var arrayproduct = [Product1]()
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
//
//extension ViewController: UISearchBarDelegate {
//
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        if searchBar.text?.count == 0 {
//            let alert = UIAlertController(title: "Empty", message: "Please enter product name", preferredStyle: .alert)
//            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
//            alert.addAction(action)
//            present(alert, animated: true, completion: nil)
//
//        }else{
//
//            let request = Product1.fetchRequest()
//            request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!)
//            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//
//
//            do {
//                arrayproduct = try context.fetch(request)
//            } catch {
//                print(error)
//            }
//            tableView.reloadData()
//        }
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
//
//            loadData()
//    }
//
//    }
//
