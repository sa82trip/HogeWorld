//
//  AppDelegate.swift
//  HogeWorld
//
//  Created by GJS on 2019/12/07.
//  Copyright © 2019 GJS. All rights reserved.
//

import UIKit

@UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {
    //이거 넣어줘야 ios11로 바꿨을 때 된다
    //그리고 scene delegate지워야함
    //info.plist가서 scene manifest지워라
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    


}

