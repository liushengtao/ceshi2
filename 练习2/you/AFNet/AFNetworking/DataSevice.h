
#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"
#import "AFNetworking.h"
@interface DataSevice : NSObject
typedef void(^RequestFinishBlock)(id result);
typedef void(^RequestFailedBlock)(NSError*failed);
#pragma mark - GET OR POST
+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)urlString
                                    params:(NSMutableDictionary *)params  httpMethod:(NSString *)httpMethod globalTimelinePostsWithBlock:(void (^)(NSDictionary *posts, NSError *error))block;



+ (NSDictionary *)upImgRequestWithURL:(NSString *)urlstring
                               params:(NSMutableDictionary *)params
                                image:(NSData *)imageData
                        completeBlock:(RequestFinishBlock)block FailedBlock:(RequestFailedBlock)failblock;
@end
