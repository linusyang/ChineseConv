@interface OpenCC : NSObject {
    void *occ;
}

+ (id)sharedOpenCC;
- (NSString *)convert:(NSString *)orig;

@end
