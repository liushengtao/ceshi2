

#import "DataSevice.h"
@implementation DataSevice
#pragma mark -
+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)urlString
                                  params:(NSMutableDictionary *)params  httpMethod:(NSString *)httpMethod globalTimelinePostsWithBlock:(void (^)(NSDictionary *posts, NSError *error))block {
    
    
    if (params==nil) {
        params=[NSMutableDictionary dictionary];
    }
    urlString = [BaseRequestURL stringByAppendingFormat:@"%@",urlString];
    
    NSURL *url = [NSURL URLWithString:urlString];
#pragma mark - GET
    
    
    
    if ([httpMethod isEqualToString:@"GET"] ) {
     
        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer]; //很重要，去掉就容易遇到错误，暂时还未了解更加详细的原因
//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
        AFHTTPRequestOperation*op=[manager GET:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
            if (block) {
                block(responseObject, nil);
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            
            if (block) {
                block(nil, error);
            }
        }];
        return op;
        
    
        
}


#pragma mark - POST
    else
    {
        
        AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer]; //很重要，去掉就容易遇到错误，暂时还未了解更加详细的原因

//        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        AFHTTPRequestOperation*op=[manager POST:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject){
            
            if (block) {
                block(responseObject, nil);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error){
            
            if (block) {
                block(nil, error);
            }
            
        }];
        return op;
    }

}


#pragma mark - 上传图片
+ (NSDictionary *)upImgRequestWithURL:(NSString *)urlstring
                               params:(NSMutableDictionary *)params
                                image:(NSData *)imageData
                        completeBlock:(RequestFinishBlock)block FailedBlock:(RequestFailedBlock)failblock

{
    //拼接URL
    urlstring = [BaseRequestURL stringByAppendingFormat:@"%@",urlstring];
    NSURL *url = [NSURL URLWithString:urlstring];
    __block NSDictionary *result;
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    AFHTTPRequestOperation *op = [manager POST:urlstring parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"photo.jpg" mimeType:@"jpg"];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@ ***** %@", operation.responseString, responseObject);
        
        if (block != nil) {
            block(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (failblock!=nil) {
            failblock(error);
            NSLog(@"Success: %@ ***** %@", operation.responseString, error);

        }
        
    }];
    [op start];
    return result;
    
}
@end
