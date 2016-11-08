//
//  TableViewCell.h
//  AppListaDeCompras
//
//  Created by ALUNO on 08/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *marca;
@property (weak, nonatomic) IBOutlet UILabel *quantidade;

@end
