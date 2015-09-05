//
//  NSString+Regex.h
//  SNTests
//
//  Created by kevin on 15/9/4.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Regex)
-(BOOL)matchPattern:(NSString*)pattern;
-(BOOL)matchVariablePattern;
-(BOOL)matchLetterPattern;
-(BOOL)matchNumberPattern;
@end
