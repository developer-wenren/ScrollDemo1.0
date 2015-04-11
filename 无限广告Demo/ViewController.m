//
//  ViewController.m
//  无限广告Demo
//
//  Created by zjsruxxxy3 on 15/4/11.
//  Copyright (c) 2015年 OC. All rights reserved
// 图片前后都加一



#import "ViewController.h"

#import "InputViewController.h"

#define ImageW 157
#define ImageH 157
#define MoveIntervalTime 1.5

@interface ViewController ()<UIScrollViewDelegate>
{

}
@property(nonatomic,weak)UIScrollView *scrollView;

@property(nonatomic,strong)NSArray *imgsArray;

@property(nonatomic,weak)UIPageControl *pageControl;

@end

@implementation ViewController

-(NSArray *)imgsArray
{
    if (_imgsArray == nil)
    {
         NSString *plistFile =[[NSBundle mainBundle]pathForResource:@"imgs" ofType:@"plist"];
        
        _imgsArray = [NSArray arrayWithContentsOfFile:plistFile];
        
    }
    
    
    return _imgsArray;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    //[self setupPushButton];
    
    [self setupScrollView];

    [self setupScrollViewContent];
    
    [self setupTimerLoop];
    
    [self setupPageControl];

    
                                 
}


-(void)setupScrollView
{
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ImageH, ImageH)];
    
    scrollView.center = CGPointMake(self.view.bounds.size.width*.5, ImageH);
    
    self.scrollView = scrollView;
    
    scrollView.delegate = self;
    
    scrollView.backgroundColor = [UIColor grayColor];
    
    scrollView.contentSize = CGSizeMake(ImageH*self.imgsArray.count, 0);
    
    scrollView.showsVerticalScrollIndicator = NO;
    
    scrollView.pagingEnabled = YES;
    
    scrollView.bounces = NO;
    
    [self.view addSubview:scrollView];
    
}

-(void)setupScrollViewContent
{
    
    for (int i = 0; i<self.imgsArray.count; i++)
    {
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imgsArray[i]]];
        
        imageView.frame = CGRectMake(i*ImageH,0, ImageH, ImageH);
        
        [self.scrollView addSubview:imageView];
        
    }
    
    [self.scrollView setContentOffset:CGPointMake(ImageH, 0) animated:NO];
    
}

-(void)setupTimerLoop
{
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:MoveIntervalTime target:self selector:@selector(makeScrollViewMove) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

-(void)setupPageControl
{
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    
    pageControl.currentPage = 0;
    
    pageControl.numberOfPages = self.imgsArray.count-2;
    
    [self.view addSubview:pageControl];
    
    pageControl.center = (CGPoint){self.view.bounds.size.width*.5,300};
    
    self.pageControl = pageControl;
    
    self.view.backgroundColor = [UIColor grayColor];
}

#pragma mark scrollview delegate

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    int current = (int)self.scrollView.contentOffset.x/ImageH;
    
    if(current >= self.imgsArray.count-1)
    {
        [scrollView setContentOffset:CGPointMake(ImageH,0) animated:NO];
        
    }

    
}


-(void)makeScrollViewMove
{

    int page = (int) self.pageControl.currentPage;
    page++;
    
    self.pageControl.currentPage = page >(self.imgsArray.count-3) ? 0:page;
    
    [self.scrollView setContentOffset:CGPointMake(ImageH*(page+1), 0) animated:YES];
    
}










/*
-(void)setupPushButton
{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    [self.view addSubview:button];
    
    button.center = (CGPoint){160,320};
    
    
    UIImageWriteToSavedPhotosAlbum([UIImage imageNamed:@"20.png"], nil, nil, nil);
    
    [button addTarget:self action:@selector(clickToPushViewController) forControlEvents:UIControlEventTouchDown];
}

-(void)clickToPushViewController
{
    InputViewController *inputVc = [[InputViewController alloc]init];
    
    [self.navigationController pushViewController:inputVc animated:YES];
    
    
}

*/

+(void)postWithUrl:(NSString *)url params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure
{
    if (success)
    {
        success(@"wrcj");

    }else
    {
        NSError *error = [[NSError alloc]init];
        
        failure(error);
        
    }
    
    
    
}


-(void)dealloc
{
    
}


@end
