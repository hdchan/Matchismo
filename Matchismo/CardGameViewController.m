//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel; // weak because we dont need a reference to it if the view is gone...
//control clicked dragged the proper from the label into here

@property (nonatomic) int flipCount;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons; // all buttons in this array has a strong pointer
//@property (strong, nonatomic) Deck *deck; // we're going to get the number of cards in the card button array

@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipDescriptionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchCountModeSwitch;

@end

@implementation CardGameViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[[PlayingCardDeck alloc] init]];
    _game.matchCountMode = self.matchCountModeSwitch.selectedSegmentIndex;
    return _game;
}



/*- (Deck *)deck {
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}*/
- (void)setCardButtons:(NSArray *)cardButtons { // setter for @property cardButtons
    
    _cardButtons = cardButtons;
    /*for (UIButton *cardButton in self.cardButtons) {
        
        Card *card = [self.deck drawRandomCard]; // deck method
        
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        
    }*/
    [self updateUI];
}
- (void)updateUI { // take state of model and reflect it in the UI
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        
        cardButton.enabled = !card.isUnPlayable;
        cardButton.alpha = (card.isUnPlayable ? 0.3 : 1.0);
        
        
        if (!cardButton.selected){
            [cardButton setTitle:nil forState:UIControlStateNormal];
            UIImage *cardBackImage = [UIImage imageNamed:@"cardback.jpg"];
            [cardButton setImage:cardBackImage forState:UIControlStateNormal];
            
        }
        else {
            [cardButton setImage:nil forState:UIControlStateNormal];
        }
    }
    self.flipDescriptionLabel.text = self.game.flipDescription;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (IBAction)setMatchCountModeChanged:(UISegmentedControl *)sender {
    self.flipDescriptionLabel.text = [NSString stringWithFormat:@"Game mode: %@ card match",[sender titleForSegmentAtIndex:sender.selectedSegmentIndex]];
    self.game.matchCountMode = sender.selectedSegmentIndex;
}

- (void)setFlipCount:(int)flipCount { // here we're implementing the flip count AND setting the flips label
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)deal:(UIButton *)sender { // redeal
    self.game = nil; // setting the game to nil so when its called next time we're going to initialize a new game object
    self.flipCount = 0; // resetting the flip count
    self.matchCountModeSwitch.userInteractionEnabled = YES;
    self.matchCountModeSwitch.alpha = 1.0;
    [self updateUI]; // reflect changes of new game
    self.flipDescriptionLabel.text = @"Redealing";
}

- (IBAction)flipCard:(UIButton *)sender { // created this by control clicking the button and dragging it in here
    
    /*if (sender.isSelected) {
        sender.selected = NO;
    } else {
        sender.selected = YES;
    }*/
    
    //alternative code
    //sender.selected = !sender.isSelected;
    
    self.matchCountModeSwitch.userInteractionEnabled = NO;
    self.matchCountModeSwitch.alpha = 0.3;
   
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]]; // sender of button
    //here we're telling the model look like the UI
    
    self.flipCount++;
    
    [self updateUI];

}


@end
