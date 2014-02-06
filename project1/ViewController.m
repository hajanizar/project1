//
//  ViewController.m
//  project1
//
//  Created by BSA Univ4 on 29/01/14.
//  Copyright (c) 2014 BSA Univ4. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    NSManagedObjectContext *context;
}

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self TextField]setDelegate:self];
    AppDelegate *appdelegate= [[UIApplication sharedApplication]delegate];
    context =[appdelegate managedObjectContext];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveButton:(id)sender
{
    
    NSEntityDescription *entitydesc =[NSEntityDescription entityForName:@"Save" inManagedObjectContext:context];
    NSManagedObject *newSave=[[NSManagedObject alloc]initWithEntity:entitydesc insertIntoManagedObjectContext:context];
    [newSave setValue:self.TextField.text forKey:@"categoryname"];
    
    NSError *error;
    [context save:&error];
    self.LabelView.text =@"Category added.";
    
}

- (IBAction)DisplayButton:(id)sender
{
    NSEntityDescription *entitydesc =[NSEntityDescription entityForName:@"Save" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entitydesc];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"categoryname like %@",self.TextField.text];
    [request setPredicate:predicate];
    NSError *error;
    NSArray *matchingData = [context executeFetchRequest:request error:&error];
    
    if(matchingData.count <= 0)
    {
        self.LabelView.text=@"No Save Found";
    }
    else
    {
        NSString *categoryname;
        for(NSManagedObject *obj in matchingData)
        {
            categoryname = [obj valueForKey:@"categoryname"];
            
        }
      self.LabelView.text =[NSString stringWithFormat:@"categoryname Fetched%@",categoryname];
        //NSLog(@"category name fetched:%@",categoryname);
    }
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}
@end
