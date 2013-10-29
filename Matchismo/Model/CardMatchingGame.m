//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Henry Chan on 4/6/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (readwrite, nonatomic) int score; //default is readwrite in private, but we set it to readonly in public, we're doing this to help out the reader
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@property (strong, nonatomic) NSMutableArray *otherCards;

@end

@implementation CardMatchingGame

//Lazy inistanatiation
- (NSMutableArray *)cards {
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSMutableArray *)otherCards {
    if (!_otherCards) _otherCards = [[NSMutableArray alloc] init];
    return _otherCards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

- (void)flipCardAtIndex:(NSUInteger)index {
    
    
    
    Card *card = [self cardAtIndex:index];
    
    
    if (card && !card.isUnPlayable) {
        if (!card.isFaceUp) { // knowing we're not checking against it self is if card is not faced up
            
            self.otherCards = nil;
        
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnPlayable) {
                    
                    [self.otherCards addObject:otherCard];
                    
                    if (self.otherCards.count == self.matchCountMode) {
                        break;
                    }
                }
                
            }
            int matchScore = [card match:self.otherCards];
            
            
            if (matchScore && self.otherCards.count == self.matchCountMode) {
                card.unplayable = YES;
                
                NSString *cardContents = @"";
                
                for (Card *otherCard in self.otherCards) {
                    otherCard.unplayable = YES;
                    cardContents = [NSString stringWithFormat:@"%@ %@",cardContents, otherCard.contents];
                }
                
                self.score += matchScore * MATCH_BONUS;
                self.flipDescription = [NSString stringWithFormat:@"%@%@ match! +%d points!",card.contents,cardContents, matchScore * MATCH_BONUS];
                
            }
            else if(!matchScore && self.otherCards.count == self.matchCountMode){
                
                NSString *cardContents = @"";
                
                for (Card *otherCard in self.otherCards) {
                    otherCard.faceUp = NO;
                    cardContents = [NSString stringWithFormat:@"%@ %@",cardContents, otherCard.contents];
                }
                self.score -= MISMATCH_PENALTY;
                
                self.flipDescription = [NSString stringWithFormat:@"%@%@ no match! -%d points!",card.contents,cardContents, MISMATCH_PENALTY];
            }
            else {
                self.flipDescription = [NSString stringWithFormat:@"Flipped a %@",card.contents];
            }
            
            
            self.score -= FLIP_COST;
        }
        else {
            self.flipDescription = @"Flipped card back over";
        }
        card.faceUp = !card.isFaceUp;
        
     
    }
    
    // Tutorial logic
    /*
    if (card && !card.isUnPlayable) {
        if (!card.isFaceUp) { // knowing we're not checking against it self is if card is not faced up
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnPlayable) {
                    int matchScore = [card match:@[otherCard]];
                   if (matchScore) { // if we match
                       NSLog(@"%d",matchScore);
                        card.unplayable = YES;
                        otherCard.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS; //we're going to give a match bonus
                        self.flipDescription = [NSString stringWithFormat:  @"%@ and %@! +%d points", card.contents,otherCard.contents, matchScore * MATCH_BONUS]; // we're going to return a matching description
                        
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY; // otherwise we're going to penalize
                        self.flipDescription = [NSString stringWithFormat:  @"%@ and %@ don't match! -%d points", card.contents,otherCard.contents, MISMATCH_PENALTY]; // return a mismatch description
                    }
                    break;
                }
                
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
        
    
    }*/
    
}

- (Card *)cardAtIndex:(NSUInteger)index {
    
    return (index < [self.cards count]) ? self.cards[index] : nil; // if index is in range of cout of cards property
}

- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck {
    self = [super init]; // when you implement your designated initializer then you call your super class initializer
    // else you call your own intializer
    
    if (self) {
        for (int i = 0; i <count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) { // if we have a hard
                self.cards[i] = card; // then we'll set the card
            } else { // otherwise
                self = nil; // if we dont have a card then set it to nil
                break;// and break from further itter
            }
        }
        
    }
    
    return self;
}



@end
