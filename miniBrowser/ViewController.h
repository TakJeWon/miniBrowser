//
//  ViewController.h
//  miniBrowser
//
//  Created by 탁제원 on 2022/01/17.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *bookMarkSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (weak, nonatomic) IBOutlet WKWebView *wkwebView;

- (IBAction)bookmarkAction:(id)sender;

- (IBAction)backAction:(id)sender;
- (IBAction)forwardAction:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)refreshAction:(id)sender;


@end

