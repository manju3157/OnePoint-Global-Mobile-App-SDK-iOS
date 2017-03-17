//
//  OPGChangePassword.h
//  OnePointSDK
//
//  Created by OnePoint Global on 01/08/16.
//  Copyright © 2016 OnePointGlobal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OPGChangePassword : NSObject
/*!
 * @brief isSuccess : bool value of true indicates success and false indicates failure.
 */
@property (nonatomic,strong) NSNumber *isSuccess;
/*!
 * @brief statusMessage : Status message.
 */
@property (nonatomic,strong) NSString *statusMessage;
@end
