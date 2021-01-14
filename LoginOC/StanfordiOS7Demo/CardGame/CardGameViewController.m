//
//  CardGameViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/11.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, assign) NSInteger flipsCount;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;

@end

@implementation CardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setFlipsCount:(NSInteger)flipsCount {
    _flipsCount = flipsCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %zd", self.flipsCount];
}

#pragma mark - Action
- (IBAction)touchCardButton:(UIButton *)sender {
    NSInteger index = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
}

#pragma mark - Private
- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        NSInteger index = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:index];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.content : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"" : @"defaultAppIcon"];
}

#pragma mark - Lazy

- (Deck *)deck {
    if (!_deck) {
        _deck = [self createDeck];
    }
    return _deck;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[self createDeck]];
    }
    return _game;
}

@end
