//
//  Card.m
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "Card.h"

@interface Card()
//private methods and properties goes here
//if we need them
//any other classes cannot call these properties/methods

@end

@implementation Card // implementation of interface

@synthesize faceUp = _faceUp;
@synthesize unplayable = _unplayable;

- (BOOL) isFaceUp {
    return _faceUp;
}
- (void) setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
}
- (BOOL) isUnplayable {
    return _unplayable;
}
-(void) setUnplayable:(BOOL)unplayable {
    _unplayable = unplayable;
}

@synthesize contents = _contents; // sets variable to the instance variable; property is set to instance variable

//These are behind the scenes methods
- (NSString *)contents { // (NSString*) returning type pointer to string followed by name of property
    
    return _contents; //underbar variable name is the instance variable
}
- (void)setContents:(NSString *)contents {
    _contents = contents;
}

- (int)match:(NSArray *)otherCards {
    
    int score = 0;
   
    for (Card *card in otherCards) { // fast enumeration through otherCards
        if ([card.contents isEqualToString:self.contents]) { //comparing argument contents to own contents of self
          
            score=1;
        }
    }
    
    return score;
    
}



@end
