#import <Foundation/Foundation.h>
#import "ModelCurvesGenerator.h"

@interface ModelCurvesGenerator()

@property (strong, nonatomic) DrawingModel* drawingModel;
@property (nonatomic) CGSize dimensions;

@property (nonatomic) NSTimer* generateCurvesTimer;

@end

@implementation ModelCurvesGenerator

- (instancetype)initWithDrawingModel:(DrawingModel*)drawingModel dimensions:(CGSize) dimensions
{
    if (self = [super init])
    {
        self.drawingModel = drawingModel;
        self.dimensions = dimensions;
    }
    
    return self;
}

- (Curve*)generateRandomCurve
{
    NSArray* randomPoints = [self generateRandomCurvePoints];
    CurveType curveType = (CurveType)arc4random() % 2;
    
    Curve* newCurve = [[Curve alloc] initWithPoints:randomPoints type:curveType];
    
    [self.drawingModel addCurve:newCurve];
    
    NSLog(@"New curve generated and added to model");
    
    return newCurve;
}

- (NSArray*)generateRandomCurvePoints
{
    CGPoint firstPoint = [self generateRandomPointBetweenMinX:50
                                                         minY:50
                                                         maxX:self.dimensions.width - 50
                                                         maxY:self.dimensions.height - 50];
    
    NSMutableArray* curvePoints = [NSMutableArray new];
    [curvePoints addObject:[NSValue valueWithCGPoint:firstPoint]];
    
    for (int i = 0; i < 3; i++)
    {
        CGPoint nextPoint = [self generateRandomPointBetweenMinX:firstPoint.x - 50
                                                            minY:firstPoint.y - 50
                                                            maxX:firstPoint.x + 50
                                                            maxY:firstPoint.y + 50];
        
        [curvePoints addObject:[NSValue valueWithCGPoint:nextPoint]];
    }
    
    return curvePoints;
}

- (CGPoint)generateRandomPointBetweenMinX:(int)minX minY:(int)minY maxX:(int)maxX maxY:(int)maxY
{
    int x = minX + arc4random() % (maxX - minX);
    int y = minY + arc4random() % (maxY - minY);
    
    return CGPointMake(x, y);
}

- (void)autoGenerateNewRandomCurvesWitTimehInterval:(NSTimeInterval)timeInterval
{
    if (self.generateCurvesTimer != nil)
    {
        [self.generateCurvesTimer invalidate];
    }
    
    self.generateCurvesTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                                target:self
                                                              selector:@selector(autoGenerateCurveTimerFired:)
                                                              userInfo:nil
                                                               repeats:YES];
}

- (void)autoGenerateCurveTimerFired:(NSTimer*)timer
{
    NSLog(@"Timer fired: new curve will be generated");
    
    [self generateRandomCurve];
}

@end