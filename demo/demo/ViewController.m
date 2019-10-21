//
//  ViewController.m
//  helloworld
//
//  Created by cyq on 2019/10/15.
//  Copyright © 2019 www.helloworld.cyq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSDictionary *data;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.hidesBottomBarWhenPushed = YES;
    _data = @{
              @"AutoLayoutVC":@"AutoLayoutVC",
              @"SnapKitVC(AutoLayout-Swift)":@"SnapKitVC",
              @"YogaKitVC(FlexBox)":@"YogaKitVC"
              };
    [_tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
    self.title = @"list item";
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.allKeys.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.textLabel.text = [_data.allKeys objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Class cls = NSClassFromString([_data.allValues objectAtIndex:indexPath.row]);
    id vc = [[cls alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
