//
//  CDCarsViewController.m
//  News_Example
//
//  Created by chen dong on 2020/6/17.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDCarsViewController.h"
#import <Masonry.h>
#import "CDCarsTableViewCell.h"
#define CDCarsTableViewCellID @"CDCarsTableViewCellID"
#import "CDDropListView.h"
@interface CDCarsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic, strong)CDDropListView *dropListView;
@end

@implementation CDCarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[CDCarsTableViewCell class] forCellReuseIdentifier:CDCarsTableViewCellID];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@0);
        make.height.equalTo(self.view.mas_height);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CDCarsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CDCarsTableViewCellID];
    [cell loadDataSource];
    __weak typeof(self) weakSelf = self;
    cell.chooceBtnActionBlock = ^(UIButton * _Nonnull button) {
       CGRect frameBtn = [button.superview convertRect:button.frame toView:weakSelf.view];
        NSLog(@"%@",button);
        [weakSelf.dropListView showDropListView:button withButtonFrame:frameBtn arrayWithTitleArr:@[@"1",@"2",@"3",@"4"]];
        [weakSelf.view addSubview:weakSelf.dropListView];
    };
    return cell;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (CDDropListView *)dropListView{
    if (!_dropListView) {
        _dropListView = [[CDDropListView alloc]init];
    }
    return _dropListView;
}





@end
