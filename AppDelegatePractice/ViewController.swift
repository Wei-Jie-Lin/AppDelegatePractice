//
//  ViewController.swift
//  AppDelegatePractice
//
//  Created by 林暐潔 on 2016/11/15.
//  Copyright © 2016年 林暐潔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showNumber: UILabel!
    
    //方法一
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //方法一
    func sayHi(noti:Notification) {
        showNumber.text = String(appDelegate.appStatusCount)
    }
    
    
    
//    //方法二
//    var pageCount = 0
//    
//    //方法二
//    func inBackground(){
//        pageCount -= 1
//        showNumber.text = "\(pageCount)"
//        print("inBackground : \(pageCount)")
//    }
//    //方法二
//    func inForeground(){
//        pageCount += 2
//        showNumber.text = "\(pageCount)"
//        print("inForeground : \(pageCount)")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //方法一
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.sayHi(noti:)), name: Notification.Name.UIApplicationDidEnterBackground, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.sayHi(noti:)), name: Notification.Name.UIApplicationWillEnterForeground, object: nil)
        
        
//        //方法二
//        //background: enteredTimes - 1
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.inBackground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
//        
//        //foreground: enteredTimes + 2
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.inForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

