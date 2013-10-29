//
//  PlayingCardMatchGameViewController.m
//  Matchismo
//
//  Created by The Doctor's Channel on 10/29/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "PlayingCardMatchGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface PlayingCardMatchGameViewController ()

@property (strong, nonatomic) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation PlayingCardMatchGameViewController

@synthesize game = _game;

- (CardMatchingGame *)game {
    
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[[PlayingCardDeck alloc] init]];
    _game.matchCountMode = 1;
    return _game;
}

@end
