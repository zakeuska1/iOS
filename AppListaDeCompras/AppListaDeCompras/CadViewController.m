//
//  CadViewController.m
//  AppListaDeCompras
//
//  Created by ALUNO on 08/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "CadViewController.h"
#import "AppDelegate.h"
#import "Produto+CoreDataClass.h"
#import "UnidadeMedida.h"

@import MobileCoreServices;
@import MediaPlayer;
@import Photos;

@interface CadViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nome;
@property (weak, nonatomic) IBOutlet UITextField *marca;
@property (weak, nonatomic) IBOutlet UITextField *quantidade;
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unidMed;

@end

@implementation CadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *onTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onEscolherFoto)];
    
    onTap.numberOfTapsRequired = 1;
    [self.imagem setUserInteractionEnabled:YES];
    [self.imagem addGestureRecognizer:onTap];
    
    if (self.produto) {
        [self.imagem setImage:[UIImage imageWithData:[self.produto valueForKey:@"foto"]]];
        [self.nome setText:[self.produto valueForKey:@"nome"]];
        [self.marca setText:[self.produto valueForKey:@"marca"]];
        [self.quantidade setText:[self.produto.quantidade stringValue]];
        [self.unidMed setSelectedSegmentIndex:self.produto.unidMed.integerValue];
    }
    
    [self.quantidade setDelegate:self];
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // allow backspace
    if (!string.length)
    {
        return YES;
    }
    
    // Prevent invalid character input, if keyboard is numberpad
    if (textField.keyboardType == UIKeyboardTypeNumberPad)
    {
        if ([string rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet].invertedSet].location != NSNotFound)
        {
            // BasicAlert(@"", @"This field accepts only numeric entries.");
            return NO;
        }
    }
    
    // verify max length has not been exceeded
    NSString *proposedText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (proposedText.length > 4) // 4 was chosen for SSN verification
    {
        // suppress the max length message only when the user is typing
        // easy: pasted data has a length greater than 1; who copy/pastes one character?
        if (string.length > 1)
        {
            // BasicAlert(@"", @"This field accepts a maximum of 4 characters.");
        }
        
        return NO;
    }
    
    return YES;
}


- (IBAction)salvar:(id)sender {
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    NSString *texto = self.quantidade.text;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterNoStyle];
    
    NSNumber *qtd = [formatter numberFromString:texto];
    
    UnidadeMedida unidade = self.unidMed.selectedSegmentIndex;

    
    if (self.produto) {
        [self.produto setFoto:UIImagePNGRepresentation(self.imagem.image)];
        [self.produto setNome:self.nome.text];
        [self.produto setMarca:self.marca.text];
        [self.produto setQuantidade:qtd];
        [self.produto setUnidMed:[NSNumber numberWithInteger:unidade]];
        
    }
    else {
        Produto *novoProduto = [NSEntityDescription insertNewObjectForEntityForName:@"Produto" inManagedObjectContext:context];
        [novoProduto setFoto:UIImagePNGRepresentation(self.imagem.image)];
        [novoProduto setNome:self.nome.text];
        [novoProduto setMarca:self.marca.text];
        [novoProduto setQuantidade:qtd];
        [novoProduto setUnidMed:[NSNumber numberWithInteger:self.unidMed.selectedSegmentIndex]];
    }
    
    NSError *erroCoreData;
    if (![context save:&erroCoreData]) {
        NSLog(@"\n\n\nErro ao salvar o Produto! %@\n\n\n", erroCoreData);
    }
    else {
        NSLog(@"\n\n\nProduto salvo com sucesso!\n\n\n");
    }
    
    [self esconder];
    

}
- (IBAction)cancelar:(id)sender {
    [self esconder];
}

- (void) esconder {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)onEscolherFoto{
    __weak typeof(self) weakSelf = self;
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Adicionar Imagem"
                                                                             message:@"De onde deseja buscar a Imagem?"
                                                                      preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *galeria = [UIAlertAction actionWithTitle:@"Galeria do Smartphone"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * act) {
                                                        UIImagePickerController *picker = [UIImagePickerController new];
                                                        [picker setDelegate:weakSelf];
                                                        [picker setAllowsEditing:YES];
                                                        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
                                                             
                                                        [picker setMediaTypes:[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary]];
                                                             
                                                        [weakSelf presentViewController:picker animated:YES completion:nil];
                                                    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"Câmera do Smartphone"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * act) {
                                                       if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                                                              UIImagePickerController *picker = [UIImagePickerController new];
                                                              [picker setDelegate:weakSelf];
                                                              [picker setAllowsEditing:YES];
                                                              [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
                                                              [picker setShowsCameraControls:YES];
                                                              [picker setMediaTypes:@[((NSString *) kUTTypeImage)]];
                                                              
                                                              [weakSelf presentViewController:picker animated:YES completion:nil];
                                                              
                                                       } else {
                                                           UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"Use um iPhone"
                                                                                                                            message:@"É necessário um dispositivo físico que possua câmera."
                                                                                                                              preferredStyle:UIAlertControllerStyleAlert];
                                                           [alertController2 addAction:[UIAlertAction actionWithTitle:@"OK"
                                                                                                                style:UIAlertActionStyleCancel
                                                                                                              handler:nil]];
                                                           [weakSelf presentViewController:alertController2 animated:YES completion:nil];
                                                          }
                                                      }];
    
    UIAlertAction *cancelar = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:galeria];
    [alertController addAction:camera];
    [alertController addAction:cancelar];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *imagemEscolhida = info[UIImagePickerControllerEditedImage];
    NSData *bytesDaImagem = UIImagePNGRepresentation(imagemEscolhida);
    [self.imagem setImage:[UIImage imageWithData:bytesDaImagem]];
    
    [picker dismissViewControllerAnimated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"Cancelado pelo Usuário");
    [picker dismissViewControllerAnimated:YES completion:nil];
    
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
