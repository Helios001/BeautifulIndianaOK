//
//  IndianaViewController.m
//  BeautifulIndiana
//  类描述：夺宝
//  Created by Helios on 16/2/1.
//  Copyright © 2016年 Helios. All rights reserved.
//

#import "YFIndianaViewController.h"
#import "IndianaBannerCell.h"

@interface YFIndianaViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *indianaTableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation YFIndianaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"夺宝";
    self.view.backgroundColor = RGB_COLOR(245, 245, 245, 1.0);
    
    _dataArray = [[NSMutableArray alloc]init];
    
    [self initTableView];
}

-(void)initTableView{
    _indianaTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _indianaTableView.delegate      = self;
    _indianaTableView.dataSource    = self;
    _indianaTableView.backgroundColor = RGB_COLOR(0, 255, 55, 1.0);//RGB_COLOR(248, 248, 248, 1.0);
    _indianaTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _indianaTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_indianaTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:{
            static NSString *IBCellIdentifier = @"IndianaBannerCell";
            IndianaBannerCell *cell = [[IndianaBannerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IBCellIdentifier];
            return cell;
        }
            
            break;
        case 1:{
            static NSString *IBCellIdentifier = @"IndianaBannerCell";
            IndianaBannerCell *cell = [[IndianaBannerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IBCellIdentifier];
            return cell;
        }
            
            break;
        case 2:{
            static NSString *IBCellIdentifier = @"IndianaBannerCell";
            IndianaBannerCell *cell = [[IndianaBannerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IBCellIdentifier];
            return cell;
        }
            
            break;
            
        default:{
            static NSString *IBCellIdentifier = @"IndianaBannerCell";
            IndianaBannerCell *cell = [[IndianaBannerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IBCellIdentifier];
            return cell;
        }
            
            break;
    }
}



@end
