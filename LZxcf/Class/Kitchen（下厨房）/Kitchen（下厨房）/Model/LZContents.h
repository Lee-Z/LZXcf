//
//  LZContents.h
//  LZxcf
//
//  Created by app on 16/5/20.
//  Copyright © 2016年 win. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZImage.h"
#import "LZAuthor.h"

@interface LZContents : NSObject


/**0-3模块*/
/**标题*/
@property(nonatomic,copy)NSString *title;
/** 小标题 */
@property(nonatomic,copy)NSString *title_2nd;
/** 大标题 */
@property(nonatomic,copy)NSString *title_1st;
/** 图片内容 */
@property(nonatomic,strong)LZImage *image;
/**未知*/
@property(nonatomic,copy)NSString *column_name;
/**4*/
/** 视频地址 */
@property(nonatomic,copy)NSString *video_url;
/** 作者 */
@property(nonatomic,strong)LZAuthor *author;
/** 做过的人数 */
@property(nonatomic,assign)NSUInteger n_cooked;
/** 未知 */
@property(nonatomic,assign)NSUInteger N_dishes;
/** 分数 */
@property(nonatomic,copy)NSString *score;
/** 食谱id */
@property(nonatomic,assign)NSUInteger recipe_id;
/** 描述 */
@property(nonatomic,copy)NSString *desc;
@end
