//
//  ZLGitHubEventModel.h
//  ZLGitHubClient
//
//  Created by 朱猛 on 2019/7/29.
//  Copyright © 2019 ZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLGithubEventType.h"


typedef NS_ENUM(NSInteger, ZLReferenceType)
{
    ZLReferenceType_Repository,
    ZLReferenceType_Tag
};


NS_ASSUME_NONNULL_BEGIN

@interface ZLActorBriefInfoModel : ZLBaseObject

@property (nonatomic, assign) NSInteger id_eventActor;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *display_login;
@property (nonatomic, strong) NSString * gravatar_id;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *avatar_url;

@end

@interface ZLRepoBriefInfoModel : ZLBaseObject

@property (nonatomic, assign) NSInteger id_repo;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;

@end

@interface ZLCommitInfoModel : ZLBaseObject

@property (nonatomic, strong) NSString *sha;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) BOOL distinct;
@property (nonatomic, assign) NSString *url;

@end


@interface ZLGitHubOrgModel : ZLBaseObject

@property (nonatomic, assign) NSInteger id_org;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *gravatar_id;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *avatar_url;

@end

@interface ZLCommitCommentBriefInfoModel : ZLBaseObject

@property (nonatomic, strong) NSString *id_CommitComment;
@property (nonatomic, strong, nullable) NSString *body;                           // 评论的内容
@property (nonatomic, strong) NSString *html_url;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *node_id;
@property (nonatomic, strong, nullable) NSString *path;
@property (nonatomic, strong, nullable) id position;
@property (nonatomic, strong, nullable) id line;

@property (nonatomic, strong) NSDate *updated_at;
@property (nonatomic, strong) NSDate *created_at;

@property (nonatomic, strong) NSString *commit_id;
@property (nonatomic, strong) NSString *author_association;             // OWNER

@property (nonatomic, strong) ZLGithubUserBriefModel*user;

@end



#pragma mark - Event Payloads

// 评论某次commit
@interface ZLCommitCommentEventPayloadModel : ZLBaseObject

@property (nonatomic, strong) NSString *action;     //!  created

@property (nonatomic, strong) id comment;           // 评论内容

@end


// Push 事件
@interface ZLPushEventPayloadModel : ZLBaseObject

@property (nonatomic, assign) NSInteger push_id;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, assign) NSInteger distinct_size;
@property (nonatomic, strong) NSString *ref;
@property (nonatomic, strong) NSString *head;
@property (nonatomic, strong) NSString *before;
@property (nonatomic, strong) NSArray<ZLCommitInfoModel *> * commits;

@end

//WatchEventPayload
@interface ZLWatchEventPayloadModel : ZLBaseObject

@property (nonatomic, strong) NSString *action;     //! 目前只有stared

@end

//CreateEventPayload
@interface ZLCreateEventPayloadModel : ZLBaseObject

@property (nonatomic, strong) NSString * ref;             //! 提交的sha
@property (nonatomic, assign) ZLReferenceType ref_type;  //! 目前有两种类型：repository、tag
@property (nonatomic, strong) NSString * master_branch;   //! 默认是master
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * pusher_type;

@end



#pragma mark - EventModel

/**
 *  ref  https://docs.github.com/en/developers/webhooks-and-events/github-event-types
 * 
 */
@interface ZLGithubEventModel : ZLBaseObject

@property (nonatomic, strong) NSString * eventId;                       //！ 事件id
@property (nonatomic, assign) ZLGithubEventType type;                   //!  事件类型
@property (nonatomic, strong) ZLActorBriefInfoModel * actor;            //! 事件的操作者
@property (nonatomic, strong) ZLRepoBriefInfoModel *repo;               //! 操作的仓库
@property (nonatomic, strong) id payload;                               //! 事件的负载（根据type不同而不同）
@property (nonatomic, assign, getter=isPub) BOOL pub;
@property (nonatomic, strong) NSDate *created_at;
@property (nonatomic, strong) ZLGitHubOrgModel *org;

@property (nonatomic, readonly) NSString * eventDescription;

@end

NS_ASSUME_NONNULL_END
