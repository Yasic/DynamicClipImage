//
//  YasicClipPage.m
//  DynamicClipImage
//
//  Created by yasic on 2017/11/29.
//  Copyright © 2017年 yasic. All rights reserved.
//

#import "YasicClipPage.h"
#import <Masonry.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface YasicClipPage ()

@property (strong, nonatomic) UIImage *targetImage;
@property(strong, nonatomic) UIImageView *bigImageView;
@property(strong, nonatomic) UIView *cropView;

// 图片 view 原始 frame
@property(assign, nonatomic) CGRect originalFrame;

// 裁剪区域属性
@property(assign, nonatomic) CGFloat cropAreaX;
@property(assign, nonatomic) CGFloat cropAreaY;
@property(assign, nonatomic) CGFloat cropAreaWidth;
@property(assign, nonatomic) CGFloat cropAreaHeight;

@property(nonatomic, assign) CGFloat clipHeight;
@property(nonatomic, assign) CGFloat clipWidth;

@end

@implementation YasicClipPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.targetImage = [UIImage imageNamed:@"TARGET_IMG"];
    
    self.clipWidth = SCREEN_WIDTH;
    self.clipHeight = self.clipWidth * 9/16;
    
    self.cropAreaX = (SCREEN_WIDTH - self.clipWidth)/2;
    self.cropAreaY = (SCREEN_HEIGHT - self.clipHeight)/2;
    self.cropAreaWidth = self.clipWidth;
    self.cropAreaHeight = self.clipHeight;
    
    self.bigImageView.image = self.targetImage;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.view addSubview:self.cropView];
    [self.view addSubview:self.bigImageView];
    
    [self.cropView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
    
    CGFloat tempWidth = 0.0;
    CGFloat tempHeight = 0.0;
    
    if (self.targetImage.size.width/self.cropAreaWidth <= self.targetImage.size.height/self.cropAreaHeight) {
        tempWidth = self.cropAreaWidth;
        tempHeight = (tempWidth/self.targetImage.size.width) * self.targetImage.size.height;
    } else if (self.targetImage.size.width/self.cropAreaWidth > self.targetImage.size.height/self.cropAreaHeight) {
        tempHeight = self.cropAreaHeight;
        tempWidth = (tempHeight/self.targetImage.size.height) * self.targetImage.size.width;
    }
    
//    [self.bigImageView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.cropAreaX - (tempWidth - self.cropAreaWidth)/2);
//        make.top.mas_equalTo(self.cropAreaY - (tempHeight - self.cropAreaHeight)/2);
//        make.width.mas_equalTo(tempWidth);
//        make.height.mas_equalTo(tempHeight);
//    }];
    [self.bigImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self setUpCropLayer];
    
    [super viewWillAppear:animated];
}

- (void)setUpCropLayer
{
    
}

- (UIImageView *)bigImageView
{
    if (!_bigImageView) {
        _bigImageView = [[UIImageView alloc] init];
        _bigImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _bigImageView;
}

- (UIView *)cropView
{
    if (!_cropView) {
        _cropView = [[UIView alloc] init];
    }
    return _cropView;
}

@end
