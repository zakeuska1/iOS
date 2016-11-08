//
//  CadViewController.m
//  AppListaDeCompras
//
//  Created by ALUNO on 08/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "CadViewController.h"
#import "AppDelegate.h"

@interface CadViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *marca;
@property (weak, nonatomic) IBOutlet UITextField *quantidade;

@end

@implementation CadViewController

- (void)viewDidLoad {
    
    if (self.produto) {
        [self.nome setText:[self.produto valueForKey:@"nome"]];
        [self.marca setText:[self.produto valueForKey:@"marca"]];
        [self.quantidade setText:[self.produto valueForKey:@"quantidade"]];
    }
}
- (IBAction)salvar:(id)sender {
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    if (self.produto) {
        [self.produto setNome:self.nome.text];
        [self.produto setMarca:self.marca.text];
        [self.produto setQuantidade:self.quantidade.text];
        
    }
    else {
        Produto *novoProduto = [NSEntityDescription insertNewObjectForEntityForName:@"Produto" inManagedObjectContext:context];
        [novoProduto setNome:self.nome.text];
        [novoProduto setMarca:self.marca.text];
        [novoProduto setQuantidade:self.quantidade.text];
    }
    
    NSError *erroCoreData;
    if (![context save:&erroCoreData]) {
        NSLog(@"\n\n\nErro ao salvar o Produto! %@\n\n\n", erroCoreData);
    }
    else {
        NSLog(@"\n\n\nProduto salvo com sucesso!\n\n\n");
    }
    
    [self.navigationController popViewControllerAnimated:YES];

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
