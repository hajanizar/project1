//
//  ViewController.h
//  project1
//
//  Created by BSA Univ4 on 29/01/14.
//  Copyright (c) 2014 BSA Univ4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *TextField;
@property (weak, nonatomic) IBOutlet UILabel *LabelView;
- (IBAction)SaveButton:(id)sender;
- (IBAction)DisplayButton:(id)sender;

@end
