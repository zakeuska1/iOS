//
//  ViewController.m
//  DesafioAula4
//
//  Created by ALUNO on 23/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *mb = [NSBundle mainBundle];
    NSString *path = [mb pathForResource:@"exemplo" ofType:@"plist"];
    
    NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //Se a raíz fosse um array
    //    NSArray *plist2 = [NSArray arrayWithContentsOfFile:path];
    
    
    [plist writeToFile:path atomically:YES];
    
    
    NSString *pasta =
    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                         NSUserDomainMask,
                                         YES) firstObject];
    
    NSString *arquivo = [pasta stringByAppendingPathComponent:@"arquivo"];
    arquivo = [arquivo stringByAppendingPathExtension:@"plist"];
    
    [@[@2,@3] writeToFile:arquivo atomically:YES];
    
    
    [[NSFileManager defaultManager] createFileAtPath:arquivo contents:nil attributes:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
