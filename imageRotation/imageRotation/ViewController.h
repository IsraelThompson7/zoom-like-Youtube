//
//  ViewController.h
//  imageRotation
//
//  Created by Apple on 26/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)rotate:(id)sender;
- (IBAction)expandView:(id)sender;
@property BOOL viewExpanded;
@property (strong, nonatomic) IBOutlet UIView *zoomView;
- (IBAction)zoom:(id)sender;
- (IBAction)zoomOut:(id)sender;
- (IBAction)nextPage:(id)sender;

@end
