//
//  SetCardDeck.m
//  Matchismo
//
//  Created by The Doctor's Channel on 10/28/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (id)init { // when we do an alloc "init" this is it!
    // id means pointer to object of ANY class
    
    self = [super init]; // this is the only place we're going to set self
    // this lets our super class call its init
    
    if (self) { // if not set to nil then we'll run the following code
        
        for (NSString *shape in [SetCard validShapes]) {
            for (UIColor *color in [SetCard validColors]) {
                for (NSUInteger count = 1; count <= [SetCard maxCount]; count++) {
                    SetCard *card = [[SetCard alloc] init];
                    card.shape = shape;
                    card.color = color;
                    card.count = count;
                    [self addCard:card atTop:YES];
                    card.filled = YES;
                    [self addCard:card atTop:YES];
                }
            }
        }
        
        
    }
    
    return self;
    
}

@end
