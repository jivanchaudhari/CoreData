//
//  AddViewController.m
//  CoreData
//
//  Created by Student 13 on 2/12/17.
//  Copyright © 2017 Jivan Chaudhari. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController


//-(NSManagedObjectContext *)managedObjectContext {
//    
//    NSManagedObjectContext *context = nil;
//    
//    id delegate = [[UIApplication sharedApplication]delegate];
//    
//    if ([delegate performSelector:@selector(managedObjectContext)]) {
//        
//        context = [delegate managedObjectContext];
//    }
//    return context;
//    
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *userdelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    context = userdelegate .persistentContainer.viewContext;
    
    // Do any additional setup after loading the view.
}

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

- (IBAction)saveButtonAction:(id)sender {
    
   
    if (_segmentAction.selectedSegmentIndex == 0) {
        
        newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"TV" inManagedObjectContext:context];
        [self entitySetText];
        
    } else if (_segmentAction.selectedSegmentIndex == 1) {
        
        newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"AC" inManagedObjectContext:context];
        [self entitySetTextForAC];

    } else if (_segmentAction.selectedSegmentIndex == 2) {
        
        newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Mobile" inManagedObjectContext:context];
        [self entitySetText];
        
    }
}
-(void)entitySetText {
    
    NSString *textName = _nameTextField.text;
    NSString *textPrice = _priceTextField.text;
    NSString *textModal = _modalTextField.text;
    
    if (textName.length > 0) {
        if (textPrice.length > 0) {
            if (textModal.length > 0) {
                
               
                [newDevice setValue:textName forKey:@"name"];
                [newDevice setValue:textPrice forKey:@"price"];
                [newDevice setValue:textModal forKey:@"modal"];
                
                NSError *error;
                if ([context save:&error]) {
                    NSLog(@"data saved");
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                } else {
                    NSLog(@"unable to save : %@",error.localizedDescription);
                    
                }
                
            } else {
                NSLog(@"Third text not save");
                
            }
        } else {
            NSLog(@"Second text not save");
            
        }
    } else {
        NSLog(@"First text not save");
        
    }
}
-(void)entitySetTextForAC {
    
    NSString *textName = _nameTextField.text;
    NSString *textPrice = _priceTextField.text;
    
    if (textName.length > 0) {
        if (textPrice.length > 0) {
                
                [newDevice setValue:textName forKey:@"name"];
                [newDevice setValue:textPrice forKey:@"price"];
                
                NSError *error;
                if ([context save:&error]) {
                    NSLog(@"data saved");
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                } else {
                    NSLog(@"unable to save : %@",error.localizedDescription);
                    
                }
                
            } else {
                NSLog(@"Second text not save");
            }
        } else {
            NSLog(@"First text not save");
        }
}

- (IBAction)segmentAction:(id)sender {
    _segmentAction = sender;
    
    if (_segmentControl.selectedSegmentIndex == 0) {
        _modalTextField.hidden = NO;
        
   // [self saveButtonAction:sender];
    
    } else if (_segmentControl.selectedSegmentIndex == 1) {
        _modalTextField.hidden = YES;

       // [self saveButtonAction:sender];
        
    } else if (_segmentControl.selectedSegmentIndex == 2) {
        _modalTextField.hidden = NO;

      //  [self saveButtonAction:sender];
        
    }
}
@end
