//
//  ViewController.m
//  KOProgressHUDManager
//
//  Created by Korune on 2018/8/28.
//  Copyright © 2018年 Korune. All rights reserved.
//

#import "ViewController.h"
#import "KOProgressHUDManager.h"

@interface ViewController ()

- (IBAction)showSuccess:(id)sender;
- (IBAction)showError:(id)sender;
- (IBAction)showLoading:(id)sender;
- (IBAction)hideHUD:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"KOProgressHUDManager 演示";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (IBAction)showSuccess:(id)sender {
    [KOProgressHUDManager showSuccess:@"小伙子，你成功了！"];
}

- (IBAction)showError:(id)sender {
    [KOProgressHUDManager showError:@"小伙子，暂时失败了，不要灰心!" duration:2];
}

- (IBAction)showLoading:(id)sender {
    [KOProgressHUDManager showLoading:@"小伙子，等等……" onView:self.view];
}

- (IBAction)hideHUD:(id)sender {
    [KOProgressHUDManager hideHUDForView:self.view];
}



@end
