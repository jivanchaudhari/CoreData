//
//  CustomTableViewCell.h
//  CoreData
//
//  Created by Student 13 on 2/12/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelModal;

@end
