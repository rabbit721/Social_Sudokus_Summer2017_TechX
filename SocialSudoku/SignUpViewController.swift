//
//  SignUpViewController.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 07/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import Foundation
import UIKit
import Wilddog
import WilddogAuth
import WilddogCore
import WilddogSync

class SignUpViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var EmailSignUp : UITextField!
    @IBOutlet weak var PasswordSignUp : UITextField!
    @IBOutlet weak var NickNameSignUp : UITextField!
    
    @IBOutlet weak var IdentitySignUp : UIPickerView!
    
    @IBOutlet weak var Join : UIButton!

    static var id = "default"
    
    var ids = ["newbie","hobbyist","professional"]
    
    @IBAction func SignUp(){
        
        if EmailSignUp.text! != ""{
            WDGApp.configure(with: ViewController.options)
            let auth = WDGAuth.auth()
            print(ViewController.Users)
            //邮箱密码登录
            let email = EmailSignUp.text ?? "tomisthebestma@hotmail.com"
            let password = PasswordSignUp.text ?? "123456"
            auth?.createUser(withEmail: "\(email)", password:"\(password)", completion: { (user, error) in
            })
            ViewController.Users.append((email,password))
            
            let WDRef = WDGSync.sync().reference()
            let userRef = WDRef.child("Users")
            let user = userRef.childByAutoId().setValue(["Username" : "\(email)", "Password" : "\(password)", "Status" : "\(SignUpViewController.id)"])
        }else{
            print("alert!")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ids[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //将在滑动停止后触发，并打印出选中列和行索引
        SignUpViewController.id = ids[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        IdentitySignUp.numberOfRows(inComponent: 3)

    }
}
