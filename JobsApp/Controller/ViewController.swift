//
//  ViewController.swift
//  JobsApp
//
//  Created by Najla Talal on 1/1/22.
//

import UIKit
import Firebase
import AVFoundation

//MARK: - Struct
struct CustomData {
    var title: String
    var url: String
    var backgroundImage: UIImage
}
//MARK: - Class

class ViewController: UIViewController {
    
    //MARK: - Var
    
    @IBOutlet weak var welcome: UILabel!
    var timer = Timer()
    var counter = 0
    let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "btn_click_sound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    let data = [
        CustomData(title: "Mhr", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "Mhr")),
        CustomData(title: "SV2030", url: "maxcodes.io/enroll", backgroundImage: #imageLiteral(resourceName: "SV2030")),
        CustomData(title: "HDF", url: "maxcodes.io/courses", backgroundImage: #imageLiteral(resourceName: "HDF.png"))
        
        
    ]
    //MARK: - collectionView
    
    fileprivate let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    //MARK: -  ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
//        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    //MARK: - alert sound
    
    @IBAction func start(_ sender: Any) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound)
            audioPlayer.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    @IBAction func createAds(_ sender: Any) {
    }
}
//MARK: -  Extension

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.data = self.data[indexPath.item]
        return cell
    }
    
}

//MARK: -  CollectionViewCell

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            bg.image = data.backgroundImage
            
        }
    }
    
    fileprivate let bg: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        
        //MARK: -  addSubview
        
        contentView.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}



