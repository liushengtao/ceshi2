//
//  CusstomScrollView.h
//  you
//
//  Created by 优途 on 15-2-28.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CusstomScrollViewDelegate;
@protocol CusstomScrollViewDatasource;

typedef enum _CusstomScrollViewStyle
{
    CusstomScrollViewStyleNomal,
    CusstomScrollViewStyledelegate
    
}CusstomScrollViewStyle;

@interface CusstomScrollView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    
    id<CusstomScrollViewDelegate> _delegate;
    id<CusstomScrollViewDatasource> _datasource;
    CGRect scrollFrame;
    NSInteger _totalPages;
    NSInteger _curPage;
    int timerCount;
    int  scrollDir;
    
    NSMutableArray *_curViews;


}

@property (nonatomic,readonly) UIScrollView *scrollView;
@property(nonatomic,assign)CusstomScrollViewStyle style;

@property (nonatomic,readonly) UIPageControl *pageControl;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,strong) id<CusstomScrollViewDatasource> datasource;
@property (nonatomic,strong) id<CusstomScrollViewDelegate> delegate;
- (void)scrollTimer:(int)type;
- (void)reloadData;
-(void)updateSytles;
- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;

@end

@protocol CusstomScrollViewDelegate <NSObject>

@optional
- (void)didClickPage:(CusstomScrollView *)csView atIndex:(NSInteger)index;

@end

@protocol CusstomScrollViewDatasource <NSObject>

@required
- (NSInteger)numberOfPages;
- (UIView *)pageAtIndex:(NSInteger)index;

@end
