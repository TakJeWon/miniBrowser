//
//  ViewController.m
//  miniBrowser
//
//  Created by 탁제원 on 2022/01/17.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize bookMarkSegmentedControl, urlTextField, wkwebView, activityIndicatorView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *urlString = @"http://www.facebook.com";
    [wkwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    urlTextField.text = urlString;

    self.wkwebView.navigationDelegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *urlString = urlTextField.text;
    
    if (![urlString hasPrefix:@"http://"]){
        urlString = [[NSString alloc] initWithFormat:@"http://%@",urlString];
    }
    [wkwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    [textField resignFirstResponder];
    return YES;
}

-(IBAction)bookmarkAction:(id)sender{
    
    NSString *bookmarkTitle = [bookMarkSegmentedControl titleForSegmentAtIndex:bookMarkSegmentedControl.selectedSegmentIndex];
    NSLog(@"%@", bookmarkTitle);
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://www.%@.com",bookmarkTitle];
    [wkwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    urlTextField.text = urlString;
}

- (IBAction)refreshAction:(id)sender {
    [wkwebView reload];
}

- (IBAction)stopAction:(id)sender {
    [wkwebView stopLoading];
}

- (IBAction)forwardAction:(id)sender {
    [wkwebView goForward];
}

- (IBAction)backAction:(id)sender {
    [wkwebView goBack];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    [activityIndicatorView startAnimating];
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    [activityIndicatorView stopAnimating];
}



@end
