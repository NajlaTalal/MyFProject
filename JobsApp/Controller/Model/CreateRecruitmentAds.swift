//
//  RecruitmentAds.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit
import Firebase
import FirebaseStorage

import Photos

class CreateRecruitmentAds: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //MARK: -  Outlet
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var imageDownloaded: UIImageView!
    @IBOutlet weak var imagebu: UIButton!
    @IBOutlet weak var adsTV: UITextView!
    @IBOutlet weak var datePickerbu: UIDatePicker!
    @IBOutlet weak var segmentLabel: UISegmentedControl!
    
    let arrayCat = [" الكل","صحيه","تعليمية","عسكريه"]
    
    var imageSendFiresbase : UIImage?
    //MARK: - Variables
    var imagePickerController = UIImagePickerController()
    let db = Firestore.firestore()
    let firestoreURL = Firestore.firestore()
    let username = Auth.auth().currentUser?.displayName
    var date = ""
    var catSelected = 0
    
    //MARK: -  ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentLabel.removeAllSegments()
        for x in 0..<arrayCat.count {
            print(x)
            segmentLabel.insertSegment(withTitle: arrayCat[x], at: x, animated: true)
        }
        catSelected = segmentLabel.selectedSegmentIndex
        date = dateToSring()
        
        
        imagePickerController.delegate = self
        checkPermissions()
    }
    //MARK: - Date picker
    @IBAction func datePicker(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let pick = dateFormatter.string(from: datePickerbu.date)
        date = pick
        
        
    }
    
    
    
    @IBAction func segmentAction(_ sender: Any) {
        catSelected = segmentLabel.selectedSegmentIndex
    }
    
    
    
    
    
    //MARK: - Firebase Data
    
    @IBAction func addBu(_ sender: Any) {
        
        // here call upload image
        //        uploadToCloud(fileURL: URL)
        guard imageSendFiresbase != nil else {return }  // here you can ad alert to show user upload data
        uploadToCloud(image: imageSendFiresbase!)
        
    }
    
    //MARK: - Upload and download Images
    
    
    
    
    
    
    
    @IBAction func getImage(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated:  true, completion:  nil)
        
    }
    
    
    @IBAction func pullImageTapped(_ sender: Any) {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        //        let ref = storageRef.child("UploadPhotoOne")
        //        imageDownloaded.sd_setImage(with: ref)
    }
    
    func checkPermissions() {
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized {
            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in
                ()
            })
        }
        
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
        } else {
            PHPhotoLibrary.requestAuthorization(requestAuthroizationHandler)
        }
    }
    func requestAuthroizationHandler(status: PHAuthorizationStatus) {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            print("We have access to photos")
        } else {
            print("We dont have access to photos")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageSendFiresbase = image
        }
        
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    func uploadToCloud(image:UIImage) {
        let storage = Storage.storage()
        
        let storageRef = storage.reference()
        
        if let imageSend = image.pngData() {
            
            let nameImage = UUID().uuidString
            let photoRef = storageRef.child("\(nameImage)")
            
            photoRef.putData(imageSend, metadata: nil) { StorageMetadata, error in
                if error == nil {
                    photoRef.downloadURL { url, error in
                        if error == nil {
                            print(url!)
                            
                            self.firestoreURL.collection("RecruitmentAdv")
                                .addDocument(data:[ "title": self.titleTF.text! ,
                                                    "RecruitmentAdv": self.adsTV.text!,
                                                    "dateOfRAds": self.date,
                                                    "startDate":  self.date,
                                                    "imageURL": "\(url!)",
                                                    "categories": self.arrayCat[self.catSelected]
                                                  ])
                            
                            
                            
                            print("Successfully saved data")
                            //                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                            //                        let vc = storyBoard.instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
                            //
                            //                        self.present(vc, animated: true, completion: nil)
                            self.performSegue(withIdentifier: "moveHome", sender: self)
                            
                        }
                    }
                }
            }
            //        let uploadTask = photoRef.putFile(from: localFule, metadata: nil) { (metadata, err) in
            //            guard let metadata = metadata else {
            //                print(err?.localizedDescription)
            //                return
            //            }
            //            photoRef.downloadURL { [self] urlImage, error in
            //                if error == nil {
            //                    print(urlImage!)
            //                    //here upload data to firestore with url image
            //                    self.firestoreURL.collection("RecruitmentAdv")
            //                        .addDocument(data: [
            //
            //
            //                            "Images":urlImage! ,
            //                            //                "categories": categories!
            //                        ])
            //                    { (error) in
            //                        if let e = error {
            //                            print(e.localizedDescription)
            //
            //                        } else {
            //
            //                            print("Successfully saved data")
            //                        }
            //                    }
            //                }
            //            }
        }
        
    }
    
    
    
    
}


