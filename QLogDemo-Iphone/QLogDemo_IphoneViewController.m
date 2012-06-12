//
//  QLogDemo_IphoneViewController.m
//  QLogDemo-Iphone
//
//  Created by ashik on 25/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QLogDemo_IphoneViewController.h"
#import "QLog.h"

@implementation QLogDemo_IphoneViewController

@synthesize btnSendTextLog = _btnSendTextLog;

- (void)dealloc
{
    [_btnSendTextLog release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) sendTextLogClicked: (id) sender{
    //Make the app crash    
    [NSException raise:@"Invalid foo value" format:@"foo exception"];    
}

@end
