#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CurveType) {
    CurveTypePolyline = 0,
    CurveTypeBezier = 1
};

@interface Curve : NSObject

typedef NSArray<NSValue*> CurvePoints;

@property (nonatomic) CurveType type;

//points that represents the curve
@property (strong, nonatomic) CurvePoints* points;

//unique id of the curve
@property (nonatomic) NSString* id;

- (instancetype)initWithPoints:(CurvePoints*)points type:(CurveType)type;

- (CGFloat)curveLength;
- (NSArray*)curveRawPoints;

@end
