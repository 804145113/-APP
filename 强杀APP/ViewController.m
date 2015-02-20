//
//  ViewController.m
//  强杀APP
//
//  Created by 唐先海 on 15/2/20.
//  Copyright (c) 2015年 唐先海. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (IBAction)selectMode:(NSMatrix *)sender {
    switch (sender.selectedRow) {
        case 0:
            // normal
            model = -15;
            break;
        case 1:
            // !normal
            model = -9;
            break;
        default:
            break;
    }
}

- (IBAction)killAllApp:(id)sender {
    NSWorkspace * ws = [NSWorkspace sharedWorkspace];
    NSArray * appsPids = [ws launchedApplications];
    for(NSDictionary * processInformation in appsPids)
    {
        NSString * appName = [processInformation objectForKey:@"NSApplicationName"];
        NSString * appIdentifier = [processInformation objectForKey:@"NSApplicationProcessIdentifier"];
        
        if (![appName isEqualToString:@"Xcode"] && ![appName isEqualToString:@"Finder"] && ![appName isEqualToString:@"强杀APP"]) {
            NSString *consie = [NSString stringWithFormat:@"kill %ld %@",model,appIdentifier];
            const char *con = [consie cStringUsingEncoding:NSASCIIStringEncoding];
            system(con);
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    model = -15;
    // Do any additional setup after loading the view.
    [self viewInit];
}

- (void)viewInit {
    NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setImage:[NSImage imageNamed:@"app"]];
    [statusItem setToolTip:@"强杀APP"];
    [statusItem setHighlightMode:YES];
}
@end
