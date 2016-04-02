//
//  AttachmentViewController.m
//  Demo3_UIKitDynamic
//
//  Created by  江苏 on 16/3/7.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "AttachmentViewController.h"

#import "BackgroundView.h"
@interface AttachmentViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(strong,nonatomic)UIDynamicAnimator* animator;
@property(strong,nonatomic)UIGravityBehavior* gravity;
@property(strong,nonatomic)UIAttachmentBehavior* attachment;
@end

@implementation AttachmentViewController
//延时加载
- (UIDynamicAnimator *)animator
{
    if(!_animator)_animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    return _animator;
}

-(UIGravityBehavior *)gravity
{
    if(!_gravity)_gravity = [[UIGravityBehavior alloc]initWithItems:@[self.imageView]];
    return _gravity;
}
-(UIAttachmentBehavior*)attachment{
    if (!_attachment) {
        CGPoint anchor=CGPointMake(self.imageView.center.x, self.imageView.frame.origin.y-50);
        _attachment=[[UIAttachmentBehavior alloc]initWithItem:self.imageView attachedToAnchor:anchor];
    }
    return _attachment;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.animator addBehavior:self.gravity];
    [self.animator addBehavior:self.attachment];
    [self drawLine];
}
//-(void)drawLine{
//    //weak防止在block中循环引用，内存不释放，用新转化的若引用代替原来的强引用
//    __weak UIAttachmentBehavior* weakAttachment=self.attachment;
//    __weak UIImageView *weakBox=self.imageView;
//    __weak UIView* view=self.view;
//    self.attachment.action=^{//闭包，在行为的过程中不断的调用，只要行为在变就会不停的调用action
//        UIBezierPath* path=[UIBezierPath bezierPath];
//        [path moveToPoint:weakAttachment.anchorPoint];
//        [path addLineToPoint:weakBox.center];
//        path.lineWidth=2;
//        BackgroundView* bgView=(BackgroundView*)view;
//        bgView.path=path;
//    };
//}
- (void)drawLine
{
    __weak UIAttachmentBehavior *weakAttachment = self.attachment;
    __weak UIImageView *weakBox = self.imageView;
    __weak UIView *view = self.view;
    self.attachment.action = ^{
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:weakAttachment.anchorPoint];
        [path addLineToPoint:weakBox.center];
        path.lineWidth = 2;
        BackgroundView *bgView = (BackgroundView *)view;
        bgView.path = path;
    };
}
- (IBAction)pan:(UIPanGestureRecognizer *)sender {
    if (sender.state==UIGestureRecognizerStateBegan) {
        self.attachment.damping=0.1;//阻尼
        self.attachment.frequency=1.0;//频率
    }else if (sender.state==UIGestureRecognizerStateChanged){
        CGPoint location=[sender locationInView:self.view];
        self.attachment.anchorPoint=location;
    }
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
    // Pass the selected object to the new view controller.
}
*/

@end
