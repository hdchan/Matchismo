//
//  SetCard.m
//  Matchismo
//
//  Created by The Doctor's Channel on 10/28/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards {
    
    int score = 0;
    if ([otherCards count] == 2) {
        SetCard *firstCard = [otherCards objectAtIndex:0];
        SetCard *secondCard = [otherCards objectAtIndex:1];
        if ([self.shape isEqualToString:firstCard.shape] && [self.shape isEqualToString:secondCard.shape]) {
            score = 3;
        } else if (self.count == firstCard.count && self.count == secondCard.count) {
            score = 12;
        }
    }

    
    return score;
}

- (NSString *)contents {
    
    NSMutableString *cardContents = [[NSMutableString alloc] init];
    
    for (NSUInteger i = 1; i <= self.count; i++) {
        [cardContents appendString:self.shape];
    }
    
    return [ NSString stringWithFormat:@"%@", cardContents];
    
}

@synthesize shape = _shape;

+(NSArray *)validShapes {
    return @[@"■",@"●",@"▲"];
}
-(void)setShape:(NSString *)shape {
    if ([[SetCard validShapes] containsObject:shape]) { //calling class methods valid suits
        _shape = shape;
    }
}
- (NSString *)shape {
    return _shape ? _shape : nil;
}

@synthesize color = _color;

+(NSArray *)validColors {
    return @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
}
-(void)setColor:(UIColor *)color {
    if ([[SetCard validColors] containsObject:color]) { 
        _color = color;
    }
}
- (UIColor *)color {
    return _color ? _color : nil;
}

+(NSUInteger)maxCount {
    return 3;
}
-(void)setCount:(NSUInteger)count {
    if (count <= [SetCard maxCount]) {
        _count = count;
    }
}

@end
