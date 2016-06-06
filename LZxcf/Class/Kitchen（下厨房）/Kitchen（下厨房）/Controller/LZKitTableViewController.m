//
//  LZKitTableViewController.m
//  LZXcf
//
//  Created by app on 16/5/7.
//  Copyright © 2016年 app. All rights reserved.
//

#import "LZKitTableViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "DQHotSearchViewController.h"
#import "LZMenuViewController.h"
#import "LZPurViewController.h"
#import <UIImageView+WebCache.h>
#import "LZAfnNetWork.h"

//Model
#import "LZContents.h"
#import "LZContent.h"
#import "LZIssues.h"
#import "LZItems.h"
#import "LZImage.h"
#import "LZAuthor.h"
#import "LZKitTableViewCell.h"
#import "UIViewController+Extension.h"

#import "XCFConstRequest.h"
#import <MJRefresh.h>

#define recipeHeaderIdentifier @"recipeHeaderIdentifier"


@interface LZKitTableViewController () //<LZKitTableViewCellDeletage>

//LZAfnNetWork *afnnetwork=[[LZAfnNetWork alloc]init];
//@property(nonnull,strong)LZAfnNetWork *afnnetwork;
//@property(nonatomic,strong)NSMutableArray *items;

@end

@implementation LZKitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self SetNewload];
   
    [self searchBtn];
    
    [self NavItem];
    
    [self setupRefresh];
    
}



#pragma mark--网络请求
-(void)SetNewload  
    {
//        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
//        [mgr GET:XCFRequestKitchenCell parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        self.issuesArr=[LZIssues mj_objectArrayWithKeyValuesArray:responseObject[@"content"][@"issues"]];
//        [self.tableView reloadData];
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//        }];
        
        LZAfnNetWork *afnnetwork=[[LZAfnNetWork alloc]init];
        
        [afnnetwork reach];
        
        [afnnetwork getWithURL:XCFRequestKitchenCell WithParmeters:nil];
        
        [afnnetwork setBlock:^(id info)
         {
             self.issuesArr=[LZIssues mj_objectArrayWithKeyValuesArray:info[@"content"][@"issues"]];
             [self.tableView reloadData];
         }];
    }

#pragma mark SearchBtn设置
-(void)searchBtn
    {
        UIButton * searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置button为圆角
        searchButton.layer.cornerRadius=4.0;
        searchButton.frame=CGRectMake(0, 0, CG_WIDTH(self.view) - 100, 30);
        [searchButton setImage:[UIImage imageNamed:@"searchIcon"] forState:UIControlStateNormal];
        //设置image的大小
        //    searchButton.imageEdgeInsets=UIEdgeInsetsMake(5, 13, 21, searchButton.titleLabel.bounds.size.width);
        searchButton.backgroundColor=HWColor(247, 247, 240);
        //    searchButton.userInteractionEnabled=NO;
    [searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [searchButton setTitle:@"菜谱、食材" forState:UIControlStateNormal];
    searchButton.titleLabel.textAlignment=NSTextAlignmentCenter;
    searchButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    self.navigationItem.titleView=searchButton;
    
    }
-(void)searchButtonClick
    {
    
        DQHotSearchViewController *hotSearchCtl = [DQHotSearchViewController new];
    
        [self.navigationController pushViewController:hotSearchCtl animated:YES ];
    };

#pragma mark --NavItem设置
-(void)NavItem
    {
        self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(add) image:@"homepageCreateRecipeButton" highImage:nil];
        self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(buylist) image:@"buylistButtonImage" highImage:@"buylistButtonImage"];
    }

-(void)add
{
      LZMenuViewController *Menu=[[LZMenuViewController alloc]init];
    [self.navigationController pushViewController:Menu animated:YES];
    
};
-(void)buylist
{
      LZPurViewController *Pur=[[LZPurViewController alloc]init];
    [self.navigationController pushViewController:Pur animated:YES];
}

#pragma mark 上下拉刷新
-(void)setupRefresh
{
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //     if (!self.issuesArre.count) self.tableView.mj_footer.hidden=YES;
}
-(void)loadNewData
{
    [self.tableView.mj_footer endRefreshing];
         LZAfnNetWork *afnnetwork=[[LZAfnNetWork alloc]init];
         
         [afnnetwork reach];

         [afnnetwork getWithURL:XCFRequestKitchenCell WithParmeters:nil];
         
         [afnnetwork setBlock:^(id info)
          {
              self.issuesArr=[LZIssues mj_objectArrayWithKeyValuesArray:info[@"content"][@"issues"]];
              [self.tableView reloadData];
              [self.tableView.mj_header endRefreshing];
          }];

   

};

