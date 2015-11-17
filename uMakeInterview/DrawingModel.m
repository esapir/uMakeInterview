#import "DrawingModel.h"
#import "Curve.h"

@interface DrawingModel()

@property (strong, nonatomic) NSMutableArray<Curve*>* curves;

@end

@implementation DrawingModel

- (instancetype)init
{
    if (self = [super init])
    {
    }
    
    return self;
}

- (NSMutableArray<Curve*>*)curves
{
    if (!_curves)
    {
        _curves = [NSMutableArray<Curve*> new ];
    }
    
    return _curves;
}

- (void)addCurve:(Curve*)curve
{
    [self.curves addObject:curve];
}

@end
