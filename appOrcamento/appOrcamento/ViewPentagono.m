//
//  ViewPentagono.m
//  appOrcamento
//
//  Created by ALUNO on 31/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewPentagono.h"

@implementation ViewPentagono

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        [self configurar];
    }
    return self;
}

- (void) configurar {
    [self setBackgroundColor:[UIColor whiteColor]];
}

- (void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath new];
    
    
    CGFloat meioHor = rect.size.width/2;
    CGFloat meioVer = rect.size.height/2;
    CGFloat tercoBot = rect.size.width/4;
    
    [path moveToPoint:CGPointMake(meioHor, 0)];
    [path addLineToPoint:CGPointMake(0, meioVer-30)];
    [path addLineToPoint:CGPointMake(tercoBot-20,rect.size.height)];
    [path addLineToPoint:CGPointMake((tercoBot*3)+20,rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.size.width,meioVer-30)];
    [path closePath];
    
    
//    [path moveToPoint:CGPointMake(meioHor, 0)];
//    [path addLineToPoint:CGPointMake(0, meioVer)];
//    [path addLineToPoint:CGPointMake(tercoBot,rect.size.height)];
//    [path addLineToPoint:CGPointMake((tercoBot*3),rect.size.height)];
//    [path addLineToPoint:CGPointMake(rect.size.width,meioVer)];
//    [path closePath];
    
    
    UIColor *verdeDoFelipe = [UIColor colorWithRed:10.0/255.0
                                             green:200.0/255.0
                                              blue:10.0/255.0
                                             alpha:1];
    
    UIColor *outraCor = [UIColor magentaColor];
    
    [verdeDoFelipe setFill];
    [outraCor setStroke];
    
    [path setLineWidth:3];
    [path fill];
    [path stroke];
    
    
}


@end
