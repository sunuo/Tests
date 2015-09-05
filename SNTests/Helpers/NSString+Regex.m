

//
//  NSString+Regex.m
//  SNTests
//
//  Created by kevin on 15/9/4.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#import "NSString+Regex.h"

#define Varible_Pattern @"[a-zA-Z][a-zA-Z0-9]*"
#define Letter_Pattern @"[a-zA-Z]+"
#define Number_Pattern @"[0-9]+"

@implementation NSString (Regex)
-(BOOL)matchPattern:(NSString*)pattern
{
    NSRegularExpression* regex=[NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];

    NSUInteger numberOfMatches = [regex numberOfMatchesInString:self
                                                        options:0
                                                          range:NSMakeRange(0, [self length])];
    if(numberOfMatches==0)
        return NO;
    return YES;

}

-(BOOL)matchVariablePattern
{
    return [self matchPattern:Varible_Pattern];
}

-(BOOL)matchLetterPattern
{
    return [self matchPattern:Letter_Pattern];
}
-(BOOL)matchNumberPattern
{
    return [self matchPattern:Number_Pattern];
}
@end
