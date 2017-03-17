//
//  UploadMediaViewController.m
//  SDKDemo
//
//  Created by OnePoint Global on 04/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

#import "UploadMediaViewController.h"
#import <OPGSDK/OPGSDK.h>

@interface UploadMediaViewController ()

@property(strong, nonatomic) NSString* mediaID;

@end

@implementation UploadMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
    
    OPGSDK* sdk = [OPGSDK new];                   // Creating OPGSDK instance
    NSError *error;
    self.mediaID = [sdk uploadMediaFile:savedImagePath error:&error];
    NSLog(@"Uploaded media ID is %@",_mediaID);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - IBAction
-(IBAction)uploadImage:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerController animated:YES completion:nil];
}


@end
