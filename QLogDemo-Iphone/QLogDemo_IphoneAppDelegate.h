//
//  QLogDemo_IphoneAppDelegate.h
//  QLogDemo-Iphone
//
//  Created by ashik on 25/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QLogDemo_IphoneViewController;

@interface QLogDemo_IphoneAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet QLogDemo_IphoneViewController *viewController;

@end
