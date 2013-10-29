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

@property (strong, nonatomic) CardMatchingGame *game;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipDescriptionLabel;

@end

@implementation SetGameViewController

@synthesize game = _game;

- (CardMatchingGame *)game {
    
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[[SetCardDeck alloc] init]];
    _game.matchCountMode = 2;
    return _game;
}



- (void)updateUI { // take state of model and reflect it in the UI
    
    for (UIButton *cardButton in self.cardButtons) {
        
        
        
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        NSMutableAttributedString *attributedContents = [[NSMutableAttributedString alloc] initWithString:card.contents];
        
        
        
        
        [attributedContents setAttributes:@{} range:(NSRange){0,attributedContents.length } ];
        
        
        [cardButton setAttributedTitle:attributedContents forState:UIControlStateSelected & UIControlStateDisabled & UIControlStateNormal];
        
        
        cardButton.selected = card.isFaceUp;
        
        if (card.isFaceUp) {
            [cardButton setBackgroundColor:[UIColor lightGrayColor]];
        } else {
            [cardButton setBackgroundColor:[UIColor whiteColor]];
        }
        
        cardButton.enabled = !card.isUnPlayable;
        cardButton.alpha = (card.isUnPlayable ? 0.3 : 1.0);
        
        
        /*if (!cardButton.selected){
         [cardButton setTitle:nil forState:UIControlStateNormal];
         UIImage *cardBackImage = [UIImage imageNamed:@"cardback.jpg"];
         [cardButton setImage:cardBackImage forState:UIControlStateNormal];
         
         }
         else {
         [cardButton setImage:nil forState:UIControlStateNormal];
         }*/
    }
    self.flipDescriptionLabel.text = self.game.flipDescription;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}


@end
