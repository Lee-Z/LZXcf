//
//  LZMenuViewController.m
//  LZxcf
//
//  Created by win on 16/5/9.
//  Copyright © 2016年 win. All rights reserved.
//

#import "LZMenuViewController.h"
#import "MBProgressHUD+Add.h"
#import "LZCreatMenuTableViewController.h"

@interface LZMenuViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TextField;

@end

@implementation LZMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self TextSetup];

}

-(void)returnTB:(ReturnTB)block
{
    self.returnTB=block;
}


//textfield nav 设置
-(void)TextSetup
{
    //使键盘是第一响应者
    [self.TextField becomeFirstResponder];
    self.navigationItem.title=@"菜谱名称";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStyleDone target:self action:@selector(NextStep)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    [_TextField addTarget:self action:@selector(test:) forControlEvents:UIControlEventEditingChanged];
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES ];
}
-(void)NextStep
{
    if (self.TextField.text.length)
    {
        LZCreatMenuTableViewController *CreatMenu=[[LZCreatMenuTableViewController alloc]init];
        
        
        
        [CreatMenu setNametext:self.TextField.text];
        if (self.returnTB !=nil) {
            self.returnTB(self.TextField.text);}
        
        [self.navigationController pushViewController:CreatMenu animated:YES];
    }
    else{
//        self.view.backgroundColor=[UIColor redColor];
        [MBProgressHUD show:@"请输入菜谱名称" icon:nil view:self.view];
    }
    
}

-(void)test:(UITextField *)TextField
{
    NSLog(@"%ld",self.TextField.text.length);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_TextField resignFirstResponder];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
