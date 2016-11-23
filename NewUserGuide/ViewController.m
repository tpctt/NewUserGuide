//
//  ViewController.m
//  NewUserGuide
//
//  Created by tim on 16/11/23.
//  Copyright © 2016年 timRabbit. All rights reserved.
//

#import "ViewController.h"
#import "NewUserGuide.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showNewUserGuideIfNeed];
    
    
}
///新手引导,聚光灯
-(void)showNewUserGuideIfNeed
{
    ///先注释,方便查看效果
//    if([NewUserGuide hadShowNewUserGuideForKey:NSStringFromClass(self.class)] ||
//       [NewUserGuide isShowingNewUserGuideForKey:NSStringFromClass(self.class)]
//       ){
//        return;
//    }
    
    UIView *onView ;
    //    = self.tabBarController.navigationController.view;
    onView = [UIApplication sharedApplication].keyWindow;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:[self.view convertRect:self.btn2.frame toView:onView] cornerRadius:5];
    UIImage *image = [UIImage imageNamed:@"newUserGuide-1"];
    
    CGPoint point = [self.view convertPoint:self.btn2.center toView:onView];
    point.y += self.btn2.frame.size.height/2 + 10;
    point.x -= image.size.width /2 ;
    
    
    
    NewUserGuide *view = [[NewUserGuide alloc] init];
    
    [view showOn:onView path:path appendPath:YES image:image imageAt:point withKey:NSStringFromClass(self.class) afterTap:^{
        
        
        [view showOn:onView forView:_btn3 cornerRadius:10 image:nil imageAt:CGPointMake(100, 100) withKey:@"btn3" afterTap:^{
            
        }];
        
    }];
    
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
