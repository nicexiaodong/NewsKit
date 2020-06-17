//
//  CDViewController.m
//  News
//
//  Created by 3397838812@qq.com on 06/17/2020.
//  Copyright (c) 2020 3397838812@qq.com. All rights reserved.
//

#import "CDViewController.h"
#import "CDCarsViewController.h"
#import "CDHomeViewController.h"
#import "CDFoodViewController.h"
@interface CDViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *titleScrollView;
@property (nonatomic,strong)UIScrollView *contentScrollView;
@property (nonatomic,strong)NSMutableArray *btnArr;
@property (nonatomic,strong)UIButton *selectingBtn;
@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"news";
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat navHeight = self.navigationController.navigationBar.bounds.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
    
    self.titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, navHeight, [UIScreen mainScreen].bounds.size.width, 40)];
    self.titleScrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.titleScrollView];
    
    self.contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, navHeight +40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -40)];
    self.contentScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.contentScrollView];
    
    
    

    [self initButtonForButtonScrollView];
}
//创建导航栏scrollview
- (void)initButtonForButtonScrollView{
    
    [self initChildViewControllers];
    
    CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width/2.0;
    CGFloat buttonHeight = 40;
    NSInteger childViewControllersCount = self.childViewControllers.count;
    for (NSInteger i = 0; i < childViewControllersCount; i++) {
        UIViewController *childViewController = self.childViewControllers[i];
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.tag = i;
        CGFloat x = i * buttonWidth;
        titleBtn.frame = CGRectMake(x, 0, buttonWidth, buttonHeight);
        [titleBtn setTitle:childViewController.title forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleBtnActionOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleScrollView addSubview:titleBtn];
        [self.btnArr addObject:titleBtn];
    }
    
    self.titleScrollView.contentSize = CGSizeMake(buttonWidth * childViewControllersCount, 0);
    self.titleScrollView.showsHorizontalScrollIndicator = NO;
    self.titleScrollView.bounces = NO;
    
    self.contentScrollView.contentSize = CGSizeMake(buttonWidth *childViewControllersCount, 0);
    self.contentScrollView.showsHorizontalScrollIndicator = NO;
    self.contentScrollView.pagingEnabled = YES;
    self.contentScrollView.delegate = self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self titleBtnActionOnClick:self.btnArr[0]];
    
}
- (void)titleBtnActionOnClick:(UIButton *)button{
    //选中按钮
    [self selectingBtn:button];
    //显示子视图
    [self addViewToContentScrollView:button];
}

//选中按钮
- (void)selectingBtn:(UIButton *)button{
    [self.selectingBtn setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
    self.selectingBtn.transform = CGAffineTransformMakeScale(1.0, 1.0);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.transform = CGAffineTransformMakeScale(1.3, 1.3);//设置选中字体大小
    self.selectingBtn = button;
    
    //选中按钮时要让选中按钮居中
    CGFloat offSetx = button.frame.origin.x - [UIScreen mainScreen].bounds.size.width * 0.5;
    CGFloat maxOffSetx = self.titleScrollView.contentSize.width - [UIScreen mainScreen].bounds.size.width;
    if (offSetx <0) {
        offSetx = 0;
    }else if (offSetx > maxOffSetx){
        offSetx = maxOffSetx;
    }
    
    [self.titleScrollView setContentOffset:CGPointMake(offSetx, 0) animated:YES];
    
}

- (void)addViewToContentScrollView:(UIButton *)button{
    NSInteger i = button.tag;
    UIViewController *childVC = self.childViewControllers[i];
    CGFloat x = i * [UIScreen mainScreen].bounds.size.width;
    
    if (childVC.view.subviews != nil) {
        childVC.view.frame = CGRectMake(x, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self.contentScrollView addSubview:childVC.view];
    }
    self.contentScrollView.contentOffset = CGPointMake(x, 0);
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger i = self.contentScrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width;
    [self addViewToContentScrollView:self.btnArr[i]];
    [self selectingBtn:self.btnArr[i]];
}




//初始化子控制器
- (void)initChildViewControllers{
    
    CDCarsViewController *carsVC = [[CDCarsViewController alloc]init];
    carsVC.title = @"汽车";
    [self addChildViewController:carsVC];
    
    CDHomeViewController *homeVC = [[CDHomeViewController alloc]init];
    homeVC.title = @"房子";
    [self addChildViewController:homeVC];
    
    CDFoodViewController *foodVC = [[CDFoodViewController alloc]init];
    foodVC.title = @"食物";
    [self addChildViewController:foodVC];
    
}

- (NSMutableArray *)btnArr{
    if (_btnArr == nil) {
        _btnArr = [NSMutableArray array];
        
    }
    return _btnArr;
}

@end
