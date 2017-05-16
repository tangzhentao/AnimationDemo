//
//  TableViewController.m
//  AnimationDemo
//
//  Created by tang on 2017/5/10.
//  Copyright © 2017年 tangzhentao. All rights reserved.
//

#import "TableViewController.h"
#import "BlueLayerVC.h"
#import "ImageLayerVC.h"
#import "ImageSpritesVC.h"
#import "ModulesViewController.h"
#import "ContentsCenterVC.h"
#import "LayerDelegateVC.h"
#import "AnchorPointVC.h"

static NSString * identifier = @"identifier";
static NSString *blueLayer = @"blueLayer";
static NSString *imageLayer = @"imageLayer";
static NSString *imageSprites = @"image sprites";
static NSString *modules = @"modules";
static NSString *contentCenter = @"contentCenter";
static NSString *CALayerDelegate = @"CALayerDelegate";
static NSString *anchorPoint = @"anchorPoint";

//NSString *blueLayer = @"blueLayer";


@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    [self setupData];
}

- (void)setupData
{
    _dataArray = [NSMutableArray arrayWithArray:@[blueLayer,
                                                  imageLayer,
                                                  imageSprites,
                                                  modules,
                                                  contentCenter,
                                                  CALayerDelegate,
                                                  anchorPoint,
                                                  ]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *type = self.dataArray[indexPath.row];
    
    UIViewController *vc = nil;
    if ([type isEqualToString:blueLayer]) {
        vc = [BlueLayerVC new];
    } else if ([type isEqualToString:imageLayer]) {
        vc = [ImageLayerVC new];
    } else if ([type isEqualToString:imageSprites]) {
        vc = [ImageSpritesVC new];
    } else if ([type isEqualToString:modules]) {
        vc = [ModulesViewController new];
    } else if ([type isEqualToString:contentCenter]) {
        vc = [ContentsCenterVC new];
    } else if ([type isEqualToString:CALayerDelegate]) {
        vc = [LayerDelegateVC new];
    } else if ([type isEqualToString:anchorPoint]) {
        vc = [AnchorPointVC new];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
