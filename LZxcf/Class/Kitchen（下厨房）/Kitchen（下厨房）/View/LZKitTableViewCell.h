//
//  LZKitTableViewCell.h
//  LZxcf
//
//  Created by app on 16/5/26.
//  Copyright © 2016年 win. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZIssues.h"
//#import "LZKitTableViewCellDeletage.h"

@interface LZKitTableViewCell : UITableViewCell

@property (nonatomic,strong) LZIssues *issues;

@property (weak, nonatomic) IBOutlet UIImageView *KitImage;
@property (nonatomic,strong) UILabel *titleLabel;  //!< 文本描述标签
@property (nonatomic,strong) UILabel *describeLabel;  //!< 描述标签

//@property (nonatomic,assign) id <LZKitTableViewCellDeletage> lzKitDeletage;

@end
