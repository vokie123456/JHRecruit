//
//  CountdownView.m
//  DateTest
//
//  Created by milan on 2017/9/16.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "CountdownView.h"

@interface CountdownView()
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,strong)CAShapeLayer *roundLayer;
@property(nonatomic,strong)UILabel *secondLabel;



@end
@implementation CountdownView

-(instancetype)initWithSeconds:(NSInteger)seconds animationFinish:(animationFinishBlock)finishBlock{
    
    self = [super init];
    if (self) {
        _finishBlock = finishBlock;
        _seconds = seconds;
        _numberColor = [UIColor whiteColor];
        _roundColor = [UIColor lightGrayColor];
        self.frame = [[UIScreen mainScreen]bounds];
        self.backgroundColor = [UIColor whiteColor];
        
        
        
    }
    return self;
}

-(void)didMoveToSuperview{
    [self setLayout];
    
}
-(void)setLayout{
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.center.x-50, self.center.y-50, 100, 100)];
    
    _roundLayer = [[CAShapeLayer alloc]init];
    _roundLayer.path = path.CGPath;
    _roundLayer.strokeColor = [_roundColor CGColor];
    _roundLayer.fillColor = [[UIColor clearColor]CGColor];
    _roundLayer.lineWidth = 100;
    [self.layer addSublayer:_roundLayer];
    
    _secondLabel = [UILabel new];
    _secondLabel.font = [UIFont systemFontOfSize:[UIScreen mainScreen].bounds.size.width*0.3];
    _secondLabel.textColor = _numberColor;
    _secondLabel.text = [NSString stringWithFormat:@"%ld",_seconds];
    [_secondLabel sizeToFit];
    _secondLabel.center = self.center;
    [self addSubview:_secondLabel];
    
   
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startAnimation:) userInfo:nil repeats:true];
    [[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSDefaultRunLoopMode];
    
    
}
-(void)startAnimation:(NSTimer*)timer{
    _seconds--;
    if (_seconds<0) {
        [_timer invalidate];
        _timer = nil;
       
        if (_finishBlock) {
            _finishBlock();
        }
        [UIView animateWithDuration:0.38 animations:^{
            self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/4, 0, [UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        } completion:^(BOOL finished) {
             [self removeFromSuperview];
        }];
        return;
    }
    
    _secondLabel.text = [NSString stringWithFormat:@"%ld",_seconds];
    [_secondLabel sizeToFit];
    
    CABasicAnimation *roundAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    roundAnimation.fromValue = @(0);
    roundAnimation.toValue = @(1);
    roundAnimation.duration = 0.38;
    [_roundLayer addAnimation:roundAnimation forKey:@"strokeEnd"];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.38;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.2, 0.2, 1)]];
     [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.6, 1.6, 1)]];
     [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)]];
    animation.values = values;
    [_secondLabel.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.toValue = @(0.2);
    opacityAnimation.duration = 0.38;
    [_secondLabel.layer addAnimation:opacityAnimation forKey:@"opacity"];
    
    
    
}

-(void)setNumberColor:(UIColor *)numberColor{
    _secondLabel.textColor = numberColor;
    
}

@end
