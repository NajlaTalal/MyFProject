//
//  LunchScreen.swift
//  JobsApp
//
//  Created by Najla Talal on 1/8/22.
//

import UIKit
import Lottie
class LunchScreen: UIViewController {
    
    //MARK: -  ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureAnimation()
    }
    
    //MARK: - Anamation
    
    func configureAnimation() {
        let animation = Animation.named("lf20_uqpfhc4y")
        let animationView = AnimationView(animation:animation)
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: 0, y: 0, width: 320, height: 320)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:{
            self.present(vc, animated: true, completion: nil)
        })
    }
}
