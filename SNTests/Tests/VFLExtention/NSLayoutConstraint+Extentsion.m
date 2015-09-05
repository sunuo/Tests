//
//  NSLayoutConstraint+NSArray.m
//  NewMedia
//
//  Created by kevin on 15/4/22.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "NSLayoutConstraint+Extentsion.h"
#import "NSString+Regex.h"
@implementation NSLayoutConstraint (Extentsion)
+ (NSArray *)constraintsWithVisualFormat:(NSString *)format views:(NSDictionary*)dicViews
{
    return [self constraintsWithVisualFormat:format options:0 metrics:nil views:dicViews];
}

+(NSArray*)constraintsWithVisualFormatsArray:(NSArray *)aryFormats views:(NSDictionary *)dicViews
{
    NSMutableArray* ary=[[NSMutableArray alloc] init];
    for (NSString* strVFL in aryFormats) {
        
        if ([NSLayoutConstraint isFormatConformFAR:strVFL])
            [ary addObject:[self constraintWithFixedAspectRatio:strVFL views:dicViews]];
        else
            [ary addObjectsFromArray:[self constraintsWithVisualFormat:strVFL views:dicViews]];
    }
    return ary;
}

+(NSLayoutConstraint*)constraintWithFixedAspectRatio:(NSString*)strVFL views:(NSDictionary*)dicViews
{
    //objectA.attributeA=objectB.attributeB*multiplier+constant
    //objectA.attributeA=objectB.attributeB+constant
    //objectA.attributeA=objectB.attributeB*multiplier
    //objectA.attributeA=objectB.attributeB
    @try
    {
        
        
        NSString* strVFLWithoutSpaces=[strVFL stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        NSArray* components=[strVFLWithoutSpaces componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@".*=><+-"]];

        //获取对象及属性
        id objectA=[dicViews objectForKey:components[0]];
        NSLayoutAttribute attributeA=[[[self layoutAttributeDescriptionsByValue] objectForKey:components[1]] integerValue];
        id objectB=[dicViews objectForKey:components[2]];
        NSLayoutAttribute attributeB=[[[self layoutAttributeDescriptionsByValue] objectForKey:components[3]] integerValue];
        
        //获取倍率  获取偏移常数
        CGFloat multiplier,constant;
        [self getConstant:&constant multiplier:&multiplier byVFL:strVFLWithoutSpaces];
        //获取关系
        NSLayoutRelation layoutRelation=[self getRelation:strVFLWithoutSpaces];
        
        NSLog(@"%@.%ld %ld %@.%ld * %f + %f",components[0],(long)attributeA,(long)layoutRelation,components[2],attributeB,multiplier,constant);

        return [NSLayoutConstraint constraintWithItem:objectA attribute:attributeA relatedBy:layoutRelation toItem:objectB attribute:attributeB multiplier:multiplier constant:constant];
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
    }
    @finally {
        
    }
  
}

+(NSLayoutRelation)getRelation:(NSString*)relation
{
    if ([relation containsString:@"="])
        return NSLayoutRelationEqual;
    else if ([relation containsString:@">"])
        return NSLayoutRelationGreaterThanOrEqual;
    return NSLayoutRelationLessThanOrEqual;

}

+(void)getConstant:(CGFloat*)constant multiplier:(CGFloat*)multi byVFL:(NSString*)vf
{
    
    //objectA.attributeA=objectB.attributeB*multiplier+constant
    //objectA.attributeA=objectB.attributeB+constant
    //objectA.attributeA=objectB.attributeB*multiplier
    //objectA.attributeA=objectB.attributeB
    
    *multi=1.0f;
    *constant=0.0f;
    
    NSArray* components=[vf componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"*+-"]];
    if (components.count==3) {
        *multi=[components[1] floatValue];
        *constant=[vf containsString:@"-"]?0-[components[2] floatValue]:[components[2] floatValue];
    }
    else if(components.count==2)
    {
        if ([vf containsString:@"+"]||[vf containsString:@"-"]) {
            *constant=[vf containsString:@"-"]?0-[components[1] floatValue]:[components[1] floatValue];
        }
        else if ([vf containsString:@"*"])
        {
            *multi=[components[1] floatValue];
        }
    }
    else if(components.count==1)
    {
        
    }
    else
        NSLog(@"您的_____VF____字符串有问题");
}


+(BOOL)isFormatConformFAR:(NSString*)strVFL
{
    NSString* strVFLWithoutSpaces=[strVFL stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    return [strVFLWithoutSpaces matchPattern:Pattern];
    
}

+ (NSDictionary *)layoutAttributeDescriptionsByValue {
    static dispatch_once_t once;
    static NSDictionary *descriptionMap;
    dispatch_once(&once, ^{
        descriptionMap = @{
                           @"Left":                      @(NSLayoutAttributeLeft),
                           @"Right":                     @(NSLayoutAttributeRight),
                           @"Top":                       @(NSLayoutAttributeTop),
                           @"Bottom":                    @(NSLayoutAttributeBottom),
                           @"Leading":                   @(NSLayoutAttributeLeading),
                           @"Trailing":                  @(NSLayoutAttributeTrailing),
                           @"Width":                     @(NSLayoutAttributeWidth),
                           @"Height":                    @(NSLayoutAttributeHeight),
                           @"CenterX":                   @(NSLayoutAttributeCenterX),
                           @"CenterY":                   @(NSLayoutAttributeCenterY),
                           @"Baseline":                  @(NSLayoutAttributeBaseline),
                           @"LastBaseline":              @(NSLayoutAttributeLastBaseline),
                           @"FirstBaseline":             @(NSLayoutAttributeFirstBaseline),
                           @"LeftMargin":                @(NSLayoutAttributeLeftMargin),
                           @"RightMargin":               @(NSLayoutAttributeRightMargin),
                           @"TopMargin":                 @(NSLayoutAttributeTopMargin),
                           @"BottomMargin":              @(NSLayoutAttributeBottomMargin),
                           @"LeadingMargin":             @(NSLayoutAttributeLeadingMargin),        
                           @"TrailingMargin":            @(NSLayoutAttributeTrailingMargin),       
                           @"CenterXWithinMargins":      @(NSLayoutAttributeCenterXWithinMargins), 
                           @"CenterYWithinMargins":      @(NSLayoutAttributeCenterYWithinMargins), 
                           @"NotAnAttribute":            @(NSLayoutAttributeNotAnAttribute),
                           };
        
    });
    return descriptionMap;
}

@end
