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
#define HEIGHT self.scrollView.frame.size.height
#define WIDTH self.scrollView.frame.size.width


@interface KNBillboadrView()<UIScrollViewDelegate>

///图片描叙控件,默认在底部
@property(nonatomic, strong)UILabel *descLable;

///轮播图片的数组
@property(nonatomic, strong)NSMutableArray *imageArray;

@property(nonatomic, strong)NSMutableArray *titleArray;

///滑动控件
@property(nonatomic, strong)UIScrollView *scrollView;

///页面控制器
@property(nonatomic, strong)UIPageControl *pageControl;

///当前页面图片
@property(nonatomic, strong)UIImageView *currImageView;

///别的页面图片
@property(nonatomic, strong)UIImageView *otherImageView;

///当前页面下标
@property(nonatomic, assign)NSInteger currIndex;

///下一个页面下标
@property(nonatomic, assign)NSInteger nextIndex;

///pagecontrol的图片大小
@property(nonatomic, assign)CGSize pageImageSize;

///定时器
@property(nonatomic, strong)NSTimer *timer;

///队列
@property(nonatomic, strong)NSOperationQueue *queue;

@end

static NSString *cache;

@implementation KNBillboadrView

//创建用来缓存图片的文件夹
+(void)initialize
{
    cache = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"KNCarousel"];
    BOOL isDir = NO;
    BOOL isExists = [[NSFileManager defaultManager] fileExistsAtPath:cache isDirectory:isDir];
    if (!isExists || !isDir) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cache withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

- (instancetype)initKNBillboadrViewWithFrame:(CGRect )frame andImageArray:(NSArray *)imageArray andDescArray:(NSArray *)descArray
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.imageArray addObjectsFromArray:imageArray];
        [self.titleArray addObjectsFromArray:descArray];
        

    }
    return self;
}

//图片点击
-(void)imageClick{
    
}

#pragma mark - 设置相关
-(void)setDescLableFont:(UIFont *)DescLableFont
{
    _DescLableFont = DescLableFont;
    self.descLable.font = DescLableFont;
    
}

-(void)setDescLableColor:(UIColor *)DescLableColor{
    _DescLableColor = DescLableColor;
    self.descLable.textColor = DescLableColor;
}

-(void)setDescLableBackgroundColor:(UIColor *)DescLableBackgroundColor{
    _DescLableBackgroundColor = DescLableBackgroundColor;
    self.descLable.backgroundColor = DescLableBackgroundColor;
}
#pragma mark - 懒加载.
-(NSOperationQueue *)queue{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc]init];
    }
    return _queue;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.scrollsToTop = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        //添加手势图片的点击
        UITapGestureRecognizer *ImageClick = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick)];
        [_scrollView addGestureRecognizer:ImageClick];
        [_scrollView addSubview:self.currImageView];
        [_scrollView addSubview:self.otherImageView];
    }
    return _scrollView;
}

-(UIImageView *)currImageView{
    if (!_currImageView) {
        _currImageView = [[UIImageView alloc]init];
        _currImageView.clipsToBounds = YES;
    }
    return _currImageView;
}
-(UIImageView *)otherImageView{
    if (!_otherImageView) {
        _otherImageView = [[UIImageView alloc]init];
        _otherImageView.clipsToBounds = YES;
    }
    return _otherImageView;
}

-(UILabel *)descLable{
    if (!_descLable) {
        _descLable = [[UILabel alloc]init];
        _descLable.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _descLable.textColor = [UIColor whiteColor];
        _descLable.textAlignment = NSTextAlignmentCenter;
        _descLable.font = [UIFont systemFontOfSize:13];
        _descLable.hidden = YES;
    }
    return _descLable;
}

-(UIPageControl *)pageControl{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.userInteractionEnabled = NO;
    }
    return _pageControl;
}

-(NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}
-(NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}

@end
