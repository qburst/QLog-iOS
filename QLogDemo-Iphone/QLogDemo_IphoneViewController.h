//
//  QLogDemo_IphoneViewController.h
//  QLogDemo-Iphone
//
//  Created by ashik on 25/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLogDemo_IphoneViewController : UIViewController {
   UIButton* _btnSendTextLog;
}

@property (nonatomic,retain) IBOutlet UIButton* btnSendTextLog;

- (IBAction) sendTextLogClicked: (id) sender;

@end
