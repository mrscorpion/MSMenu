//
//  TableViewCell.m
//  UIMenuController
//
//  Created by 悟空` on 16/7/12.
//  Copyright © 2016年 悟空`. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

//1.添加longpress事件

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addGestureRecognizer: [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)]];
        
    }
    
    return self;
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
