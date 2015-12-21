//
//  AdlistScrollView.m
//  you
//
//  Created by 优途 on 15-3-4.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "AdlistScrollView.h"

@implementation AdlistScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize scrollView = _scrollView;
@synthesize pageControl = _pageControl;
@synthesize currentPage = _curPage;
@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

- (id)initWithFrame:(CGRect)frame and:(NSInteger)number
{
    self = [super initWithFrame:frame];
    if (self) {
        scrollFrame=frame;
        // Initialization code
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width*number , 50);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
        _scrollView.pagingEnabled = YES;
        [self addSubview:_scrollView];
        timerCount=0;
        
    }
    return self;
}
-(void)updateSytles
{
//    if (_style==CusstomScrollViewStyledelegate) {
    
        
        
    CGRect rect = CGRectMake(self.bounds.size.width-100, self.bounds.size.height-20, 100, 20);
        
    _pageControl = [[UIPageControl alloc] initWithFrame:rect];
    _pageControl.pageIndicatorTintColor = UIColorFromRGB(0xeeeeee); // 未选中的点的颜色
    
    _pageControl.currentPageIndicatorTintColor = UIColorFromRGB(0xdbdbdb); // 选
    
//    }
//    else
//    {
//        CGRect rect = self.bounds;
//        rect.origin.y = rect.size.height - 30;
//        rect.size.height = 30;
//        _pageControl = [[UIPageControl alloc] initWithFrame:rect];
//        
//        
//    }
    _pageControl.userInteractionEnabled = NO;
    scrollDir=1;
    [self addSubview:_pageControl];
    
    _curPage = 0;
}
- (void)scrollTimer:(int)type
{
    
    if (type==0) {
        scrollDir=1;
    }
    else
    {
        scrollDir=-1;
    }
    
    timerCount++;
    
    if (timerCount == 3) {
        timerCount=0;
        
        
        
        [_scrollView setContentOffset:CGPointMake(scrollFrame.size.width+scrollFrame.size.width*scrollDir, 0)animated:YES];
        
        
        
    }
}
- (void)setDataource:(id<AdlistScrollViewDatasource>)datasource
{
    _datasource = datasource;
    [self reloadData];
}

- (void)reloadData
{
    _totalPages = [_datasource adlistNumberOfPages];
    if (_totalPages == 0 ) {
        return;
    }
    _pageControl.numberOfPages = _totalPages;
    [self loadData];
}

- (void)loadData
{
    
    _pageControl.currentPage = _curPage;
    
    //从scrollView上移除所有的subview
    NSArray *subViews = [_scrollView subviews];
    if([subViews count] != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    [self getDisplayImagesWithCurpage:_curPage];
    
    for (int i = 0; i < 3; i++) {
        UIView *v = [_curViews objectAtIndex:i];
        v.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [v addGestureRecognizer:singleTap];
        v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
        [_scrollView addSubview:v];
    }
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
}

- (void)getDisplayImagesWithCurpage:(NSInteger)page {
    
    NSInteger pre = [self validPageValue:_curPage-1];
    NSInteger last = [self validPageValue:_curPage+1];
    
    if (!_curViews) {
        _curViews = [[NSMutableArray alloc] init];
    }
    
    [_curViews removeAllObjects];
    
    [_curViews addObject:[_datasource adlistPageAtIndex:pre]];
    [_curViews addObject:[_datasource adlistPageAtIndex:page]];
    [_curViews addObject:[_datasource adlistPageAtIndex:last]];
}

- (NSInteger)validPageValue:(NSInteger)value {
    
    if(value == -1) value = _totalPages - 1;
    if(value == _totalPages) value = 0;
    
    return value;
    
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    
    if ([_delegate respondsToSelector:@selector(adlistdidClickPage:atIndex:)]) {
        [_delegate adlistdidClickPage:self atIndex:_curPage];
    }
    
}

- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index
{
    if (index == _curPage) {
        [_curViews replaceObjectAtIndex:1 withObject:view];
        for (int i = 0; i < 3; i++) {
            UIView *v = [_curViews objectAtIndex:i];
            v.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(handleTap:)];
            [v addGestureRecognizer:singleTap];
            v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
            [_scrollView addSubview:v];
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    int x = aScrollView.contentOffset.x;
    
    //往下翻一张
    if(x >= (2*self.frame.size.width)) {
        _curPage = [self validPageValue:_curPage+1];
        [self loadData];
    }
    
    //往上翻
    if(x <= 0) {
        _curPage = [self validPageValue:_curPage-1];
        [self loadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView {
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:YES];
    
}
@end
