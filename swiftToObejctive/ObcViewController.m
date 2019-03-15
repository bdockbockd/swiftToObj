//
//  ObcViewController.m
//  swiftToObejctive
//
//  Created by B2B on 15/3/2562 BE.
//  Copyright © 2562 BB. All rights reserved.
//

#import "ObcViewController.h"
@interface ObcViewController ()
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation ObcViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textLabel.text = self.result;
//    NSInteger tap = []
//    UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
//    tap.numberOfTapsRequired = 2
//    view.addGestureRecognizer(tap);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
