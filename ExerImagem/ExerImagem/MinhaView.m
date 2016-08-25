//
//  MinhaView.m
//  ExerImagem
//
//  Created by ALUNO on 24/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "MinhaView.h"

@implementation MinhaView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        [self configurar];
    }
    return self;
}

- (void) configurar {
    [self setBackgroundColor:[UIColor yellowColor]];
}

- (void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath new];
    
    
    CGFloat meioHor = rect.size.width/2;
    CGFloat meioVer = rect.size.height/2;
    
    
    [path moveToPoint:CGPointMake(meioHor, 0)];
    [path addLineToPoint:CGPointMake(0, meioVer)];
    [path addLineToPoint:CGPointMake(meioHor,rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.size.width,meioVer)];
    [path closePath];
    
    [path moveToPoint:CGPointMake(meioHor-25, meioVer-25)];
    [path addLineToPoint:CGPointMake(meioVer,meioHor)];
    [path closePath];
    
    UIColor *verdeDoFelipe = [UIColor colorWithRed:10.0/255.0
                                             green:200.0/255.0
                                             blue:10.0/255.0
                                             alpha:1];
    
    UIColor *outraCor = [UIColor magentaColor];
    
    [verdeDoFelipe setFill];
    [outraCor setStroke];
    
    [path fill];
    [path stroke];
    
}

@end
