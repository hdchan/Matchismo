//
//  Deck.h
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
