//
//  LCTCustomView.m
//  SBRF-UIKitLession
//
//  Created by Артём Балашов on 16/03/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

#import "LCTCustomView.h"

@implementation LCTCustomView
//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%@", touches);
//    self.frame = [self getNewRectFromTouch:[touches anyObject]];
//
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesMoved:touches withEvent:event];
//    self.frame = [self getNewRectFromTouch:[touches anyObject]];
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%@", touches);
//    self.frame = [self getNewRectFromTouch:[touches anyObject]];
//
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%@", touches);
//}
//
//- (CGRect)getNewRectFromTouch:(UITouch *)touch {
//    CGPoint point = [touch locationInView:self];
//    CGPoint prevPoint = [touch previousLocationInView:self];
//    CGFloat diffY = point.y - prevPoint.y;
//    CGFloat diffX = point.x - prevPoint.x;
//    return CGRectMake(self.frame.origin.x + diffX, self.frame.origin.y + diffY, self.frame.size.width, CGRectGetHeight(self.frame));
//}

@end
