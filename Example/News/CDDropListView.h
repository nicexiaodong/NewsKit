//
//  CDDropListView.h
//  News_Example
//
//  Created by chen dong on 2020/6/19.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDDropListView : UIView

/// 加载DropListView
/// @param button 选中按钮
/// @param buttonFrame 选中按钮的Frame
/// @param titleArr 数据列表
- (void)showDropListView:(UIButton *)button withButtonFrame:(CGRect)buttonFrame arrayWithTitleArr:(NSArray *)titleArr;
@end

NS_ASSUME_NONNULL_END
