//
//  QLog.h
//  QLog
//
//  Created by vipin on 10/11/11.
//  Copyright 2011 QBurst Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QLog : NSObject {
    
}
+ (void) setupLogging;
+ (QLog *)singletonInstance;

@end

void QLogExceptionHandler(NSException *exception);