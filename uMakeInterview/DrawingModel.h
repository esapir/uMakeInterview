#import <UIKit/UIKit.h>
#import "Curve.h"

@interface DrawingModel : UIView

@property (strong, nonatomic, readonly) NSMutableArray<Curve*>* curves;

- (void)addCurve:(Curve*)curve;

@end
