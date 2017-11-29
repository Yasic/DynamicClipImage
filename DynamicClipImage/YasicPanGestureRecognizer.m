//
//  YasicPanGestureRecognizer.m
//  DynamicClipImage
//
//  Created by yasic on 2017/11/29.
//  Copyright © 2017年 yasic. All rights reserved.
//

#import "YasicPanGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface YasicPanGestureRecognizer()

@property(strong, nonatomic) UIView *targetView;

@end

@implementation YasicPanGestureRecognizer

-(instancetype)initWithTarget:(id)target action:(SEL)action inview:(UIView*)view{
    
    self = [super initWithTarget:target action:action];
    if(self) {
        self.targetView = view;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent*)event{
    
    [super touchesBegan:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    self.beginPoint = [touch locationInView:self.targetView];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    self.movePoint = [touch locationInView:self.targetView];
}

@end
