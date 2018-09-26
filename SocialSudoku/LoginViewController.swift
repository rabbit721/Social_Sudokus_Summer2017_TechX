//
//  LoginViewController.swift
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

class LoginViewController : UIViewController{
    @IBOutlet weak var userNameLog : UITextField!
    @IBOutlet weak var passwordLog : UITextField!
    //"Go" button goes to ProfilePage
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func LogInButtonClicked(){
        let options = WDGOptions.init(syncURL: "https://wd6368099501aziyvu.wilddogio.com")
        WDGApp.configure(with: options)
        let auth = WDGAuth.auth()
        
        //邮箱密码登录
        auth?.signIn(withEmail: "\(userNameLog.text)", password:"\(passwordLog.text)", completion: { (user, error) in
            let alertControllers = UIAlertController(title: "Something went wrong",message: "Combination of login email and password",preferredStyle: .alert)
            let cancelActions = UIAlertAction(title: "Cancel",style: .cancel,handler: nil)
            let okActions = UIAlertAction(title: "Set",style: .default,handler: nil)
            alertControllers.addAction(cancelActions)
            alertControllers.addAction(okActions)
            
            self.present(alertControllers, animated: true, completion: nil)
        })

    }
            //wilddog update status: user has logged in
    
}
