#import "OpenCC.h"
#import "opencc/opencc.h"

#define OPENCC_CONFIG "/Library/ActionMenu/Plugins/ChineseConv/convert.json"

@implementation OpenCC

+ (id)sharedOpenCC {
    static dispatch_once_t pred = 0;
    static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self) {
        occ = opencc_new(OPENCC_CONFIG);
    }
    return self;
}

- (void)dealloc
{
    if (occ != NULL) {
        opencc_delete(occ);
        occ = NULL;
    }
    [super dealloc];
}

- (NSString *)convert:(NSString *)orig
{
    if ([orig length] == 0) {
        return nil;
    }
    NSString *result = orig;
    if (occ != NULL) {
        try {
            char *conv = opencc_convert(occ, orig.UTF8String);
            if (conv != NULL) {
                result = [NSString stringWithCString:conv encoding:NSUTF8StringEncoding];
                opencc_free_string(conv);
            }
        } catch (std::runtime_error& e) {}
    }
    return result;
}

@end
    