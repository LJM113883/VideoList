//
//  ViewController.m
//  viodeoList
//
//  Created by gupo on 2017/9/29.
//  Copyright © 2017年 person. All rights reserved.
//

#import "ViewController.h"
#import "ZZVideoCellTableViewCell.h"
#import "ZZVideoPlayer.h"
NSString *const celID = @"ZZVideoCellTableViewCell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,ZZVideoCellDelegate>{
    NSIndexPath *_indexPath;
    ZZVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}
@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataSourceArr;
@end

@implementation ViewController

#pragma mark -- property list
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray arrayWithCapacity:0];
        for (int i =0; i<10; i++) {
            [_dataSourceArr addObject:@"1"];
        }
    }
    return _dataSourceArr;
}
#pragma mark - life cyle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [_player destroyPlayer];
    _player = nil;
}
#pragma mark - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZZVideoCellTableViewCell *cel = [tableView dequeueReusableCellWithIdentifier:celID];
    if (!cel) {
        cel = [ZZVideoCellTableViewCell loadCell];
    }
    ///添加数据
    [cel configData:@""];
    cel.delegate = self;

    return cel;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 330;
}
#pragma mark --ZZVideoCellDelegate
-(void)cellConverImgClick:(UITableViewCell *)cel data:(id)data{
    ZZVideoCellTableViewCell *cell = (ZZVideoCellTableViewCell*)cel;
    
    [_player destroyPlayer];
    _player = nil;
    
    UIView *view = cell.converImg;
    
    _indexPath = [self.tableView indexPathForCell:cell];
    
    _player = [[ZZVideoPlayer alloc] init];
    //NSString *str =[[NSBundle mainBundle]pathForResource:@"123" ofType:@"mp4"];
    
    _player.videoUrl = @"https://media.w3.org/2010/05/sintel/trailer.mp4";
    [_player playerBindTableView:self.tableView currentIndexPath:_indexPath];
    _player.frame = view.frame;
    
    [cell.contentView addSubview:_player];
    
    _player.completedPlayingBlock = ^(ZZVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.tableView]) {
        
        [_player playerScrollIsSupportSmallWindowPlay:NO];
    }
}

@end
