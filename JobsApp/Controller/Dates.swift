//
//  File.swift
//  JobsApp
//
//  Created by Najla Talal on 1/5/22.
//

import Foundation

//MARK: -  Date Function


func dateToSring() -> String{
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let dateString = dateFormatter.string(from: date)
    return dateString
}


func stringToDate(Date: String) -> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from:Date)
    
    return  date?.timeAgoDisplay() ?? ""
}


