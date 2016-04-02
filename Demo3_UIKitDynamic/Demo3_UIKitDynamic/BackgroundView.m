//
//  BackgroundView.m
//  Demo3_UIKitDynamic
//
//  Created by  江苏 on 16/3/6.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView
//-(void)setPath:(UIBezierPath*)path{
//    _path=path;
//    [self setNeedsDisplay];
//}
////当stroyBoard将视图唤醒（创建也相当于唤醒）时调用
//-(void)awakeFromNib{
//    //.....
//}
////使用stroyboard创建此对象时初始化方法，自动调用
//-(id)initWithCoder:(NSCoder *)aDecoder{
//    self=[super initWithCoder:aDecoder];
//    if (self) {
//        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
//    }
//    return self;
//}
//-(void)drawRect:(CGRect)rect {
//    [[UIColor redColor]setStroke];
//    [self.path stroke];
//}
- (void)setPath:(UIBezierPath *)path
{
    _path = path;
    [self setNeedsDisplay];
}

//当storyboard将视图唤醒(创建也相当于唤醒)时调用
- (void)awakeFromNib
{
    //...
}

//使用Storyboard创建此对象时初始化方法，自动调用
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        //用图片创建颜色对象，做为视图的背景色
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor redColor]setStroke];
    [self.path stroke];
}
@end
