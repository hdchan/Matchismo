//
//  SetGameViewController.m
//  Matchismo
//
//  Created by The Doctor's Channel on 10/28/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "CardMatchingGame.h"

@interface SetGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel; 

@property (nonatomic) int flipCount;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipDescriptionLabel;

@end

@implementation SetGameViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[[SetCardDeck alloc] init]];
    _game.matchCountMode = 2;
    return _game;
}

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

- (void)setFlipCount:(int)flipCount { // here we're implementing the flip count AND setting the flips label
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)deal:(UIButton *)sender { // redeal
    self.game = nil; // setting the game to nil so when its called next time we're going to initialize a new game object
    self.flipCount = 0; // resetting the flip count
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
    
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]]; // sender of button
    //here we're telling the model look like the UI
    
    self.flipCount++;
    
    [self updateUI];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
}



@end
