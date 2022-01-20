//
//  MyAds.swift
//  JobsApp
//
//  Created by Najla Talal on 1/18/22.
//

import UIKit
import Firebase
class MyAds: UIViewController {
    
    
    let firestoreURL = Firestore.firestore()
    let username = Auth.auth().currentUser?.displayName
    let now = Date()
    let pastDate = Date(timeIntervalSinceNow: -60 * 60 * 24)
    var dateOfRAds = ""
    let db = Firestore.firestore()
    var hr : [RAds] = []
    let ID = Auth.auth().currentUser?.uid
    let storage = Storage.storage()
    var imageUrl : String = ""
    var idProject = ""
    weak var myAdsCollectionView: UICollectionView!
    
    override func loadView() {
        super.loadView()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        self.myAdsCollectionView = collectionView
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myAdsCollectionView.backgroundColor = .white
        self.myAdsCollectionView.dataSource = self
        self.myAdsCollectionView.delegate = self
        self.myAdsCollectionView.register(MyAdsCell.self, forCellWithReuseIdentifier: "MyCells")
        view.layer.cornerRadius = 10
        
        readdata()
        // Do any additional setup after loading the view.
    }
    
    
    func readdata() {
        db.collection("RecruitmentAdv").whereField("emailUser",isEqualTo: Auth.auth().currentUser?.email!  ).addSnapshotListener{(querySnapshot, error) in
            if let err = error {
                print("Error getting documents: \(err.localizedDescription)")
            } else {
                self.hr.removeAll()
                for document in querySnapshot!.documents {
                    let data = document.data()
                    
                    self.hr.append(RAds(title: data["title"] as? String ?? "title", Images: data["imageURL"] as? String ?? "", RecritmentAds: data["RecruitmentAdv"] as? String ?? "" ,categories: "categories", dateOfRAds: data["dateOfRAds"] as? String ?? "", startDate: data["startDate"] as? String ?? "", idAdv: data["idAdv"] as? String ?? "" ))
                    
                    print(self.hr)
                }
                self.myAdsCollectionView.reloadData()
            }
        }
    }
    //MARK: - SignOutButton
    
    @IBAction func Signout(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "تنبيه", message: "هل أنت متأكد أنك تريد تسجيل الخروج؟", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "تسجيل الخروج", style: .destructive) { action in
            
            do {
                try Auth.auth().signOut()
                self.dismiss(animated: true, completion: nil)
            } catch {
                print(error.localizedDescription)
            }
        }
        
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
        //
        //        let firebaseAuth = Auth.auth()
        //    do {
        //      try firebaseAuth.signOut()
        //    } catch let signOutError as NSError {
        //      print("Error signing out: %@", signOutError)
        //    }
    }
}


extension MyAds: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCells", for: indexPath) as! MyAdsCell
        cell.layer.borderWidth = 1
        cell.layer.borderColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        cell.layer.cornerRadius = 10
        cell.backgroundColor = #colorLiteral(red: 0.0257745944, green: 0.05412763357, blue: 0.2478517592, alpha: 1)
        
        cell.titleLabel.text = hr[indexPath.row].title
        cell.recAdsLabel.text = hr[indexPath.row].RecruitmentAds
        cell.startLabel.text = hr[indexPath.row].startDate
        self.idProject = hr[indexPath.row].idAdv
        cell.deleteButton.addTarget(self, action:  #selector(delete), for: .touchUpInside)
        let date = stringToDate(Date: hr[indexPath.row].dateOfRAds)
        cell.dateOfRAdsLabel.text = date
        
        if let url = URL(string:hr[indexPath.row].Images) {
            if let data = try? Data(contentsOf: url ) {
                cell.imageAds.image = UIImage(data: data )
            }
        }
        
        return cell
    }
    
    
    @objc func delete(sender: UIButton!) {
        
        let alert = UIAlertController(title: "تنبية" , message: "هل تريد حذف الاعلان ؟", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "نعم", style: .default) { action in
            
            self.db.collection("RecruitmentAdv").document(self.idProject).delete() { err in
                if let err = err {
                    print("Error removing document: \(err.localizedDescription)")
                } else {
                    
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "الغاء", style: .cancel , handler: nil ))
        present(alert, animated: true , completion: nil)
        
    }
    
}








//MARK: - extension of collectionView

extension MyAds: UICollectionViewDelegateFlowLayout {
    
    
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

