//
//  SNTestsTests.m
//  SNTestsTests
//
//  Created by kevin on 15/8/30.
//  Copyright (c) 2015年 徐诺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+Regex.h"

@interface SNTestsTests : XCTestCase

@end

@implementation SNTestsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testRegexVariable
{
    XCTAssert([@"ad34" matchVariablePattern]);
}


-(void)testRegexVariable1
{
    XCTAssert([@"34ddd" matchVariablePattern]);
}

-(void)testRegexVariable_num
{
    XCTAssert(![@"34456" matchVariablePattern]);
}


-(void)testRegexLetterMatch_Empty
{
    XCTAssert(![@"" matchLetterPattern]);
}

-(void)testRegexLetterMatch_NumLetter
{
    XCTAssert([@"34dd" matchLetterPattern]);
}

-(void)testRegexLetterMatch_Num
{
    XCTAssert(![@"34000" matchLetterPattern]);
}


-(void)testRegexLetterMatch_letter
{
    XCTAssert([@"ddfhak" matchLetterPattern]);
}

-(void)testRegexLetter_parentheses
{
    XCTAssert([@"123" matchPattern:@"(123)+[a-z]*"]);
}

-(void)testRegexLetter_parentheses_1
{
    XCTAssert([@"hu123hhhh" matchPattern:@"(123)+[a-z]*"]);
}

-(void)testRegexLetter_parentheses_2
{
    XCTAssert(![@"huhhhh" matchPattern:@"(123)+[a-z]*"]);
}

-(void)testRegexLetter_Alternation
{
    XCTAssert([@"123" matchPattern:@"(123)|[a-e]+"]);
}

-(void)testRegexLetter_Alternation_1
{
    XCTAssert(![@"12" matchPattern:@"(123)|[a-e]+"]);
}

-(void)testRegexLetter_Alternation_2
{
    XCTAssert([@"adcad" matchPattern:@"(123)|[a-e]+"]);
}

-(void)testRegexLetter_Alternation_3
{
    XCTAssert(![@"yuio" matchPattern:@"(123)|[a-e]+"]);
}

-(void)testRegexLetter_Alternation_4
{
    XCTAssert([@"123yuio" matchPattern:@"(123)|[a-e]+"]);
}

-(void)testRegexLetter_Alternation_5
{
    XCTAssert([@"12adcad" matchPattern:@"(123)|[a-e]+"]);
}

-(void)testObjectWithAttribute_letter_letter
{
    NSString* varibles=@"[a-zA-Z][a-zA-Z0-9]*";
    NSString* objectWithAttribute=[NSString stringWithFormat:@"%@%@%@",varibles,@"\\.",varibles];
    XCTAssert([@"wer.fff" matchPattern:objectWithAttribute]);
}

-(void)testObjectWithAttribute_letter_numletter
{
    NSString* varibles=@"[a-zA-Z][a-zA-Z0-9]*";
    NSString* objectWithAttribute=[NSString stringWithFormat:@"%@%@%@",varibles,@"\\.",varibles];
    XCTAssert(![@"wer.1fff" matchPattern:objectWithAttribute]);
}

-(void)testObjectWithAttribute_num_letter
{
    NSString* varibles=@"[a-zA-Z][a-zA-Z0-9]*";
    NSString* objectWithAttribute=[NSString stringWithFormat:@"%@%@%@",varibles,@"\\.",varibles];
    XCTAssert(![@"3451.Left" matchPattern:objectWithAttribute]);
}

-(void)testExpression
{
    NSString* varibles=@"[a-zA-Z][a-zA-Z0-9]*";
    NSString* objectWithAttribute=[NSString stringWithFormat:@"%@%@%@",varibles,@"\\.",varibles];
    NSString* pattern=[NSString stringWithFormat:@"%@%@%@",objectWithAttribute,@"[>=<]",objectWithAttribute];
    XCTAssert(![ @"3451.Left<v2.Left" matchPattern:pattern]);
}
-(void)testExpression_1
{
    
    NSString* varibles=@"[a-zA-Z][a-zA-Z0-9]*";
    NSString* objectWithAttribute=[NSString stringWithFormat:@"%@%@%@",varibles,@"\\.",varibles];//@"([[a-z][A-Z][0-9]]+\\.[[a-z][A-Z][0-9]]+)";
    //    NSString* compareOperation=@">|=|<";
    NSString* compareOperation0=@"[><=]";
    //    NSString* regfloat=@"[0-9]+(\\.[0-9]+f?)?";
    NSString* multifloat=@"(\\*[0-9]+(\\.[0-9]+f?)?)?";
    NSString* addConstant=@"(\\+[0-9]+(\\.[0-9]+f?)?)?";
    
    NSString* reg=[NSString stringWithFormat:@"%@%@%@%@%@",objectWithAttribute,compareOperation0,objectWithAttribute,multifloat,addConstant];
    XCTAssert(![ @"3451.Left<v2.Left" matchPattern:reg]);
}











//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
