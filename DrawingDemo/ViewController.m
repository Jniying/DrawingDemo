//
//  ViewController.m
//  DrawingDemo
//
//  Created by Jniying on 16/2/7.
//  Copyright © 2016年 Jniying. All rights reserved.
//

#import "ViewController.h"
#import "BasicDrawingView.h"

@interface ViewController () <BasicDrawingViewDelegate>
@property (nonatomic, assign) CGFloat angleTest;/**<*/
@property (nonatomic, strong) BasicDrawingAppearance *appearance2;/**<*/
@property (nonatomic, strong) BasicDrawingAppearance *appearance3;/**<*/
@property (nonatomic, strong) BasicDrawingAppearance *appearance4;/**<*/
@property (nonatomic, strong) NSMutableArray *marr2;;/**<*/


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    BasicDrawingView *view = [[BasicDrawingView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)]; // 创建1个绘图的视图
    view.backgroundColor = [UIColor redColor]; // 设置背景颜色,不设置则默认为透明
    //    BasicDrawingAppearance *appearance1 = [[BasicDrawingAppearance alloc] initWithWidth:10 borderColor:[UIColor greenColor] contentColor:[UIColor yellowColor] needToClose:YES drawingMode:kCGPathFillStroke lineJoin:kCGLineJoinRound lineCap:kCGLineCapRound alpha:1 dashSetting:@[@"10"]]; // 设置线条的外观
    
    _appearance2 = [BasicDrawingAppearance new]; // 设置线条的外观
    _appearance2.borderColor = [UIColor blueColor]; // 线条边框
    _appearance2.drawingMode = kCGPathFillStroke; // 绘图样式
    _appearance2.alpha = 0.5; // 线条透明度
    
    [view drawLines:@[kPointA(30, 35), kArcA(70, 50, 15, -90, 90, 0), kArcA(30, 50, 15, 90, -90, 0)] appearance:_appearance2]; // 开始绘图
    //    [view drawLines:@[kPointA(0, 0), kPointA(50, 50), kPointA(0, 100)] appearance:appearance1]; // 换一个外观
    [self.view addSubview:view];
    
    BasicDrawingView *view2 = [[BasicDrawingView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)]; // 创建1个绘图的视图
    view2.backgroundColor = [UIColor yellowColor]; // 设置背景颜色,不设置则默认为透明
    
    // 利用循环设置规律图形的元素
    NSMutableArray *marr1 = [NSMutableArray new];
    [marr1 addObject:kPointB(50, 10)];
    [marr1 addObject:kLineB(30, 72)];
    
    for (int i = 1; i < 10; i++) {
        if(!(i%2))
            [marr1 addObject:kLineB(30, 144)];
        else
            [marr1 addObject:kLineB(30, -72)];
    }
    
    [view2 drawLines:marr1 appearance:_appearance2]; // 开始绘图
    [self.view addSubview:view2];
    
    BasicDrawingView *view3 = [[BasicDrawingView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)]; // 创建1个绘图的视图
    view3.backgroundColor = [UIColor greenColor]; // 设置背景颜色,不设置则默认为透明
    [self.view addSubview:view3];
    [view3 drawLines:@[kPointA(30, 35), kPointA(35, 35), kPointA(60, 20), kPointA(45, 35),kArcA(70, 50, 15, -90, 0, 0), kArcA(70, 70, 15, 0, 90, 0), kArcA(30, 70, 15, 90, 180, 0), kArcA(30, 50, 15, -180, -90, 0)] appearance:_appearance2]; // 开始绘图
    
    BasicDrawingView *view4 = [[BasicDrawingView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)]; // 创建1个绘图的视图
    view4.backgroundColor = [UIColor cyanColor]; // 设置背景颜色,不设置则默认为透明
    view4.delegate = self; // 设置画板的代理为自己
    view4.tag = 104;
    [self.view addSubview:view4];
    
    // 利用循环设置规律图形的元素
    _marr2 = [NSMutableArray new];
    [_marr2 addObject:kPointB(50, 50)];
    [_marr2 addObject:kLineB(40, -90)];
    
    for(int i = 1; i < 8; i++){
        if(i%2)
            [_marr2 addObject:kArcB(20, 180, 180, NO)];
        else
            [_marr2 addObject:kLineB(40, 180)];
    }
    
    [view4 drawLines:_marr2 appearance:_appearance2]; // 开始绘图
    [view4 drawLines:@[kRoundA(50, 50, 3, 3)] appearance:_appearance2]; // 继续在该视图上绘图
    
    BasicDrawingView *view5 = [BasicDrawingView basicDrawingViewWithFrame:CGRectMake(200, 100, 100, 100)]; // 选择与取消模块
    view5.delegate = self;
    view5.tag = 105;
    [self.view addSubview:view5];
    view5.backgroundColor = [UIColor orangeColor];
    
    _appearance3 = [BasicDrawingAppearance new];
    _appearance3.drawingMode = kCGPathFillStroke;
    
    _appearance4 = [BasicDrawingAppearance new];
    _appearance4.width = 2;
    
    [view5 drawLines:@[kRectA(30, 30, 40, 40)] appearance:_appearance3];
    [view5 drawLines:@[kPointB(50, 60), kLineB(30, -135), kMoveLineB(30, -180), kLineB(50, -90)] appearance:_appearance4];
    
    BasicDrawingView *view6 = [BasicDrawingView basicDrawingViewWithFrame:CGRectMake(200, 200, 100, 100)];
    view6.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view6];
    [view6 drawLines:@[kRectA(30, 30, 40, 40)] appearance:_appearance3];
    
}

- (void)drawingViewDidTap:(BasicDrawingView *)basicDrawingView{
    switch (basicDrawingView.tag) {
        case 104:{ // 风车
            if(!basicDrawingView.status)
                [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(run:) userInfo:basicDrawingView repeats:YES];
        }
            break;
            
        case 105:{ // 选择与取消模块
            [basicDrawingView drawLines:@[kRectA(30, 30, 40, 40)] appearance:_appearance3];
            if(basicDrawingView.status)
                [basicDrawingView drawLines:@[kPointB(50, 60), kLineB(30, -135), kMoveLineB(30, -180), kLineB(50, -90)] appearance:_appearance4];
            [basicDrawingView redraw];
        }
            break;
    }
    
    basicDrawingView.status = !basicDrawingView.status;
}

- (void)run:(NSTimer *)timer{
    BasicDrawingView *basicDrawingView = timer.userInfo;
    if(!basicDrawingView.status)
        [timer invalidate];
    else{
        _angleTest = _angleTest+10 > 360 ? 10 : _angleTest+10;
        NSLog(@"%f", _angleTest);
        _marr2[1] = kLineB(40, -90+_angleTest);
        [basicDrawingView drawLines:_marr2 appearance:_appearance2];
        [basicDrawingView drawLines:@[kRoundA(50, 50, 3, 3)] appearance:_appearance2];
        [basicDrawingView redraw];
    }
}
@end
