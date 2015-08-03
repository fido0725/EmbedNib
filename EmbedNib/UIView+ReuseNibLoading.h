//
//  UIView+ReuseNibLoading.h
//  EmbedNib
//
//  Created by chenfeng on 15/8/3.
//  Copyright (c) 2015年 fido0725. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ReuseNibLoading)

/**
 *  加载复用 只能用于 awakeFromNib 加载nib前使用，切记
 *
 *  @param owner 持有者是否为self YES/NO
 *
 *  @return 返回原实例对象或更换后的实例对象
 */
-(instancetype)loadReuseViewWithOwner:(BOOL)owner;

/**
 *  加载复用
 *
 *  @param owner 持有者是否为self本身 YES/NO
 *  @param tag   同一nib文件里面有多个top-level view时，暂时以tag为区分
 *
 *  @return 返回原实例对象或更换后的实例对象
 */
-(instancetype)loadReuseViewWithOwner:(BOOL)owner tag:(NSInteger)tag;

@end
