//
//  StructRecruitmentAds.swift
//  JobsApp
//
//  Created by Najla Talal on 1/4/22.
//

import Foundation
import Firebase

//MARK: -  Struct

struct RAds {
    var title:String
    var Images:String
    var RecruitmentAds:String
    var categories:String
    var dateOfRAds:String
    var startDate: String
    var idAdv: String
    init(title:String,Images:String,RecritmentAds:String,categories:String,dateOfRAds:String, startDate:String, idAdv:String){
        
        self.title = title
        self.Images = Images
        self.RecruitmentAds = RecritmentAds
        self.categories = categories
        self.dateOfRAds = dateOfRAds
        self.startDate = startDate
        self.idAdv = idAdv
    }
}
