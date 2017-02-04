//
//  UIImage+Helpers.m
//  SNTests
//
//  Created by xukaitiankevin on 16/9/2.
//  Copyright © 2016年 徐诺. All rights reserved.
//

#import "UIImage+Helpers.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (Helpers)
-(NSData*)image2Data
{
//    CGDataProviderRef provider = CGImageGetDataProvider(self.CGImage);
//    NSData* data = (id)CFBridgingRelease(CGDataProviderCopyData(provider));
    
    NSData *data = UIImagePNGRepresentation(self);
    
    return data;
}

-(UIImage*)getThumbnailAtIndex:(NSInteger)index
{
    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)[self image2Data], NULL);

//    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)[NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"GIF" ofType:@"gif"]]], NULL);
    
    CGImageRef cgimage = CGImageSourceCreateThumbnailAtIndex(source, index, NULL);
//    CGImageRef cgimage = CGImageSourceCreateImageAtIndex(source, index, NULL);
    UIImage* image = [UIImage imageWithCGImage:cgimage];
    
    CGImageRelease(cgimage);
    CFRelease(source);
    
    return image;
}

-(UIImage*)getThumbnail
{
    return [self getThumbnailAtIndex:0];
}

-(UIImage*)getImageRect:(CGRect)rect
{
    CGImageSourceRef source = CGImageSourceCreateWithData((CFDataRef)[self image2Data], NULL);
    
    CGImageRef cgimage = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    
    CGImageRef rectImage = CGImageCreateWithImageInRect(cgimage, rect);
    
    UIImage* image = [UIImage imageWithCGImage:rectImage];
    
    CGImageRelease(cgimage);
    CGImageRelease(rectImage);
    CFRelease(source);
    
    return image;

}
@end
