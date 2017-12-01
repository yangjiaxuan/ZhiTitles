//
//  TitlesView.h
//  ZhiTitles
//
//  Created by 杨森 on 2017/11/28.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitlesView : UIView

- (void)setAllTitles:(NSArray <NSString *>*)titles colors:(NSArray <UIColor *>*)colors;

- (void)changeToTitleWithIndex:(NSInteger)index;

@end
