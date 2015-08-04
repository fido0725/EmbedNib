//
//  EmbedView.m
//  EmbedNib
//
//  Created by chenfeng on 15/7/29.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

#define UseCategory

#import "EmbedView.h"

#ifdef UseCategory
#import "UIView+ReuseNibLoading.h"
#endif

@interface EmbedView()

@property (nonatomic,strong) IBOutletCollection(UIButton) NSArray *btns;

@end

@implementation EmbedView

///需要替换self为另外一个对象
-(id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    
#ifndef UseCategory
    ///判断是否占位视图，防止死循环
    if (self.subviews.count==0) {
        
        EmbedView *other;
        ///在此以tag切换top_level object
        if (self.tag>0) {
            other = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][1];
        }
        else
        {
            other = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil][0];
        }
        ///占位视图可视化参数转移
        other.frame = self.frame;
        other.autoresizingMask = self.autoresizingMask;
        other.backgroundColor = self.backgroundColor;
        other.opaque = self.opaque;
        other.hidden = self.hidden;
        other.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints;
        
        ///如果存在约束，则转移到other上
        if (!other.translatesAutoresizingMaskIntoConstraints) {
            for (NSLayoutConstraint *constraint in self.constraints) {
            id firstItem = constraint.firstItem == self ? other: constraint.firstItem;
            id secondItem = constraint.secondItem == self ? other: constraint.secondItem;
          [other addConstraint:  [NSLayoutConstraint constraintWithItem:firstItem attribute:constraint.firstAttribute relatedBy:constraint.relation toItem:secondItem attribute:constraint.secondAttribute multiplier:constraint.multiplier constant:constraint.constant]];
        }
        }

        self = other;
    }
#else
    self = [self loadReuseViewWithOwner:NO tag:self.tag];
#endif
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    for (UIButton *btn in _btns) {
        btn.layer.borderWidth = 0.5;
        btn.layer.borderColor = [[UIColor grayColor] CGColor];
    }
}

///load nib首先发送此消息
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {

    }
    return self;
}

- (IBAction)clickAction:(UIButton*)sender {

    NSLog(@"click here tag is %d",sender.tag);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
