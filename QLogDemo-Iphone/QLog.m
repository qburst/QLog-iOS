//
//  QLog.m
//  QLog
//
//  Created by vipin on 10/11/11.
//  Copyright 2011 QBurst Technologies. All rights reserved.
//

#import "QLog.h"
#import "ASIFormDataRequest.h"

#define QLOG_BASE_URL @"http://djangowebservices.qburst.com/qlogwebservices/summarylog/"
#define QLOG_DETAILED_BASE_URL @"http://djangowebservices.qburst.com/qlogwebservices/detailedreport/"
#define LOG_MEGGASE_TAG @"log_msg"
#define MODEL_TAG @"model"
#define BRAND_TAG @"brand"
#define VERSION_TAG  @"version"
#define TIMESTAMP_TAG @"timestamp"
#define APP_ID_TAG @"app_id"
#define SEVERITY_TAG @"severity"
#define AVAILABLE_MEMORY_TAG @"avail_mem"
#define TOTAL_MEMORY_TAG @"total_mem"
#define NETWORK_STATUS_TAG @"status"

#define SEVERITY_DEBUG @"debug"
#define SEVERITY_CRITICAL @"critical"

static QLog *instance = NULL;

@implementation QLog

// for singleton access.

+ (QLog *)singletonInstance {
	
	@synchronized(self){
		if (!instance || instance == NULL) {
			instance = [[QLog alloc] init];
		}
		return instance;
	}
}

/*
 * Static method called to initialize Qlog
 *
 * For implementation, call [QLog setupLogging] in AppDelegate.m
 *
 */
+ (void) setupLogging{
	NSSetUncaughtExceptionHandler (&QLogExceptionHandler);
}

-(ASIFormDataRequest *) getRequestForReport:(NSString*)report severity:(NSString*)severity isDetailedReport:(BOOL)isDetailedReport{
	
	NSString *url ;
	if (isDetailedReport)
		url= [NSString stringWithFormat:QLOG_DETAILED_BASE_URL];
	else
		url = [NSString stringWithFormat:QLOG_BASE_URL];
	NSURL *requestUrl = [NSURL URLWithString:url];
	
	ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:requestUrl];
	[request setPostValue:report forKey:LOG_MEGGASE_TAG];
    [request setPostValue:[[UIDevice currentDevice] model] forKey:MODEL_TAG];
	[request setPostValue:[[UIDevice currentDevice] name] forKey:BRAND_TAG];
	[request setPostValue:[[UIDevice currentDevice] systemVersion] forKey:VERSION_TAG];
	
	NSDate *date = [NSDate date];
	NSString *timestamp = [NSString stringWithFormat:@"%d",[date timeIntervalSince1970]];
	
	[request setPostValue:timestamp forKey:TIMESTAMP_TAG];
	[request setPostValue:[[NSBundle mainBundle] bundleIdentifier] forKey:APP_ID_TAG];
	[request setPostValue:severity forKey:SEVERITY_TAG];
	
	return request;
	
}

- (void)handleException:(NSString *)exceptionReport{
	ASIFormDataRequest * request = [self getRequestForReport:exceptionReport severity:SEVERITY_CRITICAL isDetailedReport:YES];
	[request startSynchronous];
	
	NSString *response = [request responseString];
	
}

@end

void QLogExceptionHandler(NSException *exception) {
	NSArray *arr = [exception callStackSymbols];
	
	NSString *report = [arr componentsJoinedByString:@"\n"];
	
	[[QLog singletonInstance]
	 performSelectorOnMainThread:@selector(handleException:) withObject:report waitUntilDone:YES];
	
	
}

