#import <Foundation/Foundation.h>
#import "MathUtils.h"

CGFloat CGPointsDistance(CGPoint p1, CGPoint p2)
{
    CGFloat xDist = (p2.x - p1.x);
    CGFloat yDist = (p2.y - p1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

CGPoint CGPointMul(CGPoint p, CGFloat v)
{
    return CGPointMake(p.x * v, p.y * v);
}

CGPoint CGPointsAdd(CGPoint p1, CGPoint p2)
{
    return CGPointMake(p1.x + p2.x, p1.y + p2.y);
}

//Returns a representation of the vector from p1 to p2
CGPoint CGPointMakeVec(CGPoint p1, CGPoint p2)
{
    return CGPointMake(p2.x - p1.x, p2.y - p1.y);
}