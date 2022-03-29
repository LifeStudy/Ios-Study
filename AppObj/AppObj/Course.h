//
//  Course.h
//  AppObj
//
//  Created by bruno araujo on 09/03/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Course : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *numberOfLessons;

@end

NS_ASSUME_NONNULL_END
