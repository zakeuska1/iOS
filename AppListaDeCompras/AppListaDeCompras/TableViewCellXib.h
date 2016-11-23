//
//  TableViewCellXib.h
//  AppListaDeCompras
//
//  Created by ALUNO on 23/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellXib : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imagem;
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *marca;
@property (weak, nonatomic) IBOutlet UILabel *quantidade;

@end
