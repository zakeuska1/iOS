//
//  TableViewController.m
//  AppListaDeCompras
//
//  Created by ALUNO on 08/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TableViewController.h"
#import "Produto+CoreDataClass.h"
#import "TableViewCellXib.h"
#import "CadViewController.h"
#import "AppDelegate.h"
#import "UnidadeMedida.h"


@interface TableViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSMutableData *bytesResposta;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _bytesResposta = [NSMutableData new];
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCellXib" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CelulaProduto"];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithTitle:@"Novo"
                                                                  style:UIBarButtonItemStyleDone
                                                                 target:self
                                                                 action:@selector(incluirProduto:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSURLSessionConfiguration *sc = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sc
                                                          delegate:self
                                                     delegateQueue:nil];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL: [NSURL URLWithString:@"http://jsonplaceholder.typicode.com/posts"]];
    
    [task resume];
}


#pragma mark - NSURLSessionDelegate
- (void)URLSession:(NSURLSession *)session
          dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data {
    
    [_bytesResposta appendData:data];
}


- (void)URLSession:(NSURLSession *)session
              task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error{
    
    if (error) {
        NSLog(@"Erro de conexão: %@", error);
    }else {
        NSError *erroJSON;
        
        NSArray<NSDictionary *> *posts =
        [NSJSONSerialization JSONObjectWithData:_bytesResposta
                                        options:kNilOptions
                                          error:&erroJSON];
        
        if (erroJSON) {
            NSLog(@"JSON recebido é inválido: %@", erroJSON);
        }else {
            NSLog(@"Dados recebidos: %@", posts);
            
            for (NSDictionary *post in posts) {
                NSLog(@"Post: %@", [post objectForKey:@"title"]);
            }
            
        }
    }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"SegueUpdate" sender:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCellXib *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaProduto" forIndexPath:indexPath];
    
    [self configurarCelula:cell noIndexPath:indexPath];
    return cell;
}

- (void) configurarCelula: (TableViewCellXib *) cell noIndexPath: (NSIndexPath *) indexPath {
    Produto *produto = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    UnidadeMedida unidade = produto.unidMed.integerValue;
    NSString *strUnidade;
    
    if (unidade == Quilograma) {
        strUnidade = @" Kg";
    } else if (unidade == Grama){
        strUnidade = @" Gr";
    } else if (unidade == Unidade){
        strUnidade = @" Unid";
    } else if (unidade == Litro){
        strUnidade = @" L";
    } else if (unidade == Mililitro){
        strUnidade = @" Ml";
    }
    
    NSString *str = [produto.quantidade stringValue];
    
    str = [str stringByAppendingString:strUnidade];
    
    UIImage *foto = [UIImage imageWithData:produto.foto];
    [cell.imagem setImage:foto];
    [cell.nome setText:produto.nome];
    [cell.marca setText:produto.marca];
    [cell.quantidade setText:str];
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
