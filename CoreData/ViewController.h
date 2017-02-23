//
//  ViewController.h
//  CoreData
//
//  Created by Student 13 on 2/12/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "AddViewController.h"
#import "CustomTableViewCell.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *displayDataTV;
    NSMutableArray *displayDataMobile;
    NSMutableArray *displayDataAC;
    
    NSManagedObjectContext *context;

}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)segmentAction:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
- (IBAction)addButtonAction:(id)sender;

@end

