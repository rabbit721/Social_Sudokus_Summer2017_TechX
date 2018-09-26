//
//  ViewController.swift
//  SocialSudoku
//
//  Created by Katrina Jiao on 07/08/2017.
//  Copyright © 2017 Katrina Jiao. All rights reserved.
//

import UIKit
import Wilddog
import WilddogAuth
import WilddogCore
import WilddogSync

class ViewController: UIViewController {
    
    @IBOutlet weak var LogInButton : UIButton!
    @IBOutlet weak var SignUpButton : UIButton!
    
    static var Users = [(String, String)]()
    static let options = WDGOptions.init(syncURL: "https://wd6368099501aziyvu.wilddogio.com")

    override func viewDidLoad() {
        super.viewDidLoad()
        let options = WDGOptions.init(syncURL: "https://wd6368099501aziyvu.wilddogio.com")
        WDGApp.configure(with: options)
        
        let WDRef = WDGSync.sync().reference()
        let userRef = WDRef.child("Users")
       // auth?.currentUser
        
        
        
        //退出登录
        //try! WDGAuth.auth()!.signOut()
        
        //每个用户都有单独的数据集： Sudoku Age; Identity; Completed Num; Contribution;
        
        // 储存用户数据
//        let WDRef = WDGSync.sync().reference()
//        let userRef = WDRef.child("Users")
//        userRef.child(byAppendingPath: "wxy").setValue(["Username" : "WXY", "Password" : "...", "Status" : "newbie, techician, professors"])
//
//        userRef.child("wxy").child(byAppendingPath:"Achievement").setValue(["Easy" : 1, "Medium" : 1, "Evil" : 1])
        
    }
}

