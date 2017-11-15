//
//  ViewController.m
//  KNBillboardScrollView
//
//  Created by 刘凡 on 2017/11/14.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import "ViewController.h"
#import "KNBillboadrView.h"

@interface ViewController ()<KNBillboadrViewDelegate>

@property(nonatomic, strong)KNBillboadrView *bollboadrView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //定义两个数组。
    
    NSArray *imageArray = @[
                             [UIImage imageNamed:@"3.jpg"],
                            @"https://www.baiduyunfuli.com/wp-content/uploads/2016/11/zhangxueyouyanchanghui.jpg",
                             gifImageNamed(@"2.gif"),
                              @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510742500435&di=423f1fec806fe7d093de2390b71fe173&imgtype=0&src=http%3A%2F%2Fpic.962.net%2Fup%2F2016-12%2F14821185309667631.gif"
                            ];
    
    NSArray *descArray = @[@"本地看星星",@"网络图片",@"本地gif图片",@"网络gif图片"];
    
    
    _bollboadrView = [[KNBillboadrView alloc]initKNBillboadrViewWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 200) andImageArray:imageArray andDescArray:descArray andplaceholdImage:[UIImage imageNamed:@"KNBilboardDefalutImge.png"]];
    
    //设置代理
    _bollboadrView.delegate = self;
    //设置分页控件的位置，默认为PositionBottomCenter
    _bollboadrView.KNPageCotrollPostion = KNPostionBottomLeft;
    
    //设置动画
    _bollboadrView.KNChangeMode = KNChangeModeFade;
    
    // 设置滑动时gif停止播放
    _bollboadrView.gifPlayMode = KNGifPlayModePauseWhenScroll;
    
    [self.view addSubview:_bollboadrView];
    
    
    
}

-(void)KNBillboadrView:(KNBillboadrView *)BillboadrView ClickImageForIndex:(NSInteger)index
{
    NSLog(@"index %ld",index);
}



@end
