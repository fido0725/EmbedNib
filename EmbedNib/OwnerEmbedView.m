//
//  OwnerEmbedView.m
//  EmbedNib
//
//  Created by ptx on 15/8/1.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

//#define UseCategory

#import "OwnerEmbedView.h"

#ifdef UseCategory
#import "UIView+ReuseNibLoading.h"
#endif

@interface OwnerEmbedView()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property (weak, nonatomic) IBOutlet UISwitch *switcher;

@end

@implementation OwnerEmbedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

///nib加载完成后行为
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.layer.borderWidth = 0.5;
}

///iOS加载首先收到消息
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
#ifndef UseCategory
        ///判断是否是占位视图
        if (self.subviews.count == 0)
        {
            ///手动加载复用视图
            UIView *_contentView = [[NSBundle mainBundle]loadNibNamed:@"OwnerEmbedView" owner:self options:nil][0];
            [self addSubview:_contentView];
            
            ///判断是否采用约束布局
            if (self.translatesAutoresizingMaskIntoConstraints) {
                ///填充
                _contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            }
            else
            {
                ///VFL约束布局填充
                NSDictionary *dict = NSDictionaryOfVariableBindings(self,_contentView);
                NSArray *arr = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(0)-[_contentView]-(0)-|" options:0 metrics:nil views:dict];
                [self addConstraints:arr];

                arr= [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(0)-[_contentView]-(0)-|" options:0 metrics:nil views:dict];
                [self addConstraints:arr];
            }
        }
#else
    
        self = [self loadReuseViewWithOwner:YES];
#endif
    }
    return self;
}

@end
