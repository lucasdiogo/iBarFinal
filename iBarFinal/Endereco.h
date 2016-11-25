//
//  Endereco.h
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Endereco : NSObject <MKAnnotation>

-(nonnull instancetype) initWithPlacemark:(CLPlacemark *) location withTitle:(nonnull NSString *) title andWithSubtitle:(nonnull NSString *) subtitle;

@property (nullable, readonly) CLPlacemark * placemark;

@property (nonatomic, readonly, copy, nonnull) NSString *title;
@property (nonatomic, readonly, copy, nullable) NSString *subtitle;

@end
