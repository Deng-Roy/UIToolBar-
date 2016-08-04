//
//  ViewController.h
//  UIToolBar使用
//
//  Created by 劳一 on 16/8/1.
//  Copyright © 2016年 劳一. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)add:(UIBarButtonItem *)sender;
- (IBAction)remove:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trash;

@end

