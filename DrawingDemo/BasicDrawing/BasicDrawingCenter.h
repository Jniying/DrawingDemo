//
//  BasicDrawingCenter.h
//  Drawing
//
//  Created by Jniying on 15/3/12.
//  Copyright (c) 2015年 Jniying. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicDrawingCenter : NSObject

@property (nonatomic) CGPoint lastPosition; /**<记录上次的位置*/
@property (nonatomic) CGFloat lastAngle; /**<记录上次角度值*/

/**
 *  获取记录中心单例
 *
 *  @return 记录中心
 */
+ (BasicDrawingCenter *)getInstance;

/**
 *  销毁记录中心
 */
+ (void)discardInstance;

@end
