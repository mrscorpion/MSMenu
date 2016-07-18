//
//  AATableViewCell.m
//  UIMenuController
//
//  Created by mr.scorpion on 16/7/12.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "AATableViewCell.h"

@implementation AATableViewCell


//1.添加longpress事件

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 给单元格cell 添加长按手势并绑定方法
        [self addGestureRecognizer: [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)]];
        //单元格文字
        _lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 4, 290, 30)];
        _lab.numberOfLines=0;
        _lab.font = [UIFont systemFontOfSize:25];
        
        [self.contentView addSubview:self.lab];
    }
    
    return self;
    
}

//2.处理长按事件

-(void)longTap:(UILongPressGestureRecognizer *)longRecognizer

{
    //判断 如果当前是长按状态
    if (longRecognizer.state==UIGestureRecognizerStateBegan) {
        //cell 作为第一响应控件
        [self becomeFirstResponder];
        //创建一个菜单控制器  单例
        UIMenuController *menu=[UIMenuController sharedMenuController];
        //创建两个菜单按钮
        UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"请点击我,我叫复制" action:@selector(copyItemClicked:)];
        
        UIMenuItem *resendItem = [[UIMenuItem alloc] initWithTitle:@"嘿嘿嘿" action:@selector(resendItemClicked:)];
        //添加到控制器上
        [menu setMenuItems:[NSArray arrayWithObjects:copyItem,resendItem,nil]];
        //菜单的位置  在cell 的边界
        [menu setTargetRect:self.bounds inView:self];
        //菜单的显示
        [menu setMenuVisible:YES animated:YES];
        
    }
    
}

//3.实现默认方法

#pragma mark 处理action事件

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    if(action ==@selector(copyItemClicked:)){
        
        return YES;
        
    }else if (action==@selector(resendItemClicked:)){
        
        return YES;
        
    }
    
    return [super canPerformAction:action withSender:sender];
    
}

#pragma mark 实现成为第一响应者方法

-(BOOL)canBecomeFirstResponder{
    
    return YES;
    
}

//4.处理item点击事件

#pragma mark method

-(void)resendItemClicked:(id)sender{
    
    NSLog(@"转发");
    
    //通知代理
    
}

-(void)copyItemClicked:(id)sender{
    
    NSLog(@"复制");
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
  [pasteboard setString:[[self textLabel]text]];
    // 通知代理
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
