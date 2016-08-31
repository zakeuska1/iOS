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
    CGFloat tercoBot = rect.size.width/4;
    
    //Estrela
    [path moveToPoint:CGPointMake(meioHor, 0)];
    [path addLineToPoint:CGPointMake(meioHor-30,meioVer-30)];
    [path addLineToPoint:CGPointMake(0, meioVer-30)];
    [path addLineToPoint:CGPointMake(rect.size.width-175, meioVer+30)];
    [path addLineToPoint:CGPointMake(tercoBot-20,rect.size.height)];
    [path addLineToPoint:CGPointMake(meioHor, rect.size.height-55)];
    [path addLineToPoint:CGPointMake((tercoBot*3)+20,rect.size.height)];
    [path addLineToPoint:CGPointMake(rect.size.width-75, meioVer+30)];
    [path addLineToPoint:CGPointMake(rect.size.width,meioVer-30)];
    [path addLineToPoint:CGPointMake(meioHor+30,meioVer-30)];
    [path closePath];
    
    //Pentágono Maior
//    [path moveToPoint:CGPointMake(meioHor, 0)];
//    [path addLineToPoint:CGPointMake(0, meioVer-30)];
//    [path addLineToPoint:CGPointMake(tercoBot-20,rect.size.height)];
//    [path addLineToPoint:CGPointMake((tercoBot*3)+20,rect.size.height)];
//    [path addLineToPoint:CGPointMake(rect.size.width,meioVer-30)];
//    [path closePath];
    
    //Pentágono Menor
//    [path moveToPoint:CGPointMake(meioHor-30,meioVer-30)];
//    [path addLineToPoint:CGPointMake(rect.size.width-175, meioVer+30)];
//    [path addLineToPoint:CGPointMake(meioHor, rect.size.height-55)];
//    [path addLineToPoint:CGPointMake(rect.size.width-75, meioVer+30)];
//    [path addLineToPoint:CGPointMake(meioHor+30,meioVer-30)];
//    [path closePath];
    
    UIColor *verdeDoFelipe = [UIColor colorWithRed:10.0/255.0
                                             green:200.0/255.0
                                             blue:10.0/255.0
                                             alpha:1];
    
    UIColor *outraCor = [UIColor magentaColor];
    
    [verdeDoFelipe setFill];
    [outraCor setStroke];
    
    [path fill];
    [path stroke];
    
    
    CGRect frame = CGRectMake(meioHor-55,meioVer-20, 200, 20);
    UILabel *nome = [[UILabel alloc] initWithFrame:frame];
    nome.text = @"Zacarias Junior";
    nome.textColor = [UIColor whiteColor];
    [nome setFont:[UIFont fontWithName:@"Arial-BoldMT" size:16]];
    [self addSubview:nome];
    
    //usando UIImageView
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"images4.jpg"] ];
//    imageView.frame = CGRectMake(100,130, 50, 50);
//    [self addSubview:imageView];
    
    //usando UIImage
    UIImage *imageObject = [UIImage imageNamed:@"images4"];
    [imageObject drawInRect:CGRectMake(100,130, 50, 50)];

    
}

@end
