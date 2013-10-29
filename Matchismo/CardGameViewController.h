//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Henry Chan on 4/5/13.
//  Copyright (c) 2013 Henry Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"
@interface CardGameViewController : UIViewController

@property (strong, nonatomic) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@end
