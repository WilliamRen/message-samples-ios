/*
 * Copyright (c) 2015 Magnet Systems, Inc.
 * All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License. You
 * may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "RPSLSUtils.h"
#import "RPSLSConstants.h"
#import "RPSLSUser.h"
#import "RPSLSUserStats.h"

@implementation RPSLSUtils

+ (NSString *)timestamp {
	return [NSString stringWithFormat:@"%lu",(long)[[NSDate date] timeIntervalSince1970] * 1000];
}

+ (MMXTopic *)availablePlayersTopic {
	return [MMXTopic topicWithName:kPostStatus_TopicName];
}

+ (MMXPubSubMessage *)availablilityMessage:(BOOL)available {
	return [MMXPubSubMessage pubSubMessageToTopic:[RPSLSUtils availablePlayersTopic]
										  content:@"Letting other players know if I'm available"
										 metaData:@{kMessageKey_Username			:[RPSLSUser me].username,
													kMessageKey_UserAvailablity		:@(available),
													kMessageKey_Timestamp			:[RPSLSUtils timestamp],
													kMessageKey_Type				:kMessageTypeValue_Availability,
													kMessageKey_Wins				:[@([RPSLSUser me].stats.wins) stringValue],
													kMessageKey_Losses				:[@([RPSLSUser me].stats.losses) stringValue],
													kMessageKey_Ties				:[@([RPSLSUser me].stats.ties) stringValue]}];
}

+ (NSString*)statusToString:(MMXConnectionStatus)status {
	NSString *statusString = @"Unknown";
	switch(status) {
		case MMXConnectionStatusNotConnected:
			statusString = @"Not Connected";
			break;
		case MMXConnectionStatusConnected:
			statusString = @"Connected Anonymously";
			break;
		case MMXConnectionStatusDisconnected:
			statusString = @"Disconnected";
			break;
		case MMXConnectionStatusAuthenticated:
			statusString = @"Authenticated";
			break;
		case MMXConnectionStatusAuthenticationFailure:
			statusString = @"Authentication Failure";
			break;
		case MMXConnectionStatusFailed:
			statusString = @"Failed";
			break;
		default:
			statusString = @"Unknown";
	}
	return statusString;
}

@end
