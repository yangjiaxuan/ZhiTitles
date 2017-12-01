//
//  TitlesView.m
//  ZhiTitles
//
//  Created by 杨森 on 2017/11/28.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "TitlesView.h"

#define kItemCloseH 5
@interface TitlesView()
{
    UIView *_lastTitleItem;
}
@end
@implementation TitlesView

- (void)setAllTitles:(NSArray <NSString *>*)titles colors:(NSArray <UIColor *>*)colors{
    NSInteger count = titles.count;
    NSInteger itemW = self.frame.size.width/count;
    NSInteger itemH = self.frame.size.height;
    for (NSInteger i=0; i<count; i++) {
        @autoreleasepool {
            UIView *item = [self titleItemWithTitle:titles[i] color:colors[i] frame:CGRectMake(i*itemW, 0, itemW, itemH)];
            item.tag = 1000 + i;
            [self addSubview:item];
        }
    }
    [self changeToTitleWithIndex:0];
}

- (void)changeToTitleWithIndex:(NSInteger)index{
    if (_lastTitleItem) {
        [self closeItem:_lastTitleItem animated:YES];
    }
    _lastTitleItem = [self viewWithTag:1000 + index];
    [self openItem:_lastTitleItem animated:YES];
}

- (UIView *)titleItemWithTitle:(NSString *)title color:(UIColor *)color frame:(CGRect)frame{
    
    CGRect closeFrame = frame;
    closeFrame.size.height = kItemCloseH;
    UIView *item = [[UIView alloc] initWithFrame:closeFrame];
    item.backgroundColor = color;
    
    frame.origin.x = 0;
    UILabel *titleL = [[UILabel alloc] initWithFrame:frame];
    titleL.text     = title;
    titleL.textAlignment = NSTextAlignmentCenter;
    [item addSubview:titleL];
    
    return item;
}

- (void)openItem:(UIView *)item animated:(BOOL)animated{
    NSInteger itemX = item.frame.origin.x;
    NSInteger itemW = item.frame.size.width;
    NSInteger itemH = self.frame.size.height;
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            item.frame = CGRectMake(itemX, 0, itemW, itemH);
        }];
    }
    else{
        item.frame = CGRectMake(itemX, 0, itemW, itemH);
    }
}

- (void)closeItem:(UIView *)item animated:(BOOL)animated{
    
    NSInteger itemX = item.frame.origin.x;
    NSInteger itemW = item.frame.size.width;
    if (animated) {
        [UIView animateWithDuration:0.25 animations:^{
            item.frame = CGRectMake(itemX, 0, itemW, kItemCloseH);
        }];
    }
    else{
        item.frame = CGRectMake(itemX, 0, itemW, kItemCloseH);
    }
}

@end
