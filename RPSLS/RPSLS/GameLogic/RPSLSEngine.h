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

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, RPSLSValue) {
	RPSLSValueNotSet	= -1,
	RPSLSValueRock		= 0,
	RPSLSValuePaper		= 1,
	RPSLSValueScissors	= 2,
	RPSLSValueLizard	= 3,
	RPSLSValueSpock		= 4
};

typedef NS_ENUM(NSInteger, RPSLSResult) {
	RPSLSResultTie = 0,
	RPSLSResultLoss,
	RPSLSResultWin
};

@interface RPSLSEngine : NSObject

+ (RPSLSResult)myResult:(RPSLSValue)me them:(RPSLSValue)them;
+ (NSString *)resultAsString:(RPSLSResult)result;
+ (NSArray *)resultMatrix;
+ (RPSLSValue)stringToValue:(NSString *)valueString;
+ (NSString *)valueToString:(RPSLSValue)value;
+ (NSDictionary *)verbMap;
+ (NSString *)verbFromWinner:(RPSLSValue)winner loser:(RPSLSValue)loser;

@end