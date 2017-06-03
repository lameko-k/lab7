//
//  ViewController.m
//  lab7_11
//
//  Created by robert on 4/24/17.
//  Copyright (c) 2017 di. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *canvas;
@property (weak, nonatomic) IBOutlet UISegmentedControl *setColor;
@property (weak, nonatomic) IBOutlet UISegmentedControl *setWidth;

@property CGPoint lastPoint;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)savePicture:(id)sender {
    NSString *filename = @"picture.png";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * filepath = [[paths objectAtIndex:0] stringByAppendingPathComponent:filename];
    NSLog(@"%@",filepath);
    [UIImagePNGRepresentation(_canvas.image)writeToFile:filepath atomically:YES];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    [self setLastPoint:[touch locationInView:self.canvas]];
}
- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.canvas];
    UIGraphicsBeginImageContext(self.canvas.frame.size);
    CGRect drawRect = CGRectMake(0.0f, 0.0f, self.canvas.frame.size.width, self.canvas.frame.size.height);
    [[[self canvas] image] drawInRect:drawRect]; CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    switch(_setWidth.selectedSegmentIndex)
    {
        case 0:
        {
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0f);
            break;
        }
        case 1:
        {
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 3.0f);
            break;
        }
        case 2:
        {
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 4.0f);
            break;
        }
        case 3:
        {
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0f);
            break;
        }
        case 4:
        {
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 6.0f);
            break;
        }
        default:
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0f);
    
    }
    switch(_setColor.selectedSegmentIndex)
    {
        case 0:
        {
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0f, 0.0f, 0.0f, 1.0f);
            break;
        }
        case 1:
        {
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0f, 1.0f, 0.0f, 1.0f);
            break;
        }
        case 2:
        {
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0f, 0.0f, 1.0f, 1.0f);
            break;
        }
        default:
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0f, 1.0f, 1.0f, 1.0f);
        
    }
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _lastPoint.x,_lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
   
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    [[self canvas] setImage:UIGraphicsGetImageFromCurrentImageContext()]; UIGraphicsEndImageContext();
    _lastPoint = currentPoint;
}


@end
