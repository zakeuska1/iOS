//
//  ViewController1.m
//  Aula02
//
//  Created by Pedro Henrique on 03/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController1.h"

@interface ViewController1 ()

@property (weak, nonatomic) IBOutlet UILabel *labelNome;

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_nome) {
        [_labelNome setText:[NSString stringWithFormat:@"Palavra: %@", _nome]];
    }else {
        [_labelNome setText:@"Palavra: "];
    }
}

- (IBAction)unwindParaTrocarNome:(UIStoryboardSegue *)segue {
    NSLog(@"Segue: %@", segue);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
