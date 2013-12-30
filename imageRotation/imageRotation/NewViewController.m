//
//  NewViewController.m
//  imageRotation
//
//  Created by Apple on 30/12/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (strong, nonatomic) UIView *imageHolderView;
@property (strong, nonatomic) UIImageView *imageView;

@end

@implementation NewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.imageHolderView = [[UIView alloc]initWithFrame:CGRectMake(11, 20, 290, 400)];
    self.imageHolderView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.imageHolderView];
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(04, 13, 280, 350)];
    self.imageView.image = [UIImage imageNamed:[NSString stringWithString:self.imageNameString]];
    self.imageView.backgroundColor = [UIColor clearColor];
    [self.imageHolderView addSubview:self.imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender
{
    [UIView animateWithDuration:0.0 animations:^(void) {
        [UIView beginAnimations:@"animationOff" context:NULL];
        [UIView setAnimationDuration:1.3f];
        [self.imageHolderView setFrame:CGRectMake(11, 20, 290, 225)];
        [self.imageView setFrame:CGRectMake(04, 13, 280, 200)];
        [UIView commitAnimations];
    }];
    [self performSelector:@selector(goBack) withObject:nil afterDelay:1.5];
}

- (void)goBack
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
