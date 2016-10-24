//
//  Controller2.m
//  Exercicio
//
//  Created by ALUNO on 24/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController2.h"
#import "ViewController1.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Palavra"
                                                                message:@"Digite algo"
                                                         preferredStyle:UIAlertControllerStyleAlert];
    
    [ac addTextFieldWithConfigurationHandler: nil];
    [ac addAction:[UIAlertAction actionWithTitle:@"OK"
                                          style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction * _Nonnull action) {
                                            UITextField *tf = [ac.textFields firstObject];
                                            if (tf) {
                                                NSString *nome = tf.text;
                                                [self performSegueWithIdentifier:@"trocaNomeSegue" sender:nome];
                                            }
                                        }]];
    
    [self presentViewController:ac animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"trocaNomeSegue"]) {
        ViewController1 *destino = segue.destinationViewController;
        [destino setNome:sender];
    }
}


@end
