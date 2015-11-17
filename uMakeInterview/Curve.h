#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CurveType) {
    CurveTypePolyline = 0,
    CurveTypeBezier = 1
};

@interface Curve : NSObject

typedef NSArray<NSValue*> CurvePoints;

- (instancetype)initWithPoints:(CurvePoints*)points type:(CurveType)type;

- (NSArray*)curveRawPoints;

@property (strong, nonatomic) CurvePoints* points;
@property (nonatomic) CurveType type;
@property (nonatomic) NSString* id;

@end
