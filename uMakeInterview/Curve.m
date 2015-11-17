#import "Curve.h"
#import "NSString+Random.h"
#import "MathUtils.h"

@implementation Curve

- (instancetype)initWithPoints:(CurvePoints*)points type:(CurveType)type
{
    if (self = [super init])
    {
        self.points = points;
        self.type = type;
        self.id = [NSString generateRandomString];
        
    }
    
    return self;
}

- (CGFloat)curveLength
{
    CGFloat length = 0;
    
    NSArray<NSValue*>* rawPoints = self.curveRawPoints;
    
    for (int i = 0; i < rawPoints.count - 1; i++)
    {
        CGPoint currPoint = [rawPoints objectAtIndex:i].CGPointValue;
        CGPoint nextPoint = [rawPoints objectAtIndex:i + 1].CGPointValue;
        
        length += CGPointsDistance(currPoint, nextPoint);
    }
    
    return length;
}

- (NSArray*)curveRawPoints
{
    if (self.type == CurveTypePolyline)
    {
        return self.points;
    }
    else if (self.type == CurveTypeBezier)
    {
        return [self calculateBezierCurvePoints];
    }
    else
    {
        return nil;
    }
}

- (NSArray*)calculateBezierCurvePoints
{
    //Assuming bezier curve has exactly 4 control points
    CGPoint firstPoint = [self.points objectAtIndex:0].CGPointValue;
    CGPoint secondPoint = [[self.points objectAtIndex:1] CGPointValue];
    CGPoint thirdPoint = [[self.points objectAtIndex:2] CGPointValue];
    CGPoint fourthPoint = [[self.points objectAtIndex:3] CGPointValue];
    
    const double NUM_POINTS = 100;
    double t = 0;
    double tDelta = 1 / (NUM_POINTS - 1);
    
    NSMutableArray* rawPoints = [NSMutableArray new];
    
    for (int i = 0; i < NUM_POINTS; i++)
    {
        double x = firstPoint.x * pow(1 - t, 3) + secondPoint.x * (3 * t * pow (1 - t, 2)) + thirdPoint.x * (3 * (1 - t) * pow(t, 2)) + fourthPoint.x * pow(t, 3);
        
        double y = firstPoint.y * pow(1 - t, 3) + secondPoint.y * (3 * t * pow (1 - t, 2)) + thirdPoint.y * (3 * (1 - t) * pow(t, 2)) + fourthPoint.y * pow(t, 3);
        
        [rawPoints addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
        
        t += tDelta;
    }
    
    return rawPoints;
}

@end
