//
//  TableViewController.m
//  AppListaDeCompras
//
//  Created by ALUNO on 08/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TableViewController.h"
#import "Produto+CoreDataClass.h"
#import "TableViewCell.h"
#import "CadViewController.h"
#import "AppDelegate.h"


@interface TableViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Novo"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(incluirProduto:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSError *erro;
    if (![self.fetchedResultsController performFetch:&erro]) {
        NSLog(@"Erro ao recuperar produtos: %@", erro);
    }
    else {
        [self.tableView reloadData];
    }
}

- (IBAction) incluirProduto:(id) sender {
    [self performSegueWithIdentifier:@"SegueInsert" sender:self];
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (!_fetchedResultsController) {
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSPersistentContainer *container = delegate.persistentContainer;
        
        NSFetchRequest *fetchRequest = [Produto fetchRequest];
        [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"nome" ascending:YES]]];
        
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:container.viewContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
        [_fetchedResultsController setDelegate:self];
    }
    
    return _fetchedResultsController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"celula"];
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"celula" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    [self configurarCelula:cell noIndexPath:indexPath];
    
    return cell;
}

- (void) configurarCelula: (TableViewCell *) cell noIndexPath: (NSIndexPath *) indexPath {
    Produto *produto = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    [cell.nome setText:produto.nome];
    [cell.marca setText:produto.marca];
    [cell.quantidade setText:produto.quantidade];
}


#pragma mark - UITableViewDelegate
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Produto *produto = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [self.fetchedResultsController.managedObjectContext deleteObject:produto];
        
        NSError *erroCoreData;
        if (![self.fetchedResultsController.managedObjectContext save:&erroCoreData]) {
            NSLog(@"Erro ao editar o Produto: %@", erroCoreData);
        }
    }
}

#pragma mark - NSFetchedResultsControllerDelegate
- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex
     forChangeType:(NSFetchedResultsChangeType)type {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        default:
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            if (newIndexPath) {
                [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            break;
        case NSFetchedResultsChangeDelete:
            if (indexPath) {
                [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            }
            break;
        case NSFetchedResultsChangeUpdate:
            [self configurarCelula:[self.tableView cellForRowAtIndexPath:indexPath] noIndexPath:indexPath];
            break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
            
        default:
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


#pragma mark - EDIÇÃO DE CÉLULA
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"SegueUpdate"]) {
        Produto *produtoSelecionado = [self.fetchedResultsController objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        
        CadViewController *destino = segue.destinationViewController;
        [destino setProduto:produtoSelecionado];
    }
}

@end
