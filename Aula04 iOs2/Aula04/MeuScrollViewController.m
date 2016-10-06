//
//  MeuScrollViewController.m
//  Aula04
//
//  Created by ALUNO on 05/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "MeuScrollViewController.h"

@interface MeuScrollViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation MeuScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    __weak typeof(self) weakself = self;
    
    dispatch_queue_t fila = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(fila, ^{
        NSURL *url = [NSURL URLWithString:@"https://mamempreendimentos.files.wordpress.com/2015/09/italia1.jpg"];
        NSData *bytes = [NSData dataWithContentsOfURL:url];
        
        UIImage *imagem = [UIImage imageWithData:bytes];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImageView *iv = [[UIImageView alloc] initWithImage:imagem];
            [iv sizeToFit];
            [weakself.scrollView setContentSize:imagem.size];
            [weakself.scrollView addSubview:iv];
            
            [weakself setTitle:@"Norma Dean"];
        });
    });
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
