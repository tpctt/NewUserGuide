//
//  NewUserGuide.h
//  taoqianbao
//
//  Created by tim on 16/11/2.
//  Copyright © 2016年 tim. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^NewUserGuideTapBlock)(void);

@interface NewUserGuide : UIView


-(void)showOn:(UIView *)onview path:(UIBezierPath *)path appendPath:(BOOL)appendPath image:(UIImage *)image imageAt:(CGPoint)imageAt withKey:(NSString *)withKey afterTap:(NewUserGuideTapBlock)afterTapBlock ;

-(void)showOn:(UIView *)onview forView:(UIView *)forView   cornerRadius:(CGFloat)cornerRadius image:(UIImage *)image imageAt:(CGPoint)imageAt withKey:(NSString *)withKey afterTap:(NewUserGuideTapBlock)afterTapBlock ;

//@property ( copy,nonatomic) void (^tapAdviewBlock)( bool tapAdview ,NSInteger index) ;

+(BOOL)hadShowNewUserGuideForKey:(NSString *)key;
+(BOOL)isShowingNewUserGuideForKey:(NSString *)key;
+(void)setHadShowNewUserGuideForKey:(NSString *)key;
@end
