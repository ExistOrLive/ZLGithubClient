//
//  ZLRepositoryTableViewCellData.swift
//  ZLGitHubClient
//
//  Created by 朱猛 on 2019/12/10.
//  Copyright © 2019 ZM. All rights reserved.
//

import UIKit

class ZLRepositoryTableViewCellData: ZLBaseViewModel {
    
    let data : ZLGithubRepositoryModel
    
    
    init(data : ZLGithubRepositoryModel)
    {
        self.data = data;
        super.init()
    }
    
    override func bindModel(_ targetModel: Any?, andView targetView: UIView) {
        
    }
}


extension ZLRepositoryTableViewCellData
{
    func getOwnerAvatarURL() -> String?
    {
        return self.data.owner.avatar_url
    }
    
    func getRepoFullName() -> String?
    {
        return self.data.full_name
    }
    
    func getRepoName() -> String?
    {
        return self.data.name
    }
    
    func getOwnerName() -> String?
    {
        return self.data.owner.loginName
    }
    
    func getRepoMainLanguage() -> String?
    {
        return self.data.language
    }
    
    func getRepoDesc() -> String?
    {
        return self.data.desc_Repo
    }
    
    func isPriva() -> Bool
    {
        return self.data.isPriva
    }
    
    func starNum() -> Int
    {
        return Int(self.data.stargazers_count)
    }
    
    func forkNum() -> Int
    {
        return Int(self.data.forks)
    }
}