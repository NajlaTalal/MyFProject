//
//  Login.swift
//  JobsApp
//
//  Created by Najla Talal on 1/2/22.
//

import UIKit
import Firebase
import AVFoundation


class Login: UIViewController {
    
    //MARK: - Variables
    
    let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "btn_click_sound", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
  
    //MARK: -  ViewDidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.setLeftImage(imageName: "envelope")
        emailTF.setUnderLine()
        passwordTF.setLeftImage(imageName: "lock")
        passwordTF.setUnderLine()
        
    }
    
    //MARK: -  Login
    
    @IBAction func LoginBu(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTF.text!, password: passwordTF.text!) { [self] user, error in
            if error == nil {
                self.performSegue(withIdentifier: "move", sender: nil)
            }else{
                print("error",error?.localizedDescription)
                let alert = UIAlertController(title: "تنبيه ", message: "البريد الألكتروني او كلمة المرور خطأ ، أعد المحاولة", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            //MARK: -  alert sound
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: sound)
                audioPlayer.play()
            } catch {
                // couldn't load file :(
            }
        }
        
      
    }
   
    @IBAction func resetPass(_ sender: Any) {
    
    
}
}
//MARK: -  Extension TextField

extension UITextField{
    
    func setLeftImage(imageName:String) {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        self.leftView = imageView;
        self.leftViewMode = .always
    }
}
