//
//  Card.h
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject // this is declaring the headerfile and its super class

@property (strong, nonatomic) NSString *contents;
//@property is method generates the setter and getter for instance variable
//gets pointer to instance variable
//strong means that we have a strong reference to it
//i want this object to stay in the heap as long as "I" keep a pointer to is
//weak means keeps it as long as "someone else" points to it
//setter creates the pointer

//nonatomic: are not threadsafe

@property (nonatomic, getter = isFaceUp) BOOL faceUp; // setting the getter to another name
@property (nonatomic, getter = isUnPlayable) BOOL unplayable;
//Booleans are not pointers
//primitive types that are not in the heap, they're just there

//- (int)match:(Card *)card; // takes argument of Card class
- (int)match:(NSArray *)otherCards;
@end
