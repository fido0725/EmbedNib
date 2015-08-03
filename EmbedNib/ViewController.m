//
//  ViewController.m
//  EmbedNib
//
//  Created by chenfeng on 15/7/29.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
