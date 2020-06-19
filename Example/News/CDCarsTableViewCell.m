//
//  CDCarsTableViewCell.m
//  News_Example
//
//  Created by chen dong on 2020/6/19.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import "CDCarsTableViewCell.h"
#import <Masonry.h>
@interface CDCarsTableViewCell ()
@property (nonatomic, strong)UIButton *chooceBtn;
@end

@implementation CDCarsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUIView];
    }
    return self;
}

- (void)setUpUIView{
    [self.contentView addSubview:self.chooceBtn];
}

- (void)loadDataSource{
    
    [self.chooceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(@0);
    }];
    
}
- (void)chooceBtnActionOnClick:(UIButton *)button{
    
    if (self.chooceBtnActionBlock) {
        self.chooceBtnActionBlock(button);
    }
    
    if ([self.delegate respondsToSelector:@selector(CDCarsTableViewCellDelegateChooceBtnAction:)]) {
        [self.delegate CDCarsTableViewCellDelegateChooceBtnAction:button];
    }
    
}

- (UIButton *)chooceBtn{
    if (!_chooceBtn) {
        _chooceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chooceBtn setTitle:@"选择" forState:UIControlStateNormal];
        [_chooceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _chooceBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_chooceBtn addTarget:self action:@selector(chooceBtnActionOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooceBtn;
}

@end
