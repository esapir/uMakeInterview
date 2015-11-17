#pragma once

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

CGFloat CGPointsDistance(CGPoint p1, CGPoint p2);

CGPoint CGPointMul(CGPoint p, CGFloat v);

CGPoint CGPointsAdd(CGPoint p1, CGPoint p2);

//Returns a representation of the vector from p1 to p2
CGPoint CGPointMakeVec(CGPoint p1, CGPoint p2);