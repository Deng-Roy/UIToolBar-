//
//  ViewController.m
//  UIToolBar使用
//
//  Created by 劳一 on 16/8/1.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import "ViewController.h"
#define Ktag 3

@interface ViewController ()
{
    NSArray *_texticon ;
}
@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    _texticon = @[@"Roy",@"Woy",@"Soy",@"Joy",@"Foy",@"Doy",@"Coy"];
}

- (IBAction)add:(UIBarButtonItem *)sender {
      UIView *last = [self.view.subviews lastObject];
   // NSLog(@"%@",last.description);
    CGFloat Y = last.frame.origin.y + last.frame.size.height +1;
   // NSLog(@"%.f",Y);
    
    UIView *view = [self rowView];
    
    [self.view addSubview:view];
    
    _trash.enabled = YES;
    view.frame = CGRectMake(320, Y, 320, 33);
        view.alpha = 0;
    [UIView animateWithDuration:1.3 animations:^{
        
        view.frame = CGRectMake(0 , Y, 320, 33);
        view.alpha=1;
    }];
    NSLog(@"%lu",self.view.subviews.count);

}
-(UIView *)rowView{
    UIView *view =[[UIView alloc]init];
    view.backgroundColor = [UIColor cyanColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    int imageIndex = arc4random_uniform(7)+1;
    NSString *image =[NSString stringWithFormat:@"%d",imageIndex];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    btn.frame = CGRectMake(13, 0, 33, 33);
    [btn addTarget:self action:@selector(Textclick:) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:btn];
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 320, 33)];
    name.backgroundColor = [UIColor clearColor];
    name.textAlignment =NSTextAlignmentCenter;
    name.tag = Ktag ;
    
    int TextIndex = arc4random_uniform((int)_texticon.count);
    name.text = _texticon[TextIndex];
    
    
    [view addSubview:name];
    
    //单行删除
    
    UIButton *del = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    del.frame = CGRectMake(277, 3, 33, 33);
    [del setTitle:@"删除" forState:UIControlStateNormal];
    [del addTarget:self action:@selector(deletclick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [view addSubview:del];
    
    return view;
    
}

-(void)deletclick : (UIButton *)delet{
    [UIView animateWithDuration:0.73 animations:^{
        CGRect F = delet.superview.frame;
        F.origin.x = 320;
        delet.superview.frame =F;
    } completion:^(BOOL finished) {
        int starIndex = (int)[self.view.subviews indexOfObject:delet.superview];
            [delet.superview removeFromSuperview];
        [UIView animateWithDuration:0.33 animations:^{
            for (int i=starIndex; i<self.view.subviews.count; i++) {
                UIView *v = self.view.subviews[i];
                CGRect f = v.frame;
                f.origin.y -= 34;
                v.frame = f;
            }
            }];

         _trash.enabled = self.view.subviews.count > 1;
    }];


}
-(void) Textclick :(UIButton *)bt {
    
  UILabel *label = [bt.superview viewWithTag:Ktag];
    
    NSLog(@"your name is %@",label.text);
    
}

- (IBAction)remove:(UIBarButtonItem *)sender {
    
    UIView *last = [self.view.subviews lastObject];
    [UIView animateWithDuration:0.7 animations:^{
       
       CGRect F = last.frame;
        F.origin.x = 320;
        last.frame = F;
        last.alpha =0;
    } completion:^(BOOL finished) {
        [last removeFromSuperview];
        _trash.enabled = self.view.subviews.count > 1;
    }];
    

}
@end
