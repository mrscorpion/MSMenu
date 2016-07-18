//
//  ViewController.m
//  UIMenuController
//
//  Created by mr.scorpion on 16/7/12.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ViewController.h"
#import "AATableViewCell.h"
#define IDENTIFIERCELL @"identifierCell"

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
{
    UITableView *table;
    NSArray *arr;
    UITextField *tf;
}
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) style:UITableViewStyleGrouped];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table ];


    tf = [[UITextField alloc]initWithFrame:CGRectMake(20, 350, 400, 300)];
    tf.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:tf];
    
    //给输入框添加长按手势
      [tf addGestureRecognizer: [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)]];
    
    
    
    //表格注册类
    [table registerClass:[AATableViewCell class] forCellReuseIdentifier:IDENTIFIERCELL];
    
 arr = @[@"刘姥姥今天没洗脸",@"强欧巴今天没洗脸",@"同同今天没洗脸",@"翔弟今天没洗脸"];
    
 
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AATableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:IDENTIFIERCELL];
    
 
    cell.textLabel.text =arr [indexPath.row];
    
    return cell;
}

-(void)panGestureBottom:(UILongPressGestureRecognizer *)longPress
{
    UIMenuItem * itemPase = [[UIMenuItem alloc] initWithTitle:@"粘贴" action:@selector(pase)];
    
    UIMenuController * menuController = [UIMenuController sharedMenuController];
    [menuController setMenuItems: @[itemPase]];
    
    CGPoint location = [longPress locationInView:[longPress view]];
    CGRect menuLocation = CGRectMake(location.x, location.y, 0, 0);
    [menuController setTargetRect:menuLocation inView:[longPress view]];
    menuController.arrowDirection = UIMenuControllerArrowDown;
    
    [menuController setMenuVisible:YES animated:YES];
    
}


-(void)pase
{
    UIPasteboard * pasterBoard = [UIPasteboard pasteboardWithName:@"com.test.image" create:NO];
    tf.text =[[UIPasteboard generalPasteboard] string];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
