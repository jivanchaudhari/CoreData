//
//  ViewController.m
//  CoreData
//
//  Created by Student 13 on 2/12/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//-(NSManagedObjectContext *) managedObjectContext {
//    NSManagedObjectContext *context = nil;
//    
//    id delegate = [[UIApplication sharedApplication ]delegate];
//    
//    if ([delegate performSelector:@selector(managedObjectContext)]) {
//        context = [delegate managedObjectContext];
//        
//    }
//    return context;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *userdelegate = (AppDelegate *)[UIApplication sharedApplication ].delegate;
    context = userdelegate.persistentContainer.viewContext;
    [self.tableView reloadData];

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    
    [self fetchDeviceFromCoreData];
    
}
-(void)fetchDeviceFromCoreData {
    
    if (_segmentControl.selectedSegmentIndex == 0) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"TV"];
        NSError *error;
        displayDataTV = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        if (error) {
            NSLog(@"%@",error.localizedDescription);
            
        } else {
            [self.tableView reloadData];
            
        }
    } else if (_segmentControl.selectedSegmentIndex == 1) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"AC"];
        NSError *error;
        displayDataAC = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        if (error) {
            NSLog(@"%@",error.localizedDescription);
            
        } else {
            [self.tableView reloadData];
            
        }
    } else if (_segmentControl.selectedSegmentIndex == 2) {
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Mobile"];
        NSError *error;
        displayDataMobile = [[context executeFetchRequest:fetchRequest error:&error]mutableCopy];
        if (error) {
            NSLog(@"%@",error.localizedDescription);
            
        } else {
            [self.tableView reloadData];
            
        }
    }


}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_segmentControl.selectedSegmentIndex == 0) {
        
        return displayDataTV.count;
 
    } else if (_segmentControl.selectedSegmentIndex == 1) {
        
        return displayDataAC.count;
        
    
    } else if (_segmentControl.selectedSegmentIndex == 2) {
        
        return displayDataMobile.count;
        
    }
    return 0;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (_segmentControl.selectedSegmentIndex == 0) {
        
        NSManagedObject *device = [displayDataTV objectAtIndex:indexPath.row];
        
        cell.labelName.text = [device valueForKey:@"name"];
        cell.labelModal.text = [device valueForKey:@"modal"];
        cell.labelPrice.text = [device valueForKey:@"price"];
        
    }else if (_segmentControl.selectedSegmentIndex == 1) {
        
        NSManagedObject *device = [displayDataAC objectAtIndex:indexPath.row];
        
        cell.labelName.text = [device valueForKey:@"name"];
        cell.labelPrice.text = [device valueForKey:@"price"];
        cell.labelModal.hidden = YES;
        
    } else if (_segmentControl.selectedSegmentIndex == 2) {
        
        NSManagedObject *device = [displayDataMobile objectAtIndex:indexPath.row];
        
        cell.labelName.text = [device valueForKey:@"name"];
        cell.labelModal.text = [device valueForKey:@"modal"];
        cell.labelPrice.text = [device valueForKey:@"price"];
        
    }    return cell;
    
}


- (IBAction)segmentAction:(id)sender {
    
    if (_segmentControl.selectedSegmentIndex == 0 ) {
        
        [self.tableView reloadData];
        
    } else if (_segmentControl.selectedSegmentIndex == 1 ) {
        
        [self.tableView reloadData];
        
    } else if (_segmentControl.selectedSegmentIndex == 2 ) {
        
        [self.tableView reloadData];
        
    }
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
    
}
-(void) deleteEntry : (NSIndexPath *)indexPath {
   // NSManagedObjectContext *context;
    if (_segmentControl.selectedSegmentIndex == 0) {
        
        [context deleteObject:[displayDataTV objectAtIndex:indexPath.row]];
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self fetchDeviceFromCoreData];
            
        } else {
            NSLog(@"NOT Delete Record");
            
        }

    } else if (_segmentControl.selectedSegmentIndex == 1) {
        
        [context deleteObject:[displayDataAC objectAtIndex:indexPath.row]];
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self fetchDeviceFromCoreData];
            
        } else {
            NSLog(@"NOT Delete Record");
            
        }

    } else if (_segmentControl.selectedSegmentIndex == 2) {
        
        [context deleteObject:[displayDataMobile objectAtIndex:indexPath.row]];
        NSError *error;
        if ([context save:&error]) {
            NSLog(@"Deleted");
            
            [self fetchDeviceFromCoreData];
            
        } else {
            NSLog(@"NOT Delete Record");
        }
    }
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self deleteEntry:indexPath];
    } else {
        NSLog(@"Can not Deleted Entry.");
        
    }
}
- (IBAction)addButtonAction:(id)sender {
    
    AddViewController *view = [self.storyboard instantiateViewControllerWithIdentifier:@"AddViewController"];
    [self.navigationController pushViewController:view animated:YES];
    
}
@end
