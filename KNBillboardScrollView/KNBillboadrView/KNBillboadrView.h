//
//  KNBillboadrView.h
//  KNBillboardScrollView
//
//  Created by 刘凡 on 2017/11/14.
//  Copyright © 2017年 KrystalName. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KNBillboadrView;
//pageControll的显示位置
typedef NS_ENUM(NSInteger, KNPageControllPostion){
    KNPostionDefalut, //默认值 ==  PostionCenter
    KNPostionHide,      //隐藏控件
    KNPostionBottomLeft, //右下
    KNPostionBottomRtight,//左下
    KNPostionBottomCenter //中下
};


//图片切换方式
typedef NS_ENUM(NSInteger, KNChangeMode){
    KNChangeModeDefault, //轮播滚动
    KNChangeModeFade //淡入淡出
};

@protocol KNBillboadrViewDelegate <NSObject>


/**
 该方法用来处理图片的点击，会返回图片在数组中的索引
 
 @param BillboadrView 控件本身
 @param index 当前点击图片的下标
 */
-(void)KNBillboadrView:(KNBillboadrView *)BillboadrView ClickImageForIndex:(NSInteger *)index;

@end


/**
 C语言函数,创建本地gif图片

 @param imageName 本地gif图片请使用该函数创建，否则gif无动画效果
 @return 图片名称
 */
UIImage *gitImageNamed(NSString *imageName);


@interface KNBillboadrView : UIView



#pragma mark - 方法
/**
 创建轮播View

 @param rect rect.位置设置大小
 @param imageArray 图片数组
 @param descArray 描叙数组
 */
-(void)createKNBillboadrViewForRect:(CGRect *)rect andImageArray:(NSArray *)imageArray andDescArray:(NSArray *)descArray;


/**
 创建轮播图View

 @param rect rect位置大小
 @param imageArray 图片数组
 */
-(void)setKNBillboadrViewForRect:(CGRect *)rect andImageArray:(NSArray *)imageArray;


/**
 设置分也控件指示颜色
 
 @param color 其他页码颜色
 @param currentColor 当前页面的颜色
 */
-(void)setPageColor:(UIColor *)color andCurrentPageColor:(UIColor *)currentColor;


/**
 设置页码控件指示图片
 
 @param image 其他页码图片
 @param currentImage 当前页码图片
 */
-(void)setPageImage:(UIImage *)image andCurrentPageImage:(UIImage *)currentImage;

/**
 打开定时器,默认打开
  调用该方法会重新开启
 */
-(void)startTimer;

/**
 停止定时器
 */
-(void)StopTimer;

/**
 清理沙盒中图片缓存
 */
+(void)clearDiskCache;

#pragma mark - 基本属性
///设置图片切换模式. 默认为KNChangeModeDefalut;
@property(nonatomic, assign)KNChangeMode KNChangeMode;

///设置图片内容模式, 默认为UIViewContentModeScaleToFill
@property(nonatomic, assign)UIViewContentMode contentMode;

///设置分页控件位置, 默认为PositionBottomCenter/一张图片时隐藏
@property(nonatomic, assign)KNPageControllPostion KNPageCotrollPostion;

///属性无法满足。自行设置分页的Positio
@property(nonatomic, assign)CGPoint pageOffset;

///设置占位图 默认设置为 KNBilboardDefalutImge.png
@property(nonatomic, strong)UIImage *placeholdImage;

///设置图片描叙的颜色
@property(nonatomic, strong)UIColor *DescLableColor;

///设置图片描叙的字体大小
@property(nonatomic, strong)UIFont *DescLableFont;

///设置描叙的字体背景颜色
@property(nonatomic, strong)UIColor *DescLableColorBakegrundColor;

///设置自动缓存. 默认为打开
@property(nonatomic, assign)BOOL autoCache;

@property(nonatomic, weak) id<KNBillboadrViewDelegate> delegate;

@end
