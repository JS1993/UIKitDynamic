//
//  CollisionViewController.m
//  Demo3_UIKitDynamic
//
//  Created by  江苏 on 16/3/6.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "CollisionViewController.h"
#import "BackgroundView.h"
@interface CollisionViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(strong,nonatomic)UIDynamicAnimator* animator;
@property(strong,nonatomic)UIGravityBehavior* gravity;
@end

@implementation CollisionViewController
//延时加载
-(UIDynamicAnimator*)animator{
    if (!_animator) {
        _animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    }
    return _animator;
}
-(UIGravityBehavior*)gravity{
    if (!_gravity) {
        _gravity=[[UIGravityBehavior alloc]initWithItems:@[self.imageView]];
    }
    return _gravity;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.transform=CGAffineTransformMakeRotation(M_PI_4+0.1);
    //设置重力属性
    self.gravity.magnitude=0.1;//引力值，1是默认值
    self.gravity.gravityDirection=CGVectorMake(0, 1);//方向，0.1是默认值
    [self.animator addBehavior:self.gravity];
    //碰撞行为
    UICollisionBehavior* collisionBehavior=[[UICollisionBehavior alloc]initWithItems:@[self.imageView]];
    [self.animator addBehavior:collisionBehavior];
    //将视图引用四周翻译成可以碰撞的四个边
    collisionBehavior.translatesReferenceBoundsIntoBoundary=YES;
    collisionBehavior.collisionDelegate=self;
    //用UIbeizerPath创建一个图形并具有碰撞行为
    UIBezierPath* path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 300)];
    [path addLineToPoint:CGPointMake(0, self.view.bounds.size.height)];
    [path addLineToPoint:CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height)];
    path.lineWidth=5;
    [path closePath];
    [[UIColor redColor]setStroke];
    [path stroke];
    if ([self.view isKindOfClass:[BackgroundView class]]) {
        BackgroundView* bgView=(BackgroundView*)self.view;
        bgView.path=path;
    }
    [collisionBehavior addBoundaryWithIdentifier:@"path" forPath:path];
}
-(void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(nonnull id<UIDynamicItem>)item withBoundaryIdentifier:(nullable id<NSCopying>)identifier atPoint:(CGPoint)p{
    //重新渲染图片
    self.imageView.tintColor=[UIColor redColor];
    self.imageView.image=[self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}
-(void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(nonnull id<UIDynamicItem>)item withBoundaryIdentifier:(nullable id<NSCopying>)identifier{
    //
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
