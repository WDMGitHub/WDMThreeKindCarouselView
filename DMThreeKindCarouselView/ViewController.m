//
//  ViewController.m
//  DMThreeKindCarouselView
//
//  Created by demin on 16/9/2.
//  Copyright © 2016年 Demin. All rights reserved.
//

#import "ViewController.h"
#import "DMCarouselView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //#if 1是网络图片, 0是本地图片（你可以手动更改试一试）
#if 0
    NSArray *array = @[
                       @"http://image.wisewanzhi.com/474c907f303cc954485f3528406dd826@4e_0o_0l_1216h_828w_90q.jpg",
                       @"http://image.wisewanzhi.com/5ab274f45ef761d533f07d6c89189477@4e_0o_0l_1216h_828w_90q.jpg",
                       @"http://image.wisewanzhi.com/e7c77dbc518f96315f24f1b6e3d064e2@4e_0o_0l_1216h_828w_90q.jpg",
                       @"http://image.wisewanzhi.com/9f641db222dfbec094013c2da03ef9a8@4e_0o_0l_1216h_828w_90q.jpg",
                       //这张gif图很耗内存，用的时候需要注意
//                       @"http://photo.l99.com/source/11/1330351552722_cxn26e.gif"
                       ];
#else
    NSArray *array = @[
                       @"火影01",
                       @"火影02",
                       @"火影03",
                       @"火影04",
                       ];
#endif
    
    //如果数组为空返回，或者也可以自己传一个占位图片的数组
    if (array != nil && ![array isKindOfClass:[NSNull class]] && array.count != 0)
    {
        //调用方法-->就是直接创建一个对象
        DMCarouselView *carouselView = [[DMCarouselView alloc] initWithFrame:[UIScreen mainScreen].bounds andScrollViewMode:ScrollWithParallax andImagesArray:array];
        /**
         ScrollWithDefault = 1,  //1正常左右衔接轮播
         ScrollWithParallax,     //2上下叠加视差轮播
         ScrollWithThreePages,   //3多屏图片轮播
         */
        
        /**
         时间间隔一定要写在调用下面方法之前，因为方法里调用了创建时间控制器，之后再设置间隔时间的话，就没有作用了
         */
        //    scrollView.timeInterval = 1.f;
        
        [carouselView addImagesArray:array centerItemFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, [UIScreen mainScreen].bounds.size.height) currentImageClick:^(NSInteger index) {
            NSLog(@"--->我点的这是第%ld张图片", (long)index);
        }];
        //添加带父视图上
        [self.view addSubview:carouselView];

    }
    
    NSLog(@"您的图片数组为空!");
}

@end
