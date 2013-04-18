//
//  PlayingCard.m
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards {
    
    int score = 0;
    
    if ([otherCards count] == 1) { // we're checking against only one other card
        id otherCard = [otherCards lastObject];
        if ([otherCard isKindOfClass:[PlayingCard class]]) {
            
            PlayingCard *otherPlayingCard = (PlayingCard *)otherCard; // treated as a playing card to let reader know
            
            if ([otherPlayingCard.suit isEqualToString:self.suit]) {
                score = 1;
            } else if (otherPlayingCard.rank == self.rank) {
                score = 4;
            }
        }

        
    }
    else if ([otherCards count] == 2) {
        PlayingCard *firstCard = [otherCards objectAtIndex:0];
        PlayingCard *secondCard = [otherCards objectAtIndex:1];
        if ([self.suit isEqualToString:firstCard.suit] && [self.suit isEqualToString:secondCard.suit]) {
            score = 3;
        } else if (self.rank == firstCard.rank && self.rank == secondCard.rank) {
            score = 12;
        }
    }
    
    // we could implement for multple otherCards
    
    
    return score;
}

- (NSString *)contents {
    
    NSArray *rankStrings = [PlayingCard rankStrings]; //creating an array (mutable) on the fly with strings on the fly
    //on the fly meaning with out having to create the properies
    //objects in array can be of any type
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

@synthesize suit = _suit; // we have to synthesize if we set BOTH setter and getter

+ (NSArray *) validSuits { // send message to class only for utility methods
    return @[@"♠",@"♣",@"♥",@"♦"];
}
- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) { //calling class methods valid suits
        _suit = suit;
    }
}
- (NSString *)suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    return [self rankStrings].count-1;
}

- (void)setRank:(NSUInteger)rank { // setting rank here so no one can set the rank higher than we intented it to be
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
