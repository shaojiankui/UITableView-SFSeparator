//
//  RootViewController.m
//  UITableView-SFSeparator
//
//  Created by Jakey on 2017/4/4.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "RootViewController.h"
#import "Cell.h"
@interface RootViewController ()
{
    NSMutableArray *_items;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.myTableView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    _items = @[@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123",@"123"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma -mark TableView Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_items count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    //    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:CellIdentifier];
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return   UITableViewCellEditingStyleDelete;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
- (UIView *)sf_tableView:(UITableView *)tableView viewForSeparatorAtIndexPath:(NSIndexPath *)indexPath{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 40)];
    view.backgroundColor = [UIColor redColor];
    return view;
}
-(CGFloat)sf_tableView:(UITableView *)tableView heightForSeparatorAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
@end
