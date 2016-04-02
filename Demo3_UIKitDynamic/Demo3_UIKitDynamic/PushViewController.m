//
//  PushViewController.m
//  Demo3_UIKitDynamic
//
//  Created by  江苏 on 16/3/7.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong)UICollisionBehavior* collision;
@property(nonatomic,strong)UIPushBehavior* push;
@property(nonatomic,strong)UIDynamicAnimator* animator;
@end

@implementation PushViewController
-(UIDynamicAnimator*)animator{
    if (!_animator) {
        _animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    }
    return _animator;
}
-(UICollisionBehavior*)collision{
    if (!_collision) {
        _collision=[[UICollisionBehavior alloc]initWithItems:@[self.imageView]];
    }
    return _collision;
}
//-(UIPushBehavior*)push{
//    if (!_push) {
//        _push=[[UIPushBehavior alloc]initWithItems:@[self.imageView] mode:UIPushBehaviorModeInstantaneous];
//    }
//    return _push;
//}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.collision.translatesReferenceBoundsIntoBoundary=YES;
    self.collision.collisionDelegate=self;
    [self.collision setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(self.topLayoutGuide.length, 0, 0, 0)];
    [self.animator addBehavior:self.push];
    self.push=[[UIPushBehavior alloc]initWithItems:@[self.imageView] mode:UIPushBehaviorModeInstantaneous];
    [self.animator addBehavior:self.push];
}
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    CGPoint center=self.imageView.center;
    CGPoint location=[sender locationInView:self.view];
    CGFloat angle=atan2(location.y-center.y, 2)+powf(location.x-center.x, 2);
    CGFloat distance=sqrt(powf(location.y-center.y, 2)+powf(location.x-center.x, 2));
    self.push.magnitude=distance/10;
    self.push.angle=angle;
    self.push.active=YES;//激活，开始拍
}

@end
