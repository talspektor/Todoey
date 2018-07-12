//
//  AppDelegate.swift
//  CoreDataTest
//
//  Created by user140592 on 7/10/18.
//  Copyright © 2018 talspektor. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do{
           _ = try Realm()
            
        }catch{
            print("Error initialising new realm, \(error)")
        }
        
        return true
    }
    
}

