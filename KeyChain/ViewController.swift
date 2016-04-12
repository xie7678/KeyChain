//
//  ViewController.swift
//  KeyChain
//
//  Created by sam on 12/4/16.
//  Copyright © 2016年 xie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.onSaveChainVindor()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - 通过keychain实现永久保存信息
    /** 用于永久存储手机标示，用于防地推刷单*/
    /** 保存Vindor 标示符 */
    func onSaveChainVindor() {
        let key = KeychainItemWrapper(identifier: "com.xie.KeyChain", accessGroup: nil)
        let idfv = UIDevice.currentDevice().identifierForVendor?.UUIDString
        key.setObject(idfv, forKey: kSecAttrLabel)
    }
    /** 获取Vindor 标示符*/
    func onGetChainVindor() -> String {
        let key = KeychainItemWrapper(identifier: "com.xie.KeyChain", accessGroup: nil)
        let v = key.objectForKey("labl")
        return v as! String
    }
    /** 清空保存信息 */
    func resetKeyChain() {
        let key = KeychainItemWrapper(identifier: "com.xie.KeyChain", accessGroup: nil)
        key.resetKeychainItem()
    }


}

