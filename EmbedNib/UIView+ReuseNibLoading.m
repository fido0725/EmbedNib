//
//  UIView+ReuseNibLoading.m
//  EmbedNib
//
//  Created by chenfeng on 15/8/3.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

#import "UIView+ReuseNibLoading.h"

@implementation UIView (ReuseNibLoading)

-(instancetype)loadReuseViewWithOwner:(BOOL)owner
{
    return [self loadReuseViewWithOwner:owner tag:0];
}

- (instancetype)loadReuseViewWithOwner:(BOOL)owner tag:(NSInteger)tag
{
    if (self.subviews.count==0) {
        UIView *other;
        ///top_level object
        other = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:(owner?self:nil) options:nil][tag];

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
            return other;
    }
    return self;
}
@end
