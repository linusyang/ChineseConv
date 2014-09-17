#import "OpenCC.h"
#import <AppSupport/CPDistributedMessagingCenter.h>
#define ROCKETBOOTSTRAP_LOAD_DYNAMIC
#import <rocketbootstrap.h>

%hook SpringBoard

- (id)init
{
    self = %orig;
    CPDistributedMessagingCenter *center = [CPDistributedMessagingCenter centerNamed:@"com.linusyang.opencc"];
    rocketbootstrap_distributedmessagingcenter_apply(center);
    [center registerForMessageName:@"com.linusyang.opencc.convert" target:self selector:@selector(handleOpenCCMessage:userInfo:)];
    [center runServerOnCurrentThread];
    return self;
}

%new
- (NSDictionary *)handleOpenCCMessage:(NSString *)name userInfo:(NSDictionary *)userInfo
{
    return @{@"convert": [[OpenCC sharedOpenCC] convert:userInfo[@"convert"]]};
}

%end