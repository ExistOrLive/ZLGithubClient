//
//  ZLServiceManager.swift
//  ZLServiceFramework
//
//  Created by 朱猛 on 2020/12/31.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit
import SYDCentralPivot

@objcMembers public class ZLServiceManager: NSObject {

    static public var sharedInstance = getSharedInstance()
    
    private static func getSharedInstance() -> ZLServiceManager {
        let bundle = Bundle(for: ZLServiceManager.self)
        if let configPath = bundle.path(forResource: "ZLServiceConfig", ofType: "plist") {
            SYDCentralRouter.sharedInstance().addConfig(withFilePath: configPath, with: bundle)
        }
        return ZLServiceManager()
    }
    
    public func initManager(){
        SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLLoginServiceModel")
        SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLViewerServiceModel")
        
        self.additionServiceModel?.getGithubClientConfig(NSString.generateSerialNumber())
    }
    
    
    public var loginServiceModel : ZLLoginServiceModuleProtocol? {
        return SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLLoginServiceModel") as? ZLLoginServiceModuleProtocol
    }
    
    public var userServiceModel : ZLUserServiceModuleProtocol? {
        return SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLUserServiceModel") as? ZLUserServiceModuleProtocol
    }
    
    public var viewerServiceModel : ZLViewerServiceModuleProtocol? {
        return SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLViewerServiceModel") as? ZLViewerServiceModuleProtocol
    }
    
    public var repoServiceModel : ZLRepoServiceModuleProtocol? {
        return SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLRepoServiceModel") as? ZLRepoServiceModuleProtocol
    }
    
    public var searchServiceModel : ZLSearchServiceModuleProtocol? {
        return SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLSearchServiceModel") as? ZLSearchServiceModuleProtocol
    }
    
    
    public  var additionServiceModel : ZLAdditionServiceModuleProtocol? {
        return SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLAdditionServiceModel") as? ZLAdditionServiceModuleProtocol
    }
    
    public var eventServiceModel : ZLEventServiceModuleProtocol? {
        return SYDCentralFactory.sharedInstance().getSYDServiceBean("ZLEventServiceModel") as? ZLEventServiceModuleProtocol
    }
}
