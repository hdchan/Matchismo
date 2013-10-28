//
//  SetCard.h
//  Matchismo
//
//  Created by The Doctor's Channel on 10/28/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

@interface SetCard : Card

@property (strong, nonatomic) NSString *shape;
@property (nonatomic) NSUInteger count;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic, getter = isFilled) BOOL filled;

+(NSArray *)validShapes;
+(NSArray *)validColors;
+(NSUInteger)maxCount;

@end
