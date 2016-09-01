//
//  ViewControllerCustomizada.m
//  appOrcamento
//
//  Created by ALUNO on 31/08/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "ViewControllerCustomizada.h"
#import "ViewCustomizada.h"
#import "ViewCirculo.h"
#import "ViewPentagono.h"



@interface ViewControllerCustomizada ()

@end

@implementation ViewControllerCustomizada

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    //    MinhaView *mv = [[MinhaView alloc] initWithFrame:CGRectMake(20, 20, 250, 250)];
    //    [self.view addSubview:mv];
    //
    //    ViewDeTexto *vt = [[ViewDeTexto alloc] initWithFrame:CGRectMake(30, 30, 200, 200)];
    //    [self.view addSubview:vt];
    
    
    //    ViewDeImagem *vi = [[ViewDeImagem alloc] initWithFrame:CGRectMake(100, 100, 150, 150)];
    //    [self.view addSubview:vi];
    
    //    ViewClip *clip = [[ViewClip alloc] initWithFrame:CGRectMake(30, 30, 250, 250)];
    //    [self.view addSubview:clip];
    
    
    ViewCustomizada *estrela = [[ViewCustomizada alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    [self.view addSubview: estrela];
    
    ViewCirculo *circulo = [[ViewCirculo alloc] initWithFrame:CGRectMake(0, 251, 150, 150)];
    [self.view addSubview: circulo];
    
    ViewPentagono *pentagono = [[ViewPentagono alloc] initWithFrame:CGRectMake(0, 402, 250, 250)];
    [self.view addSubview: pentagono];
    
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
