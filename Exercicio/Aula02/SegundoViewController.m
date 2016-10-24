//
//  SegundoViewController.m
//  Aula02
//
//  Created by Pedro Henrique on 03/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "SegundoViewController.h"

@interface SegundoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *outroLabel;

@end

@implementation SegundoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.outroLabel setText:self.valor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    self.valor = @"Outro valor";
}


@end
