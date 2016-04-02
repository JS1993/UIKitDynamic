//
//  ViewController.m
//  Demo3_UIKitDynamic
//
//  Created by  江苏 on 16/3/6.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(strong,nonatomic)UIDynamicAnimator* animator;
@property(strong,nonatomic)UIGravityBehavior* gravity;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.gravity=[[UIGravityBehavior alloc]initWithItems:@[self.imageView]];
    //[self.animator addBehavior:self.gravity];
}
- (IBAction)start:(id)sender {
    [self.animator addBehavior:self.gravity];
}
- (IBAction)stop:(id)sender {
    [self.animator removeBehavior:self.gravity];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
