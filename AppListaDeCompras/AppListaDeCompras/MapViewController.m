//
//  MapViewController.m
//  AppListaDeCompras
//
//  Created by ALUNO on 07/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<MKMapViewDelegate>{
    __weak IBOutlet MKMapView *mapa;
    CLLocationManager *localizacao;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mapa.showsUserLocation = YES;
    mapa.showsBuildings = YES;
    
    localizacao = [CLLocationManager new];
    
    if([localizacao respondsToSelector:@selector(requestWhenInUseAuthorization)]){
        [localizacao requestWhenInUseAuthorization];
    }
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
