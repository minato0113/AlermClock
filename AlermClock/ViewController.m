//
//  ViewController.m
//  AlermClock
//
//  Created by TAICHI on 2014/09/02.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    f=0;
    minutesEndLabel.text=[NSString stringWithFormat:@"%d",number/60];
    secondEndLabel.text=[NSString stringWithFormat:@"%d",number%60];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)start:(id)sender{
    if(![timer isValid]){
        timer=[NSTimer scheduledTimerWithTimeInterval:1
                                               target:self
                                             selector:@selector(ringAlerm)
                                             userInfo:nil
                                              repeats:YES];
        [timer fire];
    }
    timer=[NSTimer scheduledTimerWithTimeInterval:5400
                                           target:self
                                         selector:@selector(checkLem)
                                         userInfo:nil
                                          repeats:YES];
    [timer fire];
    
    timer=[NSTimer scheduledTimerWithTimeInterval:5400
                                           target:self
                                         selector:@selector(checkLem2)
                                         userInfo:nil
                                          repeats:YES];
    [timer fire];
}

-(void)checkAlerm{
}
-(void)checkLem{
    
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"H:m"];
    NSString *dateString = [formatter stringFromDate:now];
    int zikan = [time1TextFieid.text intValue];
    int H_val = [dateString intValue];
    NSLog(@"あああ%d",zikan);
    NSLog(@"ううう%d",H_val);
    NSLog(@"いいい%@",dateString);
    
    //
    NSDate *fnow = [NSDate new];
    
    // NSDateFormatterを使ってNSDate型を文字列に変換
    NSDateFormatter *fformatter = [NSDateFormatter new];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    formatter.dateFormat = @"yyyy/MM/dd HH:mm:ss";
    NSString *formattedString1 = [formatter stringFromDate:now];
    
    // NSCalendarとNSDateComponentsを使ってNSDate型を整数に変換
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSUInteger flags = NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute;
    NSDateComponents *components = [gregorian components:flags fromDate:now];
    
    int hour = components.hour;
    NSLog(@"%d",hour);
    
    NSString *formattedString2 = [NSString stringWithFormat:@"%02d月%02d日 %02d時%02d分", (int)components.month, (int)components.day, (int)components.hour, (int)components.minute];
    
    
    
    //    NSComparisonResult result = [date compare:];
    //    switch(result) {
    //        case NSOrderedSame: // 一致したとき
    //            NSLog(@"同じ日付です");
    //            break;
    //
    //        case NSOrderedAscending: // date1が小さいとき
    //            NSLog(@"異なる日付です（date1のが小）");
    //            break;
    //
    //        case NSOrderedDescending: // date1が大きいとき
    //            NSLog(@"異なる日付です（date1のが大）");
    //            break;
    //
}
-(void)checkLem2{
    NSDate *now = [NSDate date] ;
    NSString *date_converted;
    NSDate* date_source =[NSDate date];
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"H:m"];
    date_converted = [formatter stringFromDate:date_source];
    if (date_converted<time2TextFieid) {
        f=2;
    }
    //    NSComparisonResult result = [date_converted compare:date_converted];
    //        switch(result) {
    //        case NSOrderedSame: // 一致したとき
    //            NSLog(@"同じ日付です");
    //            break;
    //
    //        case NSOrderedAscending: // date1が小さいとき
    //            NSLog(@"異なる日付です（date1のが小）");
    //            break;
    //
    //        case NSOrderedDescending: // date1が大きいとき
    //            NSLog(@"異なる日付です（date1のが大）");
    //            break;
    //    }
}
-(void)ringAlerm{
    if(f==1){
        NSString * path = [[NSBundle mainBundle]pathForResource:@"wind_sound"ofType:@"wav"];
        NSURL * url = [NSURL fileURLWithPath:path] ;
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        [audio play];
    }
}





@end
