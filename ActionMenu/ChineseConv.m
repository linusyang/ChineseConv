#import "ActionMenu.h"
#import <AppSupport/CPDistributedMessagingCenter.h>
#define ROCKETBOOTSTRAP_LOAD_DYNAMIC
#import <rocketbootstrap.h>

@interface UIResponder (ChineseConv)
- (BOOL)canPerformAction:(id)sender;
- (void)performAction:(id)sender;
@end

@implementation UIResponder (ChineseConv)

+ (void)load
{
    [[UIMenuController sharedMenuController] registerAction:@selector(performAction:) title:@"Han" canPerform:@selector(canPerformAction:)];
}

- (BOOL)canPerformAction:(id)sender
{
    NSString *selection = [self selectedTextualRepresentation];
    if ([selection length] == 0) {
        return NO;
    }
    if (![self canPerformAction:@selector(paste:) withSender:sender]) {
        return NO;
    }
    NSRegularExpression *chineseRegex = [NSRegularExpression regularExpressionWithPattern:@"[\u4e00-\u9fa5]" options:0 error:nil];
    NSRange range = [chineseRegex rangeOfFirstMatchInString:selection options:0 range:NSMakeRange(0, selection.length)];
    return range.location != NSNotFound;
}

- (void)performAction:(id)sender
{
    NSString *selection = [self selectedTextualRepresentation];
    CPDistributedMessagingCenter *center = [CPDistributedMessagingCenter centerNamed:@"com.linusyang.opencc"];
    rocketbootstrap_distributedmessagingcenter_apply(center);
    NSDictionary *response = [center sendMessageAndReceiveReplyName:@"com.linusyang.opencc.convert" userInfo:@{@"convert": selection}];
    NSString *conv = response[@"convert"];
    if ([conv length] > 0) {
        if ([selection isEqualToString:[self textualRepresentation]]) {
            if ([self respondsToSelector:@selector(selectAll:)]) {
                [self selectAll:sender];
            }
        }
        if ([self respondsToSelector:@selector(insertText:)]) {
            [(id <UIKeyInput>) self insertText:conv];
        }
    }
}

@end
