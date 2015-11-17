#import "UMakeInterviewViewController.h"
#import "DrawingView.h"
#import "ModelCurvesGenerator.h"
#import "MathUtils.h"

@interface UMakeInterviewViewController ()

@property (weak, nonatomic) IBOutlet DrawingView *drawingView;

@property (strong, nonatomic) DrawingModel* drawingModel;
@property (strong, nonatomic) ModelCurvesGenerator* modelCurvesGenerator;
@property (strong, nonatomic) NSMutableDictionary* curvesKnobsByCurveId;

@end

@implementation UMakeInterviewViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.drawingModel = [DrawingModel new];
    self.modelCurvesGenerator = [[ModelCurvesGenerator alloc] initWithDrawingModel:self.drawingModel
                                                                        dimensions:self.drawingView.frame.size];
    
    self.curvesKnobsByCurveId = [NSMutableDictionary new];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.drawingView.drawingModel = self.drawingModel;
    
//    [self.modelCurvesGenerator autoGenerateNewRandomCurvesWitTimehInterval:10];
}

#pragma mark - generate random curve

- (IBAction)addCurveButtonClicked:(id)sender
{
    NSLog(@"Add Clicked");
    
    [self addRandomCurveToModel];
    
    [self.drawingView setNeedsDisplay];
}

- (void)addRandomCurveToModel
{
    Curve*  newCurve = [self.modelCurvesGenerator generateRandomCurve];
    [self addKnobForCurve:newCurve];
}

#pragma mark - image knob presenter for curve

- (void)addKnobForCurve:(Curve*)curve
{
    UIImageView* curveKnobImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Icon_Tick_RedPoint"]];

    curveKnobImageView.center = [self imageKnobPointForCurve:curve];
    
    [self.view addSubview:curveKnobImageView];
    
    [self.curvesKnobsByCurveId setObject:curveKnobImageView forKey:curve.id];
}

- (CGPoint)imageKnobPointForCurve:(Curve*)curve
{    
    return curve.points.firstObject.CGPointValue;
}

#pragma mark - delete curve

- (IBAction)deleteCurveButtonClicked:(id)sender
{
    NSLog(@"Delete Clicked");
    
    if (self.drawingModel.curves.count == 0)
    {
        return;
    }
    
    int curveIndexToDelete = arc4random() % self.drawingModel.curves.count;
    [self removeCurve:[self.drawingModel.curves objectAtIndex:curveIndexToDelete]];
}

- (void)removeCurve:(Curve*)curve
{
    
}

#pragma mark - undo/redo

- (IBAction)undoButtonClicked:(id)sender
{
    NSLog(@"Undo Clicked");
}

- (IBAction)redoButtonClicked:(id)sender
{
    NSLog(@"Redo Clicked");
}


@end
