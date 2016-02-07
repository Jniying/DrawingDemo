//
//  BasicDrawingElement.m
//  Drawing
//
//  Created by Jniying on 15/3/12.
//  Copyright (c) 2015年 Jniying. All rights reserved.
//

#import "BasicDrawingElement.h"

@implementation BasicDrawingElement

- (BasicDrawingElement *)initWithValue:(NSValue *)value andElementType:(ElementType)elementType{
    if(self = [super init]){
        _value = value;
        _elementType = elementType;
    }
    return self;
}

+ (NSValue *)transformArcType:(ArcType)arcType{
    ArcType newArcType = arcType;
   return [NSValue valueWithBytes:&newArcType objCType:@encode(ArcType)]; // 因为快速创建的圆弧类型为右操作数,所以需要申请一块空间
}

//- (void)dealloc{
//    NSLog(@"BDE");
//}

@end