-(void)loadMoreData
{
    [self.tableView.mj_header endRefreshing];
  
     LZAfnNetWork *afnnetwork=[[LZAfnNetWork alloc]init];
    
//    [afnnetwork reach];
    
    [afnnetwork getWithURL:XCFRequestKitchenCellMore WithParmeters:nil];
    
    [afnnetwork setBlock:^(id info)
     {
         NSArray *newContent=[LZIssues mj_objectArrayWithKeyValuesArray:info[@"content"][@"issues"]];
         [self.issuesArr addObjectsFromArray:newContent];
         [self.tableView reloadData];
         [self.tableView.mj_footer endRefreshing];
     }];
}
#pragma mark tabview属性设置
-(void)setupTableView
{
    //设置tableview为无线
    self.tableView.separatorStyle=UITableViewCellAccessoryNone ;
    self.view.backgroundColor=HWColor(245, 240, 215);
    [self.tableView registerClass:[UITableViewHeaderFooterView class]
     forHeaderFooterViewReuseIdentifier:recipeHeaderIdentifier];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
//    [self loadNavData];//下拉刷新同事刷新顶部导航数据
//    [self.tableView reloadData];
//    self.tableView.mj_footer.hidden=(self.issuesArr.count==0);
    return self.issuesArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
   
    
//    return self.issuesArr.count;
    return [self.issuesArr[section] items_count];
}
////cell 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 240;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"issues";
    
    LZKitTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    
    if(!cell)
    {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        LZKitTableViewCell *cell=[[[NSBundle mainBundle]loadNibNamed:@"LZKitTableViewCell" owner:nil options:nil]lastObject];
        cell=[[[NSBundle mainBundle]loadNibNamed:@"LZKitTableViewCell" owner:nil options:nil]lastObject];
#warning LZKitdeletage
//        [cell setLzKitDeletage:self];
//        cell.lzKitDeletage =  self;
        cell.backgroundColor=[UIColor whiteColor];
        
    }
    [cell.KitImage setTag:indexPath.row];
    LZIssues *issues=self.issuesArr[indexPath.section];
    LZItems *item=issues.items[indexPath.row];
//    LZImage *image=item.contents.image.url;
    LZContents *contents=item.contents;
    LZImage *image=contents.image;
    NSString *imageurl=image.url;
   
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageurl] placeholderImage:[UIImage imageNamed:@"strawberryFilter1"]];
    [cell.KitImage sd_setImageWithURL:[NSURL URLWithString:imageurl] placeholderImage:[UIImage imageNamed:@"strawberryFilter1"]];
    [cell.titleLabel setText:contents.title_1st];
    [cell.describeLabel setText:contents.title_2nd];
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:recipeHeaderIdentifier];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 50);
    headerView.contentView.backgroundColor = [UIColor whiteColor];
    NSInteger tag = 10;
    UILabel *label = [headerView.contentView viewWithTag:tag];
    if (label == nil) {
        label = [[UILabel alloc] init];
        label.tag = tag;
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.frame = headerView.contentView.bounds;
        [headerView.contentView addSubview:label];
    }
    LZIssues *issues=self.issuesArr[section];
    [label setText:issues.title];
    
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选择的是第几个分组
    LZIssues *iss =self.issuesArr[indexPath.section];
    //选择的是第几行
    LZItems *item=iss.items[indexPath.row];
    NSLog(@"====%lu+++",(unsigned long)item.template);
    if (item.template==1,2,3,4,5,6) {
        [self pushWebViewWithURL:item.url];
    }
}


#pragma mark 懒加载
- (NSMutableArray *)issuesArr {
    if (!_issuesArr) {
        _issuesArr= [NSMutableArray array];
    }
    return _issuesArr;
}


#pragma mark - LZKitTableViewCellDeletage
//-(void)LZKitTableViewCellAction:(UIImageView *)kitImage
//{
//    NSLog(@"你点击了图片%d",kitImage.tag);
//}


@end
