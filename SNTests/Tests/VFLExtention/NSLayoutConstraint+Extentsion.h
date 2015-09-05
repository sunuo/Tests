//
//  NSLayoutConstraint+NSArray.h
//  NewMedia
//
//  Created by kevin on 15/4/22.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Pattern @"[a-zA-Z_][a-zA-Z0-9_]*\\.[a-zA-Z_][a-zA-Z0-9_]*[><=][a-zA-Z_][a-zA-Z0-9_]*\\.[a-zA-Z_][a-zA-Z0-9_]*(\\*[0-9]+(\\.[0-9]+f?)?)?([\\+-][0-9]+(\\.[0-9]+f?)?)?"

#define VFL(ARRAY,VIEWS) ([NSLayoutConstraint constraintsWithVisualFormatsArray:(ARRAY) views:(VIEWS)])

@interface NSLayoutConstraint (Extentsion)
+ (NSArray *)constraintsWithVisualFormat:(NSString *)format views:(NSDictionary*)dicViews;
+ (NSArray *)constraintsWithVisualFormatsArray:(NSArray *)aryFormats views:(NSDictionary*)dicViews;
+(NSLayoutConstraint*)constraintWithFixedAspectRatio:(NSString*)strVFL views:(NSDictionary*)dicViews;
@end
