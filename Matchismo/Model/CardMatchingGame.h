//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Henry Chan on 4/6/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"
@interface CardMatchingGame : NSObject

//designated initalizer, a required initalizer
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score; // read only means only a getter

@property (strong, nonatomic) NSString *flipDescription;

@property (nonatomic) int matchCountMode;


@end
