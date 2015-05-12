//
//  RoundsViewController.m
//  The-Pomodoro-iOS8
//
//  Created by Austin Mecham on 5/11/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsViewController.h"
#import "RoundsController.h"
#import "Timer.h"

static NSString * const reuseID = @"reuseID";

@interface RoundsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation RoundsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];
    [self.view addSubview:self.tableView];
    
    [self registerForNotifications];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    NSArray *roundsArray = [RoundsController sharedInstance].roundTimes;
    
    NSNumber *minutes = roundsArray[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li minutes", (long)[minutes integerValue]];
    
//    cell.imageView.image =
    
    NSArray *imageArrayForCells = [RoundsController sharedInstance].imageArray;
    NSString *imageString = [NSString stringWithFormat:@"%@", imageArrayForCells[indexPath.row]];
    cell.imageView.image = [UIImage imageNamed:imageString];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [RoundsController sharedInstance].roundTimes.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [RoundsController sharedInstance].currentRound = indexPath.row;
    
    [[RoundsController sharedInstance] roundSelected];
    [[Timer sharedInstance] cancelTimer];
    
}

- (void)registerForNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(roundComplete) name:TimerCompleteNotificiation object:nil];
}

- (void)unregisterForNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

- (void) dealloc
{
    [self unregisterForNotifications];
}



- (void)roundComplete
{
    if ([RoundsController sharedInstance].currentRound < [RoundsController sharedInstance].roundTimes.count - 1)
    {
        [RoundsController sharedInstance].currentRound++;
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:[RoundsController sharedInstance].currentRound inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        [[RoundsController sharedInstance] roundSelected];
    }
    else
    {
        [RoundsController sharedInstance].currentRound = 0;
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[RoundsController sharedInstance].currentRound inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        [[RoundsController sharedInstance] roundSelected];
    }
    
}

//- (void)reigsterForNotifications

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
