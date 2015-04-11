//
//  InputViewController.m
//  无限广告Demo
//
//  Created by zjsruxxxy3 on 15/4/11.
//  Copyright (c) 2015年 OC. All rights reserved.
//

#import "InputViewController.h"

#import "WRTextView.h"

@interface InputViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,weak)WRTextView *textView;

@property(nonatomic,strong)UIImagePickerController *imgPickerController;

@property(nonatomic,weak)UIImageView *imgView;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupTextView];
    
    
    [self setupRightButtonItem];
    
    
}

-(void)setupRightButtonItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPhoto)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.textView becomeFirstResponder];

}

-(void)setupImgView
{
    UIImageView *imgView = [[UIImageView alloc]init];
    
    imgView.backgroundColor =[UIColor redColor];
    
    imgView.frame = CGRectMake(0, 200, 50, 50);
    
    [self.view addSubview:imgView];
    
    self.imgView = imgView;
}

-(void)setupTextView
{
    WRTextView *textView2 = [[WRTextView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    
    textView2.placeholderColor = [UIColor greenColor];
    
    textView2.placeHolderText = @"wrcj12138";
    
    self.textView = textView2;
    
    [self.view addSubview:textView2];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textDidEdit:) name:UITextViewTextDidChangeNotification object:self.textView];
    
}

-(void)textDidEdit:(NSNotification *)notification
{
    
    self.navigationItem.rightBarButtonItem.enabled = !(self.textView.text.length == 0);
    
    self.textView.placeholderLabel.hidden = !(self.textView.text.length == 0);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)addPhoto
{
    self.imgPickerController = [[UIImagePickerController alloc]init];
    
    self.imgPickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    self.imgPickerController.delegate = self;
    
    [self presentViewController:self.imgPickerController animated:YES completion:nil];
    
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *img = (UIImage *)info[UIImagePickerControllerOriginalImage];
    
    self.imgView.image =img;
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        picker.delegate = nil;
        
        NSLog(@"%@",img);
        
    }];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        picker.delegate = nil;
        
        
        
    }];
    
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
@end
