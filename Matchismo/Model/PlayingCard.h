//
//  PlayingCard.h
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
