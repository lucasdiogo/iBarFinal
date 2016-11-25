//
//  Endereco.m
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import "Endereco.h"



@implementation Endereco

-(instancetype)initWithPlacemark:(CLPlacemark *)location withTitle:(NSString *)title andWithSubtitle:(NSString *)subtitle {
    self = [super init];
    if(self){
        _placemark = location;
        _title = title;
        _subtitle = subtitle;
    }
    return self;
}
-(CLLocationCoordinate2D)coordinate {
    return [[_placemark location] coordinate];
}


@end
