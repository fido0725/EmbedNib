//
//  EmbedView.m
//  EmbedNib
//
//  Created by chenfeng on 15/7/29.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

#import "EmbedView.h"

@implementation EmbedView

-(id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    if (self.subviews.count==0) {
        
        EmbedView *other = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
        other.frame = self.frame;
        //other.autoresizingMask = self.autoresizingMask;
        [other setTranslatesAutoresizingMaskIntoConstraints:NO];

        self = other;
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = [[UIColor greenColor] CGColor];
    self.layer.borderWidth = 0.5;
    for (UIButton *btn in _btns) {
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = [[UIColor grayColor] CGColor];
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)initialize
{
    if (self == [self class]) {
        
    }
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (IBAction)clickAction:(id)sender {
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
