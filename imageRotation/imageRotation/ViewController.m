//
//  ViewController.m
//  imageRotation
//
//  Created by Apple on 26/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "ViewController.h"
#import "NewViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *customView;
@property (strong, nonatomic) CAShapeLayer *maskLayer;
@property (strong, nonatomic) UIView *imageHolderView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSString *imageName;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.customView = [[UIView alloc] initWithFrame:CGRectMake(10, 259, 100, 30)];
   // self.maskLayer = [CAShapeLayer layer];
   // self.maskLayer.path = [UIBezierPath bezierPathWithRoundedRect: self.customView.layer.bounds byRoundingCorners: UIRectCornerBottomRight | UIRectCornerTopRight cornerRadii: (CGSize){20.0, 20.0}].CGPath;
    //self.customView.layer.mask = self.maskLayer;
    self.customView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.customView];
    
    self.viewExpanded = NO;
    
    // for image view's
    self.imageHolderView = [[UIView alloc]initWithFrame:CGRectMake(11, 20, 290, 225)];
    self.imageHolderView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.imageHolderView];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(04, 13, 280, 200)];
    self.imageView.image = [UIImage imageNamed:@"1.jpg"];
    self.imageName = @"1.jpg";
    self.imageView.backgroundColor = [UIColor clearColor];
    [self.imageHolderView addSubview:self.imageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.imageHolderView setFrame:CGRectMake(11, 20, 290, 225)];
    [self.imageView setFrame:CGRectMake(04, 13, 280, 200)];
    [self reloadInputViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rotate:(id)sender
{
    if (self.imageView.image == [UIImage imageNamed:@"1.jpg"])
    {
        [UIView transitionWithView:self.imageView duration:1.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               self.imageView.image = [UIImage imageNamed:@"2.jpg"];
                               self.imageName = @"2.jpg";
                           } completion:nil];
    }
    else
    {
        [UIView transitionWithView:self.imageView duration:1.5
                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                               self.imageView.image = [UIImage imageNamed:@"1.jpg"];
                               self.imageName = @"1.jpg";
                           } completion:nil];
    }
}

- (IBAction)expandView:(id)sender
{
    [UIView animateWithDuration:0.8f delay:0.0f options:UIViewAnimationOptionTransitionNone animations: ^{
        if (!self.viewExpanded)
        {
            self.viewExpanded = YES;
            self.customView.frame = CGRectMake(10, 259, 200, 30);
            self.customView.backgroundColor = [UIColor redColor];
        }
        else
        {
            self.viewExpanded = NO;
            self.customView.frame = CGRectMake(10, 259, 100, 30);
            self.customView.backgroundColor = [UIColor yellowColor];
        }
    } completion:nil];
}

- (IBAction)zoom:(id)sender
{
    [UIView animateWithDuration:1 animations:^(void) {
        self.zoomView.transform = CGAffineTransformScale(self.zoomView.transform, 2.0, 2.0);
    }];
}

- (IBAction)zoomOut:(id)sender
{
    [UIView animateWithDuration:1 animations:^(void) {
         self.zoomView.transform = CGAffineTransformScale(self.zoomView.transform, 0.5, 0.5);
     }];
}

- (IBAction)nextPage:(id)sender
{
    [UIView animateWithDuration:0.0 animations:^(void) {
        [UIView beginAnimations:@"animationOff" context:NULL];
        [UIView setAnimationDuration:1.3f];
        [self.imageHolderView setFrame:CGRectMake(11, 20, 285, 400)];
        [self.imageView setFrame:CGRectMake(04, 13, 280, 350)];
        [UIView commitAnimations];
    }];
    [self performSelector:@selector(presentNextView) withObject:nil afterDelay:1.4];

}

- (void)presentNextView
{
    
    NSString * storyboardName = @"Main";
    NSString * viewControllerID = @"NewViewController";
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    NewViewController * controller = (NewViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
    controller.imageNameString = self.imageName;
    [self presentViewController:controller animated:NO completion:NULL];
}

@end
