//
//  NewUserGuide.m
//  taoqianbao
//
//  Created by tim on 16/11/2.
//  Copyright © 2016年 tim. All rights reserved.
//

#import "NewUserGuide.h"


static NSMutableDictionary *showingKeys;

@interface NewUserGuide () <UIGestureRecognizerDelegate>

@property (strong,nonatomic) UIView *onview;
@property (strong,nonatomic) UIBezierPath *path;
@property (assign,nonatomic) BOOL appendPath;

@property (strong,nonatomic) UIImage *image;
@property (strong,nonatomic) NSString *withKey;

@property (assign,nonatomic) CGPoint imageAt;
@property (copy,nonatomic) NewUserGuideTapBlock afterTapBlock;


@property (strong,nonatomic) UIView *bgView;

@property (strong,nonatomic) CAShapeLayer *shapeLayer;


@end

@implementation NewUserGuide

-(void)showOn:(UIView *)onview forView:(UIView *)forView   cornerRadius:(CGFloat)cornerRadius image:(UIImage *)image imageAt:(CGPoint)imageAt withKey:(NSString *)withKey afterTap:(NewUserGuideTapBlock)afterTapBlock
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[onview convertRect:forView.frame toView:onview] cornerRadius:cornerRadius];
    
    [self showOn:onview path:path appendPath:YES image:image imageAt:imageAt withKey:withKey afterTap:afterTapBlock];
    
    
}

///按照 path 显示 layer 层的 mask, 支持事件穿透
-(void)showOn:(UIView *)onview path:(UIBezierPath *)path appendPath:(BOOL)appendPath image:(UIImage *)image imageAt:(CGPoint)imageAt withKey:(NSString *)withKey afterTap:(NewUserGuideTapBlock)afterTapBlock {

    
    self.onview = onview;
    self.path = path;
    self.image = image;
    
    
    self.imageAt = imageAt;
    self.withKey = withKey;
    self.afterTapBlock = afterTapBlock;
    self.appendPath = appendPath;
    
    
    [self newUserGuide];
    
    if(showingKeys == nil){
        showingKeys = [NSMutableDictionary dictionary];
    }
    
    if(self.withKey){
        [showingKeys setObject:@(1) forKey:self.withKey ];
    }
    
    
}
+(BOOL)hadShowNewUserGuideForKey:(NSString *)key
{
    if(key){
       return  [[NSUserDefaults standardUserDefaults] boolForKey:key];
    }
    return NO;
}
+(BOOL)isShowingNewUserGuideForKey:(NSString *)key
{
    if(key){
        return  [[showingKeys objectForKey:key] boolValue ];
                 
    }
    return NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        self.shapeLayer = shapeLayer;
        
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.8];
        

    }
    return self;
}

- (void)newUserGuide

{
    NSArray *array = [self subviews];
    for (UIView *view in array ) {
        [view removeFromSuperview];
    }
//    self.backgroundColor = [UIColor orangeColor];
    
    
    [_onview addSubview:self];
    self.frame = _onview.bounds;
    
    
    // 这里创建指引
    {
        UIView * bgView = [[UIView alloc]initWithFrame:self.bounds];
        _bgView = bgView;
        [self addSubview:bgView];
        
        
        bgView.userInteractionEnabled = NO;

    }
    
   
    
    {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sureTapClick:)];
        [self addGestureRecognizer:tap];
        //    tap.delegate = self;
        
    }
  
    
   
    
    
    
    {
        
        //create path
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bounds];
        [path appendPath:[self.path bezierPathByReversingPath]];
        
        if( NO == _appendPath ){
            
            self.shapeLayer.path =  _path.CGPath;
            
        }else{
            
            self.shapeLayer.path =  path.CGPath;
            
        }
        
        
        
        
//        shapeLayer.bounds = CGRectMake(0, 0, 1242, 2208);
        
        self.shapeLayer.backgroundColor = [UIColor orangeColor].CGColor;
        self.shapeLayer.fillColor = [UIColor redColor].CGColor;
        self.shapeLayer.strokeColor = [UIColor greenColor].CGColor;
        self.shapeLayer.lineWidth = 2;
        
//        [self.layer addSublayer:shapeLayer];
        

        [self.layer setMask:self.shapeLayer];
        
        
    }
    
    
    {
        
        UIImageView * imageView = [[UIImageView alloc]initWithImage:_image];
        //    imageView.image = image;
        imageView.frame = CGRectMake(self.imageAt.x, self.imageAt.y, imageView.frame.size.width,  imageView.frame.size.height) ;
        
        [self addSubview:imageView ] ;
        
    }
    
    
    
}
-(void)afterShow{
    if(self.withKey){
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:self.withKey];
        [showingKeys removeObjectForKey:self.withKey];
        
    }
}
/**
 *   新手指引确定
 */
- (void)sureTapClick:(UIGestureRecognizer *)tap
{

    [self removeFromSuperview];

    
    
    if(self.afterTapBlock){
        self.afterTapBlock();
    }
    
    
}
-(void)removeFromSuperview
{
    [super removeFromSuperview];
    [self afterShow];

}
#pragma mark - UIView Overrides
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if ([self.path containsPoint:point]) {
        
        [self removeFromSuperview];

        return nil;
    }
    
//    if (hitView == self)
//    {
//        for (UIView *focus in self.focusView) {
//            if (CGRectContainsPoint(focus.frame, point))
//            {
//                return focus;
//            }
//        }
//    }
    return hitView;
}
@end
