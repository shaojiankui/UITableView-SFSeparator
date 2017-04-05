//
//  Cell.m
//  UITableView-SFSeparator
//
//  Created by Jakey on 2017/4/4.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "Cell.h"

@implementation Cell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.contentView.backgroundColor = [UIColor redColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//-(void)setFrame:(CGRect)frame {
//    CGRect rect2 = frame;
//    rect2.origin.y -= 10;
//    [super setFrame:rect2];
//}
//- (void)layoutSubviews {
//    [super layoutSubviews];
//    CGRect tmpFrame = self.frame;
//    tmpFrame.origin.y += 10;
//    
//    self.frame = tmpFrame;
//}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.contentView.frame = UIEdgeInsetsInsetRect(self.contentView.frame, UIEdgeInsetsMake(10, 10, 10, 10));

}
@end
