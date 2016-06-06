//
//  LZCreatMenuTableViewController.m
//  LZxcf
//
//  Created by win on 16/5/10.
//  Copyright © 2016年 win. All rights reserved.
//

#import "LZCreatMenuTableViewController.h"
#import "LZMenuViewController.h"
#import "LZMenuViewController.h"

#import "UILabel+Extension.h"

#import <Masonry.h>

@interface LZCreatMenuTableViewController ()<UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *ShowLab;


@end

@implementation LZCreatMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetHeaderView];
    self.navigationItem.title=@"创建菜谱";
    self.tableView.backgroundColor=HWColor(245, 240, 215);
    
}

#pragma mark ----headerview设置
-(void)SetHeaderView
{
   
    
    UIView *viewHeader=[UIView new];
    [viewHeader setBackgroundColor:HWColor(245, 240, 215)];
//    [viewHeader setFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.H+200)];
//    self.tableView.tableHeaderView=viewHeader;

    
    
    
    UIImageView *imageHer=[[UIImageView alloc]init];
    [imageHer setBackgroundColor:HWColor(235, 235, 226)];
    //设置图片不拉伸
    imageHer.contentMode=UIViewContentModeCenter;
    
    imageHer.image=[UIImage imageNamed:@"createRecipeCamera"];
    [viewHeader addSubview:imageHer];
    //添加点击手势
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapimage)];
   
    imageHer.userInteractionEnabled=YES;
    [imageHer addGestureRecognizer:tap];
    
    
    
    [imageHer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewHeader.mas_top);
        make.left.equalTo(viewHeader.mas_left);
        make.right.equalTo(viewHeader.mas_right);
        make.height.mas_equalTo(200);
    }];
   
    
   
    
    
    UILabel *lab=[UILabel new];
//    [lab setBackgroundColor:[UIColor redColor]];
    [viewHeader addSubview:lab];
    self.ShowLab=lab;
    
    [lab setText:self.nametext];
   
    
    lab.numberOfLines=0;
    lab.lineBreakMode = NSLineBreakByCharWrapping;
     CGFloat h=[lab getSpaceLabelHeight:lab.text withWidh:300 ];
    
      [viewHeader setFrame:CGRectMake(0, 0, SCREEN_WIDTH, h+220)];
    self.tableView.tableHeaderView=viewHeader;
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageHer.mas_bottom).offset(10);
        make.left.equalTo(imageHer.mas_left).offset(20);
        make.right.equalTo(imageHer.mas_right).offset(-120);
        make.height.mas_equalTo(h);
    }];
    
     [viewHeader setFrame:CGRectMake(0, 0, SCREEN_WIDTH, 250+h)];
    
    UIButton *btn=[UIButton new];
//    [btn setBackgroundColor:[UIColor blueColor]];
    [viewHeader addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lab.mas_top);
        make.left.equalTo(lab.mas_right).offset(20);
//        make.right.equalTo(viewHeader.mas_right).offset(-20);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
        
    }];
    [btn setImage:[UIImage imageNamed:@"createRecipeEdit"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(editBtn) forControlEvents:UIControlEventTouchUpInside];
   
}


-(void)editBtn
{
    LZMenuViewController *MenuView= [[LZMenuViewController alloc]init];
    [self.navigationController pushViewController:MenuView animated:YES];
}

#pragma mark ----下弹设置
-(void)tapimage
{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"t提示" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        NSLog(@"点击了相机");
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentModalViewController:picker animated:YES]; 
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //点击按钮的响应事件；
        NSLog(@"点击了相册");
    }]];
    
    
    [alert addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:true completion:nil];
    
   
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 0;
    
}

#pragma mark -------Setup UITableViewHeaderFooterView

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *headerView = [[UITableViewHeaderFooterView alloc]init];
    
    headerView.frame = CGRectMake(3, 0, SCREEN_WIDTH, 20);
    
    headerView.contentView.backgroundColor = HWColor(245, 240, 215);
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
   
    if (btn) {
        
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn addTarget:self action:@selector(setBtn) forControlEvents:UIControlEventTouchUpInside];
        
        btn.frame = headerView.contentView.frame;
        
        //从Btn左边开始
        btn.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
        
        [btn setTitleColor:HWColor(128, 128, 128) forState:UIControlStateNormal];

        btn.titleLabel.font=[UIFont systemFontOfSize:14];
        
        //设置button中的图片和文字之间的距离
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 3, 0, 0)];
       
        [btn setTitle:@"添加简介" forState:UIControlStateNormal];
        
         // UIViewContentModeScaleAspectFit  将btn图片不拉伸
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [btn setImage:[UIImage imageNamed:@"addMark"] forState:UIControlStateNormal];
    
        [headerView.contentView addSubview:btn];
     
    }
    
    return headerView;
}

-(void)setBtn
{
    NSLog(@"简介");
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/



@end
