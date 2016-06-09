//
//  FISShoppingCart.m
//  
//
//  Created by John Hussain on 6/9/16.
//
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger) calculateTotalPriceInCents{
    
    NSUInteger itemTotalPriceInCents = 0;
    
    for (FISItem *item in self.items) {
        itemTotalPriceInCents += item.priceInCents;
    }
    
    return itemTotalPriceInCents;
}

- (void) addItem:(FISItem *)item{
    
    [self.items addObject:item];
}

- (void) removeItem:(FISItem *)item{
    
    NSUInteger stockIndex = [self.items indexOfObject:item];
    
    [self.items removeObjectAtIndex:stockIndex];
}

- (void) removeAllItemsLikeItem:(FISItem *)item{
    
    [self.items removeObject:item];
}

- (void) sortItemsByNameAsc{
    
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortByNameAsc]];
}

- (void) sortItemsByNameDesc{
    
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortByNameDesc]];
    
}

- (void) sortItemsByPriceInCentsAsc{
    
    NSSortDescriptor *sortByPriceInCentsAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    
    [self.items sortUsingDescriptors:@[sortByPriceInCentsAsc]];
    
}

- (void) sortItemsByPriceInCentsDesc{
    
    NSSortDescriptor *sortByPriceInCentsDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    
    [self.items sortUsingDescriptors:@[sortByPriceInCentsDesc]];
}

- (NSArray*) allItemsWithName:(NSString *)name{
    
    NSMutableArray *allItems = [[NSMutableArray alloc]init];
    
    for (FISItem *item in self.items) {
        
        if ([item.name isEqualToString:name]) {
            [allItems addObject:item];
        }
    }
    
    return allItems;
}

- (NSArray*) allItemsWithMinimumPriceInCents:(NSUInteger)minimumPrice{
    
    NSPredicate *priceGreaterThanMinimumPredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %lu", minimumPrice];
    
    NSArray *priceGreaterThanMinimum = [self.items filteredArrayUsingPredicate:priceGreaterThanMinimumPredicate];

    
    return priceGreaterThanMinimum;
}

- (NSArray*) allItemsWithMaximumPriceInCents:(NSUInteger)maximumPrice{
    
    NSPredicate *priceLessThanMaximumPredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %lu", maximumPrice];
    
    NSArray *priceLessThanMaximum = [self.items filteredArrayUsingPredicate:priceLessThanMaximumPredicate];
    
    
    return priceLessThanMaximum;
}


@end
