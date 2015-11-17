#import "DrawingView.h"

@implementation DrawingView

- (void)drawRect:(CGRect)rect
{
    if (self.drawingModel == nil)
    {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    [self drawAllCurvesOnContext:context];
    
    CGContextRestoreGState(context);
}

- (void)drawAllCurvesOnContext:(CGContextRef)context
{
    for (Curve* curve in self.drawingModel.curves)
    {
        CGContextBeginPath(context);
        
        NSArray* curvePoints = [curve curveRawPoints];
        BOOL isFirstPoint = YES;
        
        for (NSValue* pointAsValue in curvePoints)
        {
            CGPoint point = [pointAsValue CGPointValue];
            
            if (isFirstPoint)
            {
                CGContextMoveToPoint(context, point.x, point.y);
                isFirstPoint = NO;
            }
            else
            {
                CGContextAddLineToPoint(context, point.x, point.y);
            }
        }
        
        CGContextStrokePath(context);
    }
}

@end
