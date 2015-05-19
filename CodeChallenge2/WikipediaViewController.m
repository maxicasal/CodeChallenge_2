
#import "WikipediaViewController.h"

@interface WikipediaViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property NSString *actualURL;
@end

@implementation WikipediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.actualURL = self.urlRequested;
    [self loadURLString: self.urlRequested];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) loadURLString: (NSString *) urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
}


@end

