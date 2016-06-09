//
//  FISShoppingCart.h
//  
//
//  Created by John Hussain on 6/9/16.
//
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject

@property (strong, nonatomic) NSMutableArray *items;


- (NSUInteger) calculateTotalPriceInCents;

- (void) addItem: (FISItem*) item;

- (void) removeItem: (FISItem*) item;

- (void) removeAllItemsLikeItem: (FISItem*) item;

- (void) sortItemsByNameAsc;

- (void) sortItemsByNameDesc;

- (void) sortItemsByPriceInCentsAsc;

- (void) sortItemsByPriceInCentsDesc;

- (NSArray*) allItemsWithName: (NSString*) name;

- (NSArray*) allItemsWithMinimumPriceInCents: (NSUInteger) minimumPrice;

- (NSArray*) allItemsWithMaximumPriceInCents: (NSUInteger) maximumPrice;

@end
