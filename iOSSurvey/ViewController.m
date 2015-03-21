//
//  ViewController.m
//  iOSSurvey
//
//  Created by jollyjoester_pro on 3/21/15.
//  Copyright (c) 2015 Hideyuki Nanashima. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation UIWebView(hack)

- (BOOL)respondsToSelector:(SEL)aSelector {
    if ([NSStringFromSelector(aSelector) isEqualToString:@"webThreadWebViewDidLayout:"]) {
        NSLog(@"[%s] %@", class_getName([self class]), NSStringFromSelector(aSelector));
        return [super respondsToSelector:aSelector];
    }
    return [super respondsToSelector:aSelector];
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    dumpSubview(_pickerView);
//    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
//    dumpSubview(webView);
//    
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
//    dumpSubview(tableView);
    
    NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark dump subview
void dumpSubview(UIView* view) {
    NSLog(@"%s", class_getName([view class]));
    for (UIView* subview in [view subviews]) {
        dumpSubview(subview);
    }
}

@end
