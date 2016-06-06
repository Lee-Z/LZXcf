//
//  LZKitTableViewCell.m
//  LZxcf
//
//  Created by app on 16/5/26.
//  Copyright © 2016年 win. All rights reserved.
//

#import "LZKitTableViewCell.h"
#import "LZKitTableViewController.h"
#import <UIImageView+WebCache.h>
#import "LZContents.h"
#import "LZContent.h"
#import "LZIssues.h"
#import "LZItems.h"
#import "LZImage.h"
#import "LZAuthor.h"
#import "UIBarButtonItem+Extension.h"
#import "LZAfnNetWork.h"
@interface LZKitTableViewCell()

//@property(nonatomic,strong)LZIssues *iss;
@property(nonatomic,strong)NSMutableArray *issuesArr;


@end

@implementation LZKitTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
#warning lzkitdalaget
//    //创建点击手势
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//    
//    //给图片添加点击手势
//    [self.KitImage addGestureRecognizer:tap];
//    //开启图片可点击功能
//    [self.KitImage setUserInteractionEnabled:YES];
    
    [self addlab];
    
    [self SetNewload];
    
}

#pragma mark 网络加载
-(void)SetNewload
{
    
//    LZAfnNetWork *afnnetwork=[[LZAfnNetWork alloc]init];
//    
//    [afnnetwork reach];
//    
//    [afnnetwork getWithURL:XCFRequestKitchenCell WithParmeters:nil];
//    
//    [afnnetwork setBlock:^(id info)
//     {
//         self.issuesArr=[LZIssues mj_objectArrayWithKeyValuesArray:info[@"content"][@"issues"]];
//       
//     }];
}

#pragma mark addLab设置
-(void)addlab
{
   

    CGFloat labX=self.KitImage.center.x;
    
    CGFloat labY=SCREEN_HEIGHT*0.1;
    CGFloat labH=64;
    
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel setFrame:CGRectMake(20, labY, SCREEN_WIDTH-40, labH)];
    
    
    [self.contentView addSubview:self.describeLabel];
    [self.describeLabel setFrame:CGRectMake(20, labY+44+10, SCREEN_WIDTH-40, labH)];

}

-(UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setFont:[UIFont systemFontOfSize:20.0]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
//        [_titleLabel setBackgroundColor:[UIColor redColor]];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setNumberOfLines:0];
    }
    return _titleLabel;
}


-(UILabel *)describeLabel
{
    if (_describeLabel == nil)
    {
        _describeLabel = [[UILabel alloc]init];
//        [_describeLabel setBackgroundColor:[UIColor grayColor]];
        [_describeLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_describeLabel setTextAlignment:NSTextAlignmentCenter];
        [_describeLabel setTextColor:[UIColor whiteColor]];

    }
    return _describeLabel;
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
      self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
};
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#warning KItTableDeletage
//-(void)tapAction:(UITapGestureRecognizer *)sender
//{
//    //respondsToSelector
////    if ([self.lzKitDeletage respondsToSelector:@selector(LZKitTableViewCellAction:)])
////    {
////        [self.lzKitDeletage LZKitTableViewCellAction:(UIImageView*)sender.view];
////    }
//   
//}


-(void)setIssues:(LZIssues *)issues
{
    [self.titleLabel setText:issues.title];
}



@end
