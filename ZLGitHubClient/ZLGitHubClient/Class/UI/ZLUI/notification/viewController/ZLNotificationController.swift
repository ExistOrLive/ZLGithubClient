//
//  ZLNotificationController.swift
//  ZLGitHubClient
//
//  Created by 朱猛 on 2020/7/7.
//  Copyright © 2020 ZM. All rights reserved.
//

import UIKit

@objcMembers class ZLNotificationController: ZLBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ZLLocalizedString(string: "Notification", comment: "通知")
        
        self.viewModel = ZLNotificationViewModel.init(viewController: self)
        
        guard let baseView : ZLNotificationView = Bundle.main.loadNibNamed("ZLNotificationView", owner: self.viewModel, options: nil)?.first as? ZLNotificationView else
        {
            return
        }
        self.contentView.addSubview(baseView)
        baseView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // bind view and viewModel
        self.viewModel.bindModel(nil, andView: baseView)
        
    }
    
}