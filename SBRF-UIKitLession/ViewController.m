//
//  ViewController.m
//  SBRF-UIKitLession
//
//  Created by Артём Балашов on 16/03/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    NSLog(@"called loadView");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self prepareUI];
    NSLog(@"View Did Load");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    NSLog(@"view will dissapear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"view did disappear");
}


//MARK: - UI Configuration

- (void)prepareUI
{
    UIButton *button = [UIButton new];
    [button setTitle:@"Next VC" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.backgroundColor = UIColor.darkGrayColor;
    button.layer.cornerRadius = 16;
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    CGFloat width = 200;
    CGFloat height = 80;
    button.frame = CGRectMake((self.view.frame.size.width - width) / 2, (self.view.frame.size.height - height) / 2, width, height);
    [button addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *viewDidLoadButton = [UIButton new];
    [viewDidLoadButton setTitle:@"Next VC" forState:UIControlStateNormal];
    [self.view addSubview:viewDidLoadButton];
    viewDidLoadButton.backgroundColor = UIColor.darkGrayColor;
    viewDidLoadButton.layer.cornerRadius = 16;
    [viewDidLoadButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    CGFloat viewDidLoadWidth = 200;
    CGFloat viewDidLoadHeight = 80;
    viewDidLoadButton.frame = CGRectMake((self.view.frame.size.width - viewDidLoadWidth) / 2, (self.view.frame.size.height - viewDidLoadHeight) / 1.5, viewDidLoadWidth, viewDidLoadHeight);
    [viewDidLoadButton addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *someView = [UIView new];
    someView.frame = self.view.frame;
    someView.userInteractionEnabled = NO;
    [self.view addSubview:someView];
}

- (void)didSelectButton:(UIButton *)sender
{
    UIViewController *secondVC = [ViewController new];
    secondVC.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)didSelectRepeatViewDidLoadButton:(UIButton *)sender
{
    self.view = nil;
    self.view.backgroundColor = UIColor.whiteColor;
}

@end
