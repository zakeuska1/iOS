//
//  TabelaViewController.m
//  DesafioAula4
//
//  Created by ALUNO on 23/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TabelaViewController.h"
#import "PrimeiraViewController.h"

@interface TabelaViewController ()

@property (strong, nonatomic) NSArray<NSString *> *nomes;
@property (strong, nonatomic) NSArray *plist;
@property (strong, nonatomic) NSString *texto;

@end

@implementation TabelaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *mb = [NSBundle mainBundle];
    NSString *path = [mb pathForResource:@"PropertyList" ofType:@"plist"];
    
    self.plist = [NSArray arrayWithContentsOfFile:path];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.plist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xpto" forIndexPath:indexPath];
    
    NSString *nome = [self.plist objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:nome];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.texto = [self.plist objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"primeiraParaSegundaSegue" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"primeiraParaSegundaSegue"]) {
        
        NSString *valor = self.texto;
        PrimeiraViewController *destino = segue.destinationViewController;
        
        [destino setValor:valor];
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
