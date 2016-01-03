//
//  HomeViewController.m
//  HS_TV
//
//  Created by iURCoder on 12/13/15.
//  Copyright © 2015 iUR. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "HeadView.h"
#import "Player.h"
#import "AVPlayerViewController.h"
#import "MJRefresh.h"
#import "MJDIYAutoFooter.h"
#import <MediaPlayer/MediaPlayer.h>
@interface HomeViewController () <UICollectionViewDataSource,UICollectionViewDelegate>


@property (nonatomic, strong) UICollectionView   * collectionView;
@property (nonatomic, strong) NSArray            * dataArray;
//将视频镜像到支持airplay的设备上的view按钮
@property(nonatomic,strong)MPVolumeView *airplayView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setAttributedTitle:@"华数TV" color:[UIColor orangeColor] range:NSMakeRange(2, 2)];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    layout.itemSize = CGSizeMake((Screen_Width-30)/2, 250);
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-64) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeCell" bundle:nil] forCellWithReuseIdentifier:@"HomeCell"];
    [self.view addSubview:_collectionView];
    
    [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HeadView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    
    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    collectionViewLayout.headerReferenceSize = CGSizeMake(Screen_Width, Screen_Width*9/16);
    
    _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self dropDownRefresh];
    }];
    
    _collectionView.footer=[MJDIYAutoFooter footerWithRefreshingBlock:^{
        [self PullOnLoading];
    }];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receivePlayNoti) name:@"backToHeadView" object:nil];
}
-(void)receivePlayNoti{
    Player *player1 = [[Player alloc]initWithFrame:[[UIScreen mainScreen]bounds] URL:@"http://baobab.cdn.wandoujia.com/14463059939521445330477778425364388_x264.mp4"];
    [self.view addSubview:player1];
}
-(void)dropDownRefresh{
    NSLog(@"下拉刷新");
}

-(void)PullOnLoading{
    NSLog(@"上拉加载");
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCell" forIndexPath:indexPath];
    [cell loadCellWithData:self.dataArray[indexPath.row]];
    
    //停止刷新
    [_collectionView.header endRefreshing];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HeadView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        return view;
    }
    return nil;
}

 -(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%li",indexPath.row);
    
    Player *player1 = [[Player alloc]initWithFrame:[[UIScreen mainScreen]bounds] URL:@"http://baobab.cdn.wandoujia.com/14463059939521445330477778425364388_x264.mp4"];
    [self.view addSubview:player1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = @[@{@"image":@"11.jpg",@"titlt":@"集体大撞脸！",@"subtitle":@"双胞胎合影难分辨"},
                       @{@"image":@"12.jpg",@"titlt":@"92岁老人跑完马拉松创新纪录",@"subtitle":@"创马拉松新纪录"},
                       @{@"image":@"13.jpg",@"titlt":@"大耳朵兔子获封“草泥兔”",@"subtitle":@"人家明明很可爱"},
                       @{@"image":@"14.jpg",@"titlt":@"澳洲2米高袋鼠每日训练拳击",@"subtitle":@"能用爪子粉碎铁通"},
                       @{@"image":@"15.jpg",@"titlt":@"怀旧舞韵瑜伽",@"subtitle":@"《白月光》"},
                       @{@"image":@"16.jpg",@"titlt":@"爵士舞教程",@"subtitle":@"舞蹈教学"},
                       @{@"image":@"17.jpg",@"titlt":@"巨型鱿鱼现新西兰海滩",@"subtitle":@"触手长5米"},
                       @{@"image":@"18.jpg",@"titlt":@"印度老太每天吃2斤沙子",@"subtitle":@"坚持80年身体健康"},
                       @{@"image":@"19.jpg",@"titlt":@"拍摄小电影的一家人",@"subtitle":@"拍摄小电影的一家人"},
                       @{@"image":@"20.jpg",@"titlt":@"抹茶美妆",@"subtitle":@"搞定头发问题"},
                       @{@"image":@"21.jpg",@"titlt":@"狮子因被追赶而逃到树上",@"subtitle":@"狮子逃到树上"},
                       @{@"image":@"22.jpg",@"titlt":@"3姐弟成世界最胖幼儿",@"subtitle":@"世界最胖幼儿"},
                       @{@"image":@"23.jpg",@"titlt":@"原创广场舞放牧姑娘",@"subtitle":@"放牧姑娘"},
                       @{@"image":@"24.jpg",@"titlt":@"农民做变形金刚年入百万",@"subtitle":@"废弃汽车做变形金刚"},
                       @{@"image":@"25.jpg",@"titlt":@"巨型娃娃鱼",@"subtitle":@"太极阴阳符号原型"},
                       @{@"image":@"26.jpg",@"titlt":@"小鸡性别鉴定师",@"subtitle":@"年薪40万招不到人"},
                       @{@"image":@"27.jpg",@"titlt":@"小伙子自建“空中足球场”",@"subtitle":@"空中足球场"}];
    }
    return _dataArray;
}

@end
