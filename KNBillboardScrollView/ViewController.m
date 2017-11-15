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
                            @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510747788301&di=1265b6a44927172a90f3bebcf088ab02&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2F5243fbf2b2119313373b1edd6f380cd791238d67.jpg",
                              gifImageNamed(@"2.gif"),
                              @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1510747412310&di=308b1b2e2d6ccb6a35796275fc185eaf&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01f90e593a4ad4a8012193a3dcf03d.gif"
                            ];
    
    NSArray *descArray = @[@"本地看星星",@"网络图片",@"本地gif图片",@"网络gif图片"];
    
    
    //创建广告栏
    _bollboadrView = [[KNBillboadrView alloc]initKNBillboadrViewWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 200) andImageArray:imageArray andDescArray:descArray andplaceholdImage:[UIImage imageNamed:@"KNBilboardDefalutImge.png"]];
    
    [_bollboadrView setPageColor:[UIColor redColor] andCurrentPageColor:[UIColor whiteColor]];
    //设置代理
    _bollboadrView.delegate = self;
    //设置分页控件的位置，默认为PositionBottomCenter
    _bollboadrView.KNPageCotrollPostion = KNPostionBottomLeft;
    //设置切换时间
    _bollboadrView.time = 5.f;
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
