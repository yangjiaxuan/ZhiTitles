//
//  ViewController.m
//  ZhiTitles
//
//  Created by 杨森 on 2017/11/28.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "ViewController.h"
#import "TitlesView.h"

@interface ViewController ()
{
    
    TitlesView *_titleView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSInteger screenW = [UIScreen mainScreen].bounds.size.width;
    _titleView = [[TitlesView alloc] initWithFrame:CGRectMake(0, 200, screenW, screenW*0.2)];
    [self.view addSubview:_titleView];
    NSArray *titles = @[@"1",@"2",@"3",@"4",@"5"];
    NSArray *colors = @[[UIColor grayColor],
                        [UIColor purpleColor],
                        [UIColor yellowColor],
                        [UIColor greenColor],
                        [UIColor redColor]];
    [_titleView setAllTitles:titles colors:colors];
}

NSInteger _lastIndex = 0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSInteger index = 0;
    while (_lastIndex == index) {
        index = arc4random()%5;
    }
    _lastIndex = index;
    [_titleView changeToTitleWithIndex:_lastIndex];
}
@end
