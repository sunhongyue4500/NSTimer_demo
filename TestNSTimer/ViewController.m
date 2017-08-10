//
//  ViewController.m
//  TestNSTimer
//
//  Created by Sunhy on 2017/8/10.
//  Copyright © 2017年 Sunhy. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
#import "Person.h"

typedef NS_ENUM(NSUInteger, TestCase) {
    Case1 = 0,
    Case2
};

@interface ViewController ()

@property (nonatomic, weak) NSTimer *myTimer1;
@property (nonatomic, strong) NSTimer *myTimer2;

@property (nonatomic, assign) TestCase mycase;

@property (nonatomic, weak) Person *per;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mycase = Case2;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fireBtnAction:(id)sender {
    
    
    if (_mycase == Case1) {
        self.myTimer1 = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer:) userInfo:nil repeats:YES];
    } else if (_mycase == Case2) {
        self.myTimer2 = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(fireTimer:) userInfo:nil repeats:YES];
        
        
        if ([[NSThread currentThread] isEqual:[NSThread mainThread]]) {
            [[NSRunLoop currentRunLoop] addTimer:_myTimer2 forMode:NSDefaultRunLoopMode];
        }
//
    }
}

- (void)fireTimer:(NSTimer *)timer {
    NSLog(@"fire");
}

- (IBAction)pushBtnAction:(id)sender {
    if (_mycase == Case1) {
        [self.myTimer1 invalidate];
    } else if (_mycase == Case2) {
        [self.myTimer2 invalidate];
    }
    
    MyViewController *vc = [[MyViewController alloc] init];
    vc.view.frame = self.view.bounds;
    [self.navigationController pushViewController:vc animated:NO];
    
}

@end
