//
//  TableViewCell.m
//  FaceApp
//
//  Created by ALUNO on 26/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *post;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.post.layer setBorderColor:[[UIColor colorWithWhite:0.3 alpha:1] CGColor]];
    [self.post setBackgroundColor: [UIColor whiteColor]];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
