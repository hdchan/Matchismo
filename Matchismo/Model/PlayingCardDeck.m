//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Henry Chan on 4/6/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init { // when we do an alloc "init" this is it!
    // id means pointer to object of ANY class
    
    self = [super init]; // this is the only place we're going to set self
    // this lets our super class call its init
    
    if (self) { // if not set to nil then we'll run the following code
       
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank];rank++) {
                PlayingCard *card = [[PlayingCard alloc] init]; // creating a card here
                card.rank = rank; // then we're setting the ranks
                card.suit = suit; // and the suit
                [self addCard:card atTop:YES];
            }
        }
    }
    
    return self;
    
}

@end
