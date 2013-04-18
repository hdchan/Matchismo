//
//  Deck.m
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; //we have a private property here, ofcourse we want to have a strong reference because no one else is going to have access to it since this is private
@end

@implementation Deck

- (NSMutableArray *) cards { //getter for the cards property
    //lazy instantiation
    // this does not override it implements it
    //compiler wont implement unless you implement
    
    if (!_cards) _cards = [[NSMutableArray alloc] init]; //setting instance variable to empty mutable array
    //should never seperate alloc and init
    //this automatically sets it to the heap til its set to nil
    //alloc init sets to 0 or nil
   
    return _cards; //returning instance variable value
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop {
    
    // we cannot put nil in an array, so we need to set condition to check if cards exists
    if (atTop) {
        [self.cards insertObject:card atIndex:0]; // we're going to put the card at the top if we want it atTop
    } else {
        [self.cards addObject:card]; // else we're just going to put it on the bottom of the card
    }
}

- (Card *)drawRandomCard {
    
    Card *randomCard = nil; // just number 0; the 0 that points to nothing
    //didn't need to set to nil because local variables start out as zero
    
    if (self.cards.count) { // protect ourself from calling an item from an empty array
    
        unsigned index = arc4random() %self.cards.count;
        
        randomCard = self.cards[index]; // getting the card and setting local variable
        [self.cards removeObjectAtIndex:index]; // removing the card from the deck
        
    }
    return randomCard;
}

@end
