//
//  ImportantDates.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit
import Firebase

class ImportantDates: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    //MARK: - Variables
    
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredData:[String]!
    var arr:[String] = [
 """
 اختبار القدرات العامة

يبدأ التسجيل تاريخ 22/2/2022

وينتهي  تاريخ 3/3/2022
""",
        """
اختبار الرخصة المهنية

يبدأ التسجيل تاريخ 15/3/2022

وينتهي تاريخ 30/3/2022

""" ,
        """

القبول الموحد للجامعات

يبدأ التسجيل تاريخ 20/4/2022

وينتهي تاريخ 30/4/2022

""",
    """

الاختبار التحصيلي

يبدأ التسجيل تاريخ 23/2/2022

وينتهي تاريخ 2/3/2022

""",
        """
اختبار القدرة المعرفية

يبدأ التسجيل تاريخ 19/6/2022

وينتهي تاريخ 28/7/2022

"""
    ]
    
    
    //MARK: - TableView
    
    @IBOutlet weak var ImpDateTableView: UITableView!
    
    //MARK: -  ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImpDateTableView.delegate = self
        ImpDateTableView.dataSource = self
        searchBar.delegate = self
        filteredData = arr
        hideKeyboardWhenTappedAround()
    }
    
    
    //MARK: -  TableView Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImpDatesCell
        cell.textLabel?.text = filteredData[indexPath.row]
        
        //MARK: -  UI
        
        
        // you can also put image here
        let separatorLineView = UIView(frame: CGRect(x: 20, y: 20, width: cell.frame.size.width, height:  cell.frame.size.height))
        
        cell.contentView.addSubview(separatorLineView)
        cell.contentView.backgroundColor = #colorLiteral(red: 0.09430689365, green: 0.533408463, blue: 0.6434716582, alpha: 1)
        cell.contentView.tintColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        
        cell.textLabel!.textAlignment = .right
        cell.textLabel!.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cell.textLabel!.font = UIFont(name: "Tajawal-Medium", size: 15)
        cell.textLabel!.numberOfLines = 6
        cell.layer.borderWidth = 1
        cell.contentView.frame.size = CGSize(width: 100, height: 100)
        cell.layer.borderColor = #colorLiteral(red: 0.0257745944, green: 0.05412763357, blue: 0.2478517592, alpha: 1)
        cell.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    //MARK: -  TableView Functions
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 140
        } else {
            return 70
        }
    }
    
    
    
    
    
    
    //MARK:- Search Bar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = []
        if searchText == "" {
            filteredData = arr
        }else{
            for impDate in arr {
                if impDate.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(impDate)
                }
            }
        }
        self.ImpDateTableView.reloadData()
    }
    
    
}
