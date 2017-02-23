//
//  AddViewController.h
//  CoreData
//
//  Created by Student 13 on 2/12/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AddViewController : UIViewController
{
    NSManagedObjectContext *context;
    NSManagedObject *newDevice;
    
}
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *priceTextField;
@property (strong, nonatomic) IBOutlet UITextField *modalTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentAction;
- (IBAction)saveButtonAction:(id)sender;
- (IBAction)segmentAction:(id)sender;

@end
