//
//  ViewController.m
//  SBRF-UIKitLession
//
//  Created by Артём Балашов on 16/03/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "LCTCustomView.h"

@interface ViewController ()

@property (nonatomic, strong) LCTCustomView *movedView;
@property (nonatomic, assign) BOOL possibleMoveView;
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
    [self configureButtons];
    [self configureViews];
}

- (void)configureButtons
{
    UIButton *button = [UIButton new];
    [button setTitle:@"Next VC" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.backgroundColor = UIColor.darkGrayColor;
    button.layer.cornerRadius = 16;
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    CGFloat width = 200;
    CGFloat height = 80;
    button.frame = CGRectMake((self.view.frame.size.width - width) / 2, (self.view.frame.size.height - height) / 2.5, width, height);
    [button addTarget:self action:@selector(didSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *viewDidLoadButton = [UIButton new];
    [viewDidLoadButton setTitle:@"Reload View" forState:UIControlStateNormal];
    [self.view addSubview:viewDidLoadButton];
    viewDidLoadButton.backgroundColor = UIColor.darkGrayColor;
    viewDidLoadButton.layer.cornerRadius = 16;
    [viewDidLoadButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    CGFloat viewDidLoadWidth = 200;
    CGFloat viewDidLoadHeight = 80;
    viewDidLoadButton.frame = CGRectMake((self.view.frame.size.width - viewDidLoadWidth) / 2, (self.view.frame.size.height - viewDidLoadHeight) / 1.5, viewDidLoadWidth, viewDidLoadHeight);
    [viewDidLoadButton addTarget:self action:@selector(didSelectRepeatViewDidLoadButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureViews
{
    self.movedView = [LCTCustomView new];
    CGFloat width = self.view.frame.size.width / 2;
    CGFloat height = self.view.frame.size.height / 2;
    self.movedView.frame = CGRectMake(0, 0, width, height);
    self.movedView.center = self.view.center;
    self.movedView.backgroundColor = UIColor.redColor;
    self.movedView.alpha = 0.7;
//    self.movedView.userInteractionEnabled = NO;
    [self.view addSubview:self.movedView];
}

//MARK: - Actions

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
    [self.navigationController.view insertSubview:self.view belowSubview:self.navigationController.navigationBar];
//    [[UIApplication sharedApplication].delegate.window addSubview:self.view];
}

// MARK: - View moved
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", touches);
    if ([self isTouch:[touches anyObject] inView:self.movedView]) {
        self.possibleMoveView = YES;
    } else {
        self.possibleMoveView = NO;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", touches);
    if (self.possibleMoveView) {
        self.movedView.frame = [self getNewRectFromTouch: [touches anyObject] forView:self.movedView];
    }
    self.view.backgroundColor = [self colorFromTouch:[touches anyObject]];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"%@", touches);
    if ([self isTouch:[touches anyObject] inView:self.movedView]) {
        self.movedView.frame = [self getNewRectFromTouch: [touches anyObject] forView:self.movedView];
    }

}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@", touches);
//    self.movedView.frame = [self getNewRectFromTouch: [touches anyObject] forView:self.movedView];

}

- (void)dealloc
{
    NSLog(@"self deallocated");
}

- (CGRect)getNewRectFromTouch:(UITouch *)touch forView:(UIView *)view {
    if (![self isTouch:touch inView:view]) {
        return view.frame;
    }
    
    CGPoint point = [touch locationInView:self.view];
    CGPoint prevPoint = [touch previousLocationInView:self.view];
    CGFloat diffY = point.y - prevPoint.y;
    CGFloat diffX = point.x - prevPoint.x;
    
    CGFloat newX = view.frame.origin.x + diffX;
    if (newX + view.frame.size.width > self.view.frame.size.width || newX < 0) {
        newX = view.frame.origin.x;
    }
    CGFloat newY = view.frame.origin.y + diffY;
    if (newY + view.frame.size.height > self.view.frame.size.height || newY < 0) {
        newY = view.frame.origin.y;
    }
    
    
    return CGRectMake(newX, newY, view.frame.size.width, CGRectGetHeight(view.frame));
}

- (UIColor *)colorFromTouch:(UITouch *)touch {
    CGFloat pointX = [touch locationInView:self.view].x;
    CGFloat progress = pointX / self.view.frame.size.width;
    return [self colorFromProgress:progress];
}

- (BOOL) isTouch:(UITouch *)touch inView: (UIView *) view {
    CGPoint pointInView = [touch locationInView:view];
    if (pointInView.x < 0 || pointInView.y < 0 || pointInView.x > CGRectGetMaxX(view.frame) || pointInView.y > CGRectGetMaxY(view.frame)) {
        return NO;
    } else {
        return YES;
    }
}

- (UIColor *)colorFromProgress:(CGFloat) progress {
    return [UIColor colorWithRed:progress green:progress blue:progress alpha:1];
}

@end
