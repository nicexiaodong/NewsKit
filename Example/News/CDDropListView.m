//
//  CDDropListView.m
//  News_Example
//
//  Created by chen dong on 2020/6/19.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDDropListView.h"

@interface CDDropListView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation CDDropListView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self addSubview:self.tableView];
//    }
//    return self;
//}

- (void)showDropListView:(UIButton *)button withButtonFrame:(CGRect)buttonFrame arrayWithTitleArr:(NSArray *)titleArr{
    self.backgroundColor = [UIColor whiteColor];
    self.dataArr = [NSMutableArray arrayWithArray:titleArr];
    
    CGFloat height = 0;
    if (titleArr.count <=4) {
        height = titleArr.count *40;
    }else{
        height = 200;
    }
    
    self.frame = CGRectMake(buttonFrame.origin.x, buttonFrame.origin.y, buttonFrame.size.width, 0);
    self.layer.masksToBounds = NO;
    self.layer.cornerRadius = 8;
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.frame = CGRectMake(buttonFrame.origin.x, buttonFrame.origin.y +buttonFrame.size.height +2, buttonFrame.size.width, height);
    self.tableView.frame = CGRectMake(0, 0, buttonFrame.size.width, height);
    [UIView commitAnimations];
    [self addSubview:self.tableView];
    

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",self.dataArr[indexPath.row]);
    [self removeFromSuperview];
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
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


@end
