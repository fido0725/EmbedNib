//
//  ViewController.m
//  EmbedNib
//
//  Created by chenfeng on 15/7/29.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

#import "ViewController.h"
#import "EmbedView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet EmbedView *embedview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    EmbedView *embedview1 = [[[NSBundle mainBundle] loadNibNamed:@"EmbedView" owner:nil options:nil] objectAtIndex:0];
    embedview1.backgroundColor = [UIColor yellowColor];
    [embedview1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:embedview1];
    
    EmbedView *embedview2 = [[[NSBundle mainBundle] loadNibNamed:@"EmbedView" owner:nil options:nil] objectAtIndex:0];
    embedview2.backgroundColor = [UIColor greenColor];
    [embedview2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:embedview2];
    
    NSDictionary *dicts = NSDictionaryOfVariableBindings(embedview1,embedview2,self.view);
    NSDictionary *dicts1 = NSDictionaryOfVariableBindings(embedview1,self.view);
    NSDictionary *dicts2 = NSDictionaryOfVariableBindings(embedview2,self.view);

    NSArray *constrainst = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[embedview1(50)]-(10)-|" options:0 metrics:nil views:dicts1];
    [self.view addConstraints:constrainst];
    
    constrainst = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[embedview2(50)]-(10)-|" options:0 metrics:nil views:dicts2];
    [self.view addConstraints:constrainst];
    
    constrainst = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(10)-[embedview2(>=0)]-[embedview1(==embedview2)]-(10)-|" options:NSLayoutFormatAlignAllBottom metrics:nil views:dicts];
    [self.view addConstraints:constrainst];
    
    NSLog(@"%@",self.view.constraints);
    NSLog(@"embedview is %@",_embedview);
}

-(id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    return self;
}

-(void)awakeFromNib
{
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
