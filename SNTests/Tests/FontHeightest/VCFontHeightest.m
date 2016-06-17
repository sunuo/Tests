//
//  VCFontHeightest.m
//  SNTests
//
//  Created by xukaitiankevin on 16/6/14.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "VCFontHeightest.h"
#define D_CELL_TEXT_FONT_SIZE 15.0f
@interface VCFontHeightest ()
{
    UITextView* _txtView;
    UILabel* _txtLabel;
    NSString* _strText;
}
@end

@implementation VCFontHeightest

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _strText = @"姓名：kevin\n性别：男\n爱好：女女女女女女女女女女女女女女女";
    
    NSMutableParagraphStyle *paraStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paraStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paraStyle.paragraphSpacing=5;
    paraStyle.paragraphSpacingBefore=5;
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:D_CELL_TEXT_FONT_SIZE],
                                NSParagraphStyleAttributeName:paraStyle,
                                NSForegroundColorAttributeName:[UIColor greenColor],
                                };
    
    NSAttributedString* _attributeText = [[NSAttributedString alloc] initWithString:_strText attributes:attribute];
    
    _txtView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    [self.view addSubview:_txtView];
    
    [_txtView setBackgroundColor:[UIColor redColor]];
//    [_txtView setTextColor:[UIColor blueColor]];
//    [_txtView setTintColor:[UIColor blueColor]];
////    _txtView.dataDetectorTypes =UIDataDetectorTypeLink;
//    _txtView.selectable=YES;
    [_txtView setEditable:NO];
    [_txtView setScrollEnabled:NO];
//    [_txtView setFont:[UIFont systemFontOfSize:D_CELL_TEXT_FONT_SIZE]];
    _txtView.contentMode = UIViewContentModeTop;
    _txtView.textContainerInset = UIEdgeInsetsMake(0, -5, 0, -5);
    [_txtView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [_txtView setAttributedText:_attributeText];
    
    
    CGRect rect = [_strText boundingRectWithSize:CGSizeMake(100, 0) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:attribute context:NULL];
    [_txtView setFrame:CGRectMake(0, 100, rect.size.width, rect.size.height)];
    
    _txtLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_txtView.frame), rect.size.width, rect.size.height)];
    [_txtLabel setBackgroundColor:[UIColor orangeColor]];
    [_txtLabel setNumberOfLines:0];
    _txtLabel.attributedText=_attributeText;
    [_txtLabel setTextColor:[UIColor blackColor]];//覆盖掉attributedtext的forcolor
    
    [self.view addSubview:_txtLabel];
    
    NSLog(@"\n%@\n%@ ",[NSValue valueWithCGRect:_txtView.frame],[NSValue valueWithCGRect:rect]);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to  the new view controller.
}
*/

@end
