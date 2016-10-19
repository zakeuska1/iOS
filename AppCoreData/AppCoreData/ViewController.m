//
//  ViewController.m
//  AppCoreData
//
//  Created by ALUNO on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Produto+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self incluirProduto];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)incluirProduto{
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    Produto *produto = [NSEntityDescription insertNewObjectForEntityForName:@"Produto" inManagedObjectContext:context];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/mm/yyyy"];
    
    NSDate *data = [formatter dateFromString:@"20/02/2025"];
    
    
    [produto setNome:@"Escova de Dentes"];
    [produto setMarca:@"Colgate"];
    [produto setValidade:data];
    [produto setPreco:3.00];
    
    NSError *erroCoreData;
    
    if (![context save:&erroCoreData]){
        NSLog(@"\n\n\n\nDeu erro! %@\n\n\n\n", erroCoreData);
    }else{
        NSLog(@"\n\n\n\n\nProduto incluido com sucesso!\n\n\n\n\n\n");
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSFetchRequest *fr = [NSFetchRequest fetchRequestWithEntityName:@"Produto"];
    
    [fr setPredicate:[NSPredicate predicateWithFormat:@"nome == [cd] %@", @"Escova de Dentes"]];
    
    [fr setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"validade" ascending:YES]]];
    
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    NSError *erroFetch;
    NSArray *resultado = [context executeFetchRequest:fr error:&erroFetch];
    
    if(!erroFetch){
        NSLog(@"\n\n\n\nResultado: %@\n\n\n\n\n",resultado);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
