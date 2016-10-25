//
//  AddOrcamentoViewController.m
//  ExerFinal
//
//  Created by ALUNO on 25/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "AddOrcamentoViewController.h"
#import "AppDelegate.h"
#import "Orcamento+CoreDataClass.h"

@interface AddOrcamentoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtNome;

@end

@implementation AddOrcamentoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)incluirOrcamento:(id)sender {

    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    NSPersistentContainer *container = delegate.persistentContainer;
    NSManagedObjectContext *context = container.viewContext;
    
    Orcamento *orcamento = [NSEntityDescription insertNewObjectForEntityForName:@"Orcamento" inManagedObjectContext:context];
    
    
    [orcamento setNome:self.txtNome];
    
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
