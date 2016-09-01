//
//  ViewCirculo.m
//  appOrcamento
//
//  Created by ALUNO on 31/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewCirculo.h"

@implementation ViewCirculo

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configurar];
    }
    return self;
}

- (void) configurar {
    [self setBackgroundColor:[UIColor whiteColor]];
}


- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *oval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 60, 60)];
    
    UIColor *verdeDoFelipe = [UIColor colorWithRed:10.0/255.0
                                             green:200.0/255.0
                                              blue:10.0/255.0
                                             alpha:1];
    
    [verdeDoFelipe setFill];
    [[UIColor magentaColor] setStroke];
    [oval setLineWidth:3];
    [oval fill];
    [oval stroke];
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



@end
