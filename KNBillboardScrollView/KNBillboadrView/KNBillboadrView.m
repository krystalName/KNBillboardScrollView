//
//  KNBillboadrView.m
//  KNBillboardScrollView
//
//  Created by 刘凡 on 2017/11/14.
//  Copyright © 2017年 KrystalName. All rights reserved.



#import "KNBillboadrView.h"
#import "NSTimer+KNTimer.h"
#import <ImageIO/ImageIO.h>

#define DEFAULTTIME 3
#define DEFAULTPOTINT 10
#define VERMARGIN 5
#define DEFAULTHEIGT 20


@interface KNBillboadrView()<UIScrollViewDelegate>

//图片描叙控件,默认在底部
@property(nonatomic, strong)UILabel *descLable;

//轮播图片的数组
@property(nonatomic, strong)NSMutableArray *imageArray;

@property(nonatomic, strong)UIScrollView *scrollView;

@property(nonatomic, strong)UIPageControl *pageControl;

@property(nonatomic, strong)UIImageView *currImageView;

@property(nonatomic, strong)UIImageView *otherImageView;

@property(nonatomic, assign)NSInteger currIndex;

@property(nonatomic, assign)NSInteger nextIndex;

@property(nonatomic, assign)CGSize pageImageSize;

@property(nonatomic, strong)NSTimer *timer;

@property(nonatomic, strong)NSOperationQueue *queue;
@end

@implementation KNBillboadrView



@end
