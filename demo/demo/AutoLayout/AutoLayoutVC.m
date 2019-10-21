//
//  AutoLayoutVC.m
//  demo
//
//  Created by cyq on 2019/10/20.
//  Copyright © 2019 www.helloworld.cyq. All rights reserved.
//

#import "AutoLayoutVC.h"

@interface AutoLayoutVC ()

@end

@interface AutolayoutView : UIView

@end

@implementation AutoLayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self startLoadViews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //[self startLoadViews];
}

-(UIView*)addViewWithColor:(UIColor*)color toView:(UIView*)superView{
    AutolayoutView * view = [[AutolayoutView alloc] init];
    view.backgroundColor = color;
    [superView addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews");
}

-(void)startLoadViews{
    /*
     计算公式：
     view1.attribute1 = mutiplier * view2.attribute2 + constant
     */
    UIView * v1 = [self addViewWithColor:[UIColor lightGrayColor] toView:self.view];
    
    
    NSLayoutConstraint *layoutConstraintleft = [NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:50.f];
    NSLayoutConstraint *layoutConstraintbottom = [NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:-50.f];
    NSLayoutConstraint *layoutConstraintright = [NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:-50.f];
    NSLayoutConstraint *layoutConstrainttop = [NSLayoutConstraint constraintWithItem:v1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:50.f];
    [self.view addConstraints:@[layoutConstraintleft,layoutConstraintbottom,layoutConstraintright,layoutConstrainttop]];
    
    
    UIView *v2 = [self addViewWithColor:[UIColor redColor] toView:v1];
    
    
    NSLayoutConstraint * LC1  = [NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeWidth multiplier:0.f constant:120.f];
    LC1.priority = UILayoutPriorityDefaultHigh;
    
    NSLayoutConstraint * LC2  = [NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeHeight multiplier:0.f constant:110.f];
     LC2.priority = UILayoutPriorityDefaultHigh;
    
    NSLayoutConstraint * LC3  = [NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeLeft multiplier:1.f constant:10.f];
    
    //NSLayoutConstraint * LC4  = [NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeTop multiplier:1.f constant:20.f];
    
    
    UIView *v3 = [self addViewWithColor:[UIColor greenColor] toView:v1];
    
    NSLayoutConstraint * LC4  = [NSLayoutConstraint constraintWithItem:v3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:v2 attribute:NSLayoutAttributeRight multiplier:1.f constant:10.f];
    
    NSLayoutConstraint * LC5  = [NSLayoutConstraint constraintWithItem:v3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeHeight multiplier:0.f constant:110.f];
    
    NSLayoutConstraint * LC6  = [NSLayoutConstraint constraintWithItem:v3 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeRight multiplier:1.f constant:-10.f];
    
    NSLayoutConstraint * LC7  = [NSLayoutConstraint constraintWithItem:v3 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:v2 attribute:NSLayoutAttributeTop multiplier:1.f constant:0.f];
    
    NSLayoutConstraint * LC8  = [NSLayoutConstraint constraintWithItem:v2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:v1 attribute:NSLayoutAttributeTop multiplier:1.f constant:50.f];
    
    [v1 addConstraints:@[LC1,LC2,LC3,LC5,LC6,LC8]];
    [v1 addConstraint:LC4];
    [v1 addConstraint:LC7];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CGRect frame = v2.frame;
        frame.size.width = 150;
        v2.frame = frame;
    });
}


@end

@implementation AutolayoutView

-(void)layoutSubviews{
    [super layoutSubviews];
    NSLog(@"layoutSubviews");
}

@end
