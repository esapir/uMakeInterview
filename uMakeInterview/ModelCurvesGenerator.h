#import <UIKit/UIKit.h>
#import "DrawingModel.h"

@interface ModelCurvesGenerator : UIView

- (instancetype)initWithDrawingModel:(DrawingModel*)drawingModel dimensions:(CGSize) dimensions;

//Generates new curve with random coordinates and with random type (Polyline/Bezier) and add new curve to model
- (Curve*)generateRandomCurve;

//Generates new curve automatically every X seconds
- (void)autoGenerateNewRandomCurvesWitTimehInterval:(NSTimeInterval)timeInterval;

@end
