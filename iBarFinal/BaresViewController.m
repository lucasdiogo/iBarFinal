//
//  BaresViewController.m
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import "BaresViewController.h"
#import "Bar+CoreDataClass.h"
#import "UIViewController+CoreData.h"
#import "Endereco.h"

@import MapKit;


@interface BaresViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nomeBar;
@property (weak, nonatomic) IBOutlet UITextView *descricaoBar;
@property (weak, nonatomic) IBOutlet UITextField *enderecoBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapaBar;
@property NSString * uuidBar;
@property NSString * cardapioBar;

@property CLGeocoder * geocoder;

@property NSMutableArray<Endereco *> * endereco;
@property NSMutableArray<MKPointAnnotation *> * points;
@property MKPolyline * line;



@end

@implementation BaresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.bar){
        _nomeBar.text = self.bar.nome;
        _descricaoBar.text = self.bar.descricao;
        _enderecoBar.text = self.bar.endereco;
        _uuidBar = self.bar.uuid;
        _cardapioBar = self.bar.cardapio;
        
    }
    
    _endereco = [NSMutableArray new];
    _points = [NSMutableArray new];
    
    self.geocoder = [[CLGeocoder alloc] init];
    
    [_mapaBar setUserTrackingMode:MKUserTrackingModeFollow];
    // Do any additional setup after loading the view.
}

- (IBAction)gecode:(id)sender {
    [_mapaBar removeAnnotations:_endereco];
    [_endereco removeAllObjects];
    
    [self.geocoder geocodeAddressString:_enderecoBar.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if(error){
            NSLog(@"%@", error);
            return;
        }
        
        [placemarks enumerateObjectsUsingBlock:^(CLPlacemark * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            Endereco * addr = [[Endereco alloc] initWithPlacemark:obj withTitle:_enderecoBar.text andWithSubtitle:[NSString stringWithFormat:@"%lu",(unsigned long)idx]];
            
            [_endereco addObject:addr];
            [self.mapaBar addAnnotation:addr];
            
        }];
        
    }];
}

- (IBAction)salvar:(id)sender {
    
    
    if(_nomeBar.text.length) {
        if(!self.bar) {
            
            self.bar = [NSEntityDescription insertNewObjectForEntityForName:@"Bar" inManagedObjectContext:self.managedObjectContext];
            
        }
        
        self.bar.nome = _nomeBar.text;
        self.bar.descricao = _descricaoBar.text;
        self.bar.endereco = _enderecoBar.text;
        self.bar.cardapio = @"1" ;
        
        CFUUIDRef cfuuid = CFUUIDCreate(kCFAllocatorDefault);
        self.bar.uuid = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, cfuuid));
        
        
        [self performSegueWithIdentifier:@"unwindToMaster" sender:sender];
        
    } else {
        // TODO - UIAlertController
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - MKMapViewDelegate

- (nullable MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if([annotation isKindOfClass:[Endereco class]]){
        MKPinAnnotationView * view = [[MKPinAnnotationView alloc ] initWithAnnotation:annotation reuseIdentifier:@"Endereco"];
        [view setEnabled:YES];
        [view setAnimatesDrop:YES];
        [view setPinTintColor:[UIColor blueColor]];
        [view setRightCalloutAccessoryView:[UIButton buttonWithType:UIButtonTypeInfoLight]];
        [view setCanShowCallout:YES];
        
        return view;
    }
    
    return nil;
    
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    MKPointAnnotation * point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    [_points addObject:point];
    
    // if(_line){
    [mapView removeOverlay:_line];
    // }
    
    CLLocationCoordinate2D * coords = malloc([_points count] * sizeof(CLLocationCoordinate2D));
    
    for (int i = 0; i < [_points count]; i++) {
        coords[i] = _points[i].coordinate;
    }
    
    _line = [MKPolyline polylineWithCoordinates:coords count:[_points count]];
    
    free(coords);
    
    [mapView addOverlay:_line];
    
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    if([overlay isKindOfClass:[MKPolyline class]]) {
        MKPolylineRenderer * renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
        [renderer setLineWidth:2];
        [renderer setStrokeColor:[UIColor greenColor]];
        
        return renderer;
    }
    
    return nil;
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
