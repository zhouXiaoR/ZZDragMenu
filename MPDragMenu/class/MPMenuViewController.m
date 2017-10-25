//
//  MPMenuViewController.m
//  MPDragMenu
//
//  Created by 周晓瑞 on 2017/3/20.
//  Copyright © 2017年 colleny. All rights reserved.
//

#import "MPMenuViewController.h"

#define  targetL   -3*self.view.width/4.0
#define targetR    4*self.view.width/5.0
#define maxY   100

@interface MPMenuViewController ()
@property(nonatomic,weak)UIView *blueV;
@property(nonatomic,weak)UIView *redV;
@property(nonatomic,weak)UIView *greenV;
@end

@implementation MPMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor blackColor];
    self.navigationController.navigationBarHidden = YES;
    
    [self setUpView];
}


-(void)setUpView{
    
    UIView *blueView = [[UIView alloc]initWithFrame:self.view.bounds];
    blueView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:blueView];
    self.blueV = blueView;
    
    UIView *greenView = [[UIView alloc]initWithFrame:self.view.bounds];
    greenView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:greenView];
    self.greenV = greenView;
    
    UIView *redView = [[UIView alloc]initWithFrame:self.view.bounds];
    redView.backgroundColor=[UIColor redColor];
    [self.view addSubview:redView];
    self.redV = redView;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [redView addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tap];
}

-(void)pan:(UIPanGestureRecognizer*)panGs{
    
    CGPoint  currentP = [panGs  translationInView:self.redV];
    
    self.redV.frame = [self transFormFrame:currentP.x];
    
    
    if(self.redV.x>0){
        self.greenV.hidden= NO;
        self.greenV.alpha = [self transFormAlpha:currentP.x];
    }else{
        self.greenV.hidden = YES;
        self.blueV.alpha = [self transFormAlpha:currentP.x];
    }
    
    CGFloat target = 0 ;
    if(panGs.state == UIGestureRecognizerStateEnded){
        if(self.redV.origin.x>self.view.width/2.0){
            target = targetR;
            self.greenV.alpha=1.0;
        }
       else if(CGRectGetMaxX(self.redV.frame)<self.view.width/2.0){
           target = targetL;
            self.blueV.alpha=1.0;
       }
        
        CGFloat offsetX = target - self.redV.x;
        [UIView animateWithDuration:0.35 animations:^{
            self.redV.frame = [self transFormFrame:offsetX];
        }];
    }
    [panGs setTranslation:CGPointZero inView:self.redV];
}

- (void)tap:(UITapGestureRecognizer*)tapGs{
    [UIView animateWithDuration:0.35 animations:^{
        self.redV.frame = self.view.bounds;
    }];
}
- (CGRect)transFormFrame:(CGFloat)offsetX
{
    CGRect rect = self.redV.frame;
    
    rect.origin.x += offsetX;
   
    rect.origin.y =fabs( maxY*rect.origin.x/self.view.width);
    
    rect.size.height = self.view.height  - 2*rect.origin.y;
    
    return rect;
}

-(CGFloat)transFormAlpha:(CGFloat)offsetX{
    CGRect rect = self.redV.frame;
    rect.origin.x += offsetX;
    
    rect.origin.y =fabs( maxY*rect.origin.x/self.view.width);
    
    CGFloat alpha = rect.origin.y/maxY;
    
    return alpha;
}


@end
