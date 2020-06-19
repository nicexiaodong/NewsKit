//
//  CDCarsTableViewCell.h
//  News_Example
//
//  Created by chen dong on 2020/6/19.
//  Copyright © 2020 3397838812@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CDCarsTableViewCellDelegate <NSObject>

- (void)CDCarsTableViewCellDelegateChooceBtnAction:(UIButton *)button;

@end

typedef void(^ChooceBtnActionBlock)(UIButton *button);

@interface CDCarsTableViewCell : UITableViewCell
@property (nonatomic, copy)ChooceBtnActionBlock chooceBtnActionBlock;
@property (nonatomic, retain)id <CDCarsTableViewCellDelegate>delegate;
- (void)loadDataSource;
@end

NS_ASSUME_NONNULL_END
