//
//  GovernmentalJobs.swift
//  JobsApp
//
//  Created by Najla Talal on 1/3/22.
//

import UIKit
import Firebase

import FirebaseStorage
import AVFoundation


class GovernmentalJobs: UIViewController {
    
    //MARK: - Variables
    
    let now = Date()
    let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)
    var dateOfRAds = ""
    let db = Firestore.firestore()
    var hr : [RAds] = []
    let ID = Auth.auth().currentUser?.uid
    let storage = Storage.storage()
    let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "btn_click_sound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    var imageUrl : String = ""
    
    @IBOutlet weak var myAdsButton: UIButton!
    weak var collectionView: UICollectionView!
    
    @IBOutlet weak var myAds: UIButton!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    //MARK: - CollectionView
    
    override func loadView() {
        super.loadView()
        segmentedControl.selectedSegmentIndex = 0
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        self.collectionView = collectionView
        
    }
    //MARK: -  ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(GovJobsCell.self, forCellWithReuseIdentifier: "MyCell")
        
     
        
        readdata()
        pastDate.timeAgoDisplay()
        dateToSring()
        
    }
    
    
    @IBAction func selected(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
            
        case 0 :
            readdata()
        case 1 :
            filter(categories: "صحية")
        case 2 :
            filter(categories: "تعليمية")
        case 3 :
            filter(categories: "عسكرية")
        case 4 :
            filter(categories: "ادارية")
        case 5 :
            filter(categories: "مالية")
        case 6 :
            filter(categories: "تقنية")
            
            
        default :
            filter(categories: "الكل")
        }
        
    }
    //MARK: -  Read From Data Firebase
    
    func readdata() {
        db.collection("RecruitmentAdv").order(by: "dateOfRAds", descending: true).addSnapshotListener{ (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                self.hr.removeAll()
                for document in querySnapshot!.documents {
                    let data = document.data()
                    self.hr.append(RAds(title: data["title"] as? String ?? "title", Images: data["imageURL"] as? String ?? "", RecritmentAds: data["RecruitmentAdv"] as? String ?? "" ,categories: "categories", dateOfRAds: data["dateOfRAds"] as? String ?? "", startDate: data["startDate"] as? String ?? "", idAdv: data["idAdv"] as? String ?? ""))
                    print(self.hr)
                }
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    func readdataTest() {
        db.collection("RecruitmentAdv")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    self.hr.removeAll()
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        guard  data.isEmpty != true else {return print("No data from firebase")}
                        self.hr.append(RAds(title: data["title"] as? String ?? "title", Images:"images", RecritmentAds: data["RecruitmentAdv"] as? String ?? "" ,categories: "categories", dateOfRAds: data["dateOfRAds"] as? String ?? "", startDate: data["startDate"] as? String ?? "", idAdv: data["idAdv"] as? String ?? ""))
                        print(self.hr)
                    }
                    self.collectionView.reloadData()
                    
                    
                }
            }
    }
    
}
//MARK: - extension of collectionView

extension GovernmentalJobs: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "DetailsVC") as? DetailsVC{
            vc.titleAd = hr[indexPath.row].title ?? ""
            vc.details = hr[indexPath.row].RecruitmentAds ?? ""
            vc.datelab = hr[indexPath.row].startDate ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        //MARK: - Alert sound
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    //MARK: - Functions of collectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! GovJobsCell
        
        cell.titleLabel.text = hr[indexPath.row].title
        cell.recAdsLabel.text = hr[indexPath.row].RecruitmentAds
        cell.startLabel.text = hr[indexPath.row].startDate
        let date = stringToDate(Date: hr[indexPath.row].dateOfRAds)
        cell.dateOfRAdsLabel.text = date
        if let url = URL(string:hr[indexPath.row].Images) {
            if let data = try? Data(contentsOf: url ) {
                cell.imageAds.image = UIImage(data: data )
            }
        }
        
        
        cell.ShareButton.addTarget(self, action: #selector(presentShareSheet(_:)), for: .touchUpInside)
        cell.ShareButton.tintColor = .gray
        
        //MARK: - UI
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0.09430689365, green: 0.533408463, blue: 0.6434716582, alpha: 1)
        cell.layer.cornerRadius = 10
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return cell
    }
    
    
    
    //MARK: - ShareSheet
    
    
    @objc func presentShareSheet(_ sender: UIButton) {
        guard let image = UIImage(systemName: "bell"),
              let url = URL(string: "https://www.google.com") else {
                  return
              }
        
        let shareSheetVC = UIActivityViewController(
            activityItems: [
                image,
                url
            ], applicationActivities: nil)
        
        present(shareSheetVC , animated: true )
        
    }
    
    
    func filter(categories : String ){
        hr.removeAll()
        db.collection("RecruitmentAdv").whereField( "categories", isEqualTo:  categories ).addSnapshotListener{(querySnapshot, error) in
            
            if let err = error {
                print("Error getting documents: \(err.localizedDescription)")
                
                
                
            } else {
                self.hr.removeAll()
                for document in querySnapshot!.documents {
                    
                    let data = document.data()
                    guard  data.isEmpty != true else {return print("No data from firebase")}
                    self.hr.append(RAds(title: data["title"] as? String ?? "title", Images:"images", RecritmentAds: data["RecruitmentAdv"] as? String ?? "" ,categories: "categories", dateOfRAds: data["dateOfRAds"] as? String ?? "", startDate: data["startDate"] as? String ?? "", idAdv: data["idAdv"] as? String ?? ""))
                    
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    
                }
            }
            
        }
        
    }
    
    
    
}


//MARK: - extension of collectionView

extension GovernmentalJobs: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width - 16, height: 160)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 40
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top:15, left: 8, bottom: 0, right: 8)
    }
    
    
}
//MARK: - extension of Date

extension Date {
    func timeAgoDisplay() -> String {
        let secondsAgo = Int(Date().timeIntervalSince(self))
        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day
        if secondsAgo < minute {
            return "\(secondsAgo) seconds ago"
        } else if secondsAgo < hour {
            return "\(secondsAgo / minute) minutes ago"
        } else if secondsAgo < day {
            return "\(secondsAgo / hour) hours ago"
        } else if secondsAgo < week {
            return "\(secondsAgo / day) days ago"
        }
        return "\(secondsAgo / week) weeks ago"
        
        
    }
}







