//
//  ViewController.m
//  DesafioAula4
//
//  Created by ALUNO on 23/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *plist;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSBundle *mb = [NSBundle mainBundle];
    NSString *path = [mb pathForResource:@"PropertyList" ofType:@"plist"];
    
    self.plist = [NSArray arrayWithContentsOfFile:path];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.plist.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
