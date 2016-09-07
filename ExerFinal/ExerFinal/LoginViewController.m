//
//  LoginViewController.m
//  ExerFinal
//
//  Created by ALUNO on 06/09/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "LoginViewController.h"
#import "TableViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usuario;
@property (weak, nonatomic) IBOutlet UITextField *senha;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)validarLogin : (UIButton *)sender{
    
    if ([self.usuario.text isEqualToString: @"zacarias"] && [self.senha.text isEqualToString: @"junior"]){
        [self performSegueWithIdentifier:@"PrimeiraParaSegunda" sender:nil];
    } else {
        UIAlertController *msgFalha = [UIAlertController alertControllerWithTitle:@"Falha ao logar" message:@"Usuário ou senha Incorreto" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [msgFalha addAction:ok];
        
        [self presentViewController:msgFalha animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
