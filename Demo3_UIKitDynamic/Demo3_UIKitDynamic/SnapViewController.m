//
//  SnapViewController.m
//  Demo3_UIKitDynamic
//
//  Created by  江苏 on 16/3/7.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property(strong,nonatomic)UIDynamicAnimator* animator;
@property(strong,nonatomic)UISnapBehavior* snap;
@end

@implementation SnapViewController
-(UIDynamicAnimator*)animator{
    if (!_animator) {
        _animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    }
    return _animator;
}
- (IBAction)tap:(UITapGestureRecognizer *)sender {
    CGPoint location=[sender locationInView:self.view];
    [self.animator removeBehavior:self.snap];
    self.snap=[[UISnapBehavior alloc]initWithItem:self.imageView snapToPoint:location];
    [self.animator addBehavior:self.snap];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
