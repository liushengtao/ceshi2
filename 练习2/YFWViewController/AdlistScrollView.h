//
//  AdlistScrollView.h
//  you
//
//  Created by 优途 on 15-3-4.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AdlistScrollViewDelegate;
@protocol AdlistScrollViewDatasource;

@interface AdlistScrollView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    
    id<AdlistScrollViewDelegate> _delegate;
    id<AdlistScrollViewDatasource> _datasource;
    CGRect scrollFrame;
    NSInteger _totalPages;
    NSInteger _curPage;
    int timerCount;
    int  scrollDir;
    
    NSMutableArray *_curViews;

}

@property (nonatomic,readonly) UIScrollView *scrollView;

@property (nonatomic,readonly) UIPageControl *pageControl;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,strong) id<AdlistScrollViewDatasource> datasource;
@property (nonatomic,strong) id<AdlistScrollViewDelegate> delegate;
- (void)scrollTimer:(int)type;
- (void)reloadData;
-(void)updateSytles;
- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;

- (id)initWithFrame:(CGRect)frame and:(NSInteger)number;


@end

@protocol AdlistScrollViewDelegate <NSObject>

@optional
- (void)adlistdidClickPage:(AdlistScrollView *)csView atIndex:(NSInteger)index;

@end

@protocol AdlistScrollViewDatasource <NSObject>

@required
- (NSInteger)adlistNumberOfPages;
- (UIView *)adlistPageAtIndex:(NSInteger)index;


@end
