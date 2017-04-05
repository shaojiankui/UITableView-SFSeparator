//
//  UITableView+SFSeparator.h
//  UITableView-SFSeparator
//
//  Created by Jakey on 2017/4/4.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UITableViewSFSeparatorDelegate <NSObject>
@optional
- (UIView *)sf_tableView:(UITableView *)tableView viewForSeparatorAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)sf_tableView:(UITableView *)tableView heightForSeparatorAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface UITableView (SFSeparator)
@end
