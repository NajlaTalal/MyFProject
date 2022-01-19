////
////  MyAds.swift
////  JobsApp
////
////  Created by Najla Talal on 1/18/22.
////
//
//import UIKit
//import Firebase
//class MyAds: UIViewController {
//
//  
//    let firestoreURL = Firestore.firestore()
//    let username = Auth.auth().currentUser?.displayName
//    let now = Date()
//    let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)
//    var dateOfRAds = ""
//    let db = Firestore.firestore()
//    var hr : [RAds] = []
//    let ID = Auth.auth().currentUser?.uid
//    let storage = Storage.storage()
//    var imageUrl : String = ""
//    
//    weak var myAdsCollectionView: UICollectionView!
//    
//    override func loadView() {
//        super.loadView()
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(collectionView)
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//        ])
//        
//        self.myAdsCollectionView = collectionView
//        
//        
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.myAdsCollectionView.backgroundColor = .white
//        self.myAdsCollectionView.dataSource = self
//        self.myAdsCollectionView.delegate = self
//        self.myAdsCollectionView.register(MyAdsCell.self, forCellWithReuseIdentifier: "MyCells")
//        
//        
//        readdata()
//        // Do any additional setup after loading the view.
//    }
//    
//    
//    func readdata() {
//        db.collection("RecruitmentAdv").whereField("emailUser",isEqualTo: Auth.auth().currentUser?.email!).addSnapshotListener{(querySnapshot, error) in
//            if let err = error {
//                      print("Error getting documents: \(err.localizedDescription)")
//                  } else {
//                      self.hr.removeAll()
//                      for document in querySnapshot!.documents {
//                          let data = document.data()
//                 
//                    self.hr.append(RAds(title: data["title"] as? String ?? "title", Images: data["imageURL"] as? String ?? "", RecritmentAds: data["RecruitmentAdv"] as? String ?? "" ,categories: "categories", dateOfRAds: data["dateOfRAds"] as? String ?? "", startDate: data["startDate"] as? String ?? ""))
//                    print(self.hr)
//                }
//                self.myAdsCollectionView.reloadData()
//            }
//        }
//    }
//}
//
//
//extension MyAds: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCells", for: indexPath) as! MyAdsCell
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
//        cell.layer.cornerRadius = 10
//        cell.backgroundColor = #colorLiteral(red: 0.0257745944, green: 0.05412763357, blue: 0.2478517592, alpha: 1)
//        
//        return cell
//    }
//    
//    
//    
//
//    
//    
//    }
//    
//    
//    
//    
//    
// 
//    
//
////MARK: - extension of collectionView
//
//extension MyAds: UICollectionViewDelegateFlowLayout {
//    
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: collectionView.bounds.size.width - 16, height: 160)
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 40
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//    
//    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets.init(top:15, left: 8, bottom: 0, right: 8)
//    }
//    
//   
//}
//
