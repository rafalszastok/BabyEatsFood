//
// Created by Marcin Biolik on 11/07/2018.
// Copyright © 2018 DAZN. All rights reserved.
//

#import "UICollectionView+Dequeue.h"

@implementation UICollectionView (Dequeue)

- (nullable UICollectionViewCell *)tryToDequeueReusableCellWithReuseIdentifier:(nonnull NSString *)identifier
                                                                  forIndexPath:(nonnull NSIndexPath *)indexPath {

    @try {
        return [self dequeueReusableCellWithReuseIdentifier:identifier
                                               forIndexPath:indexPath];
    }

    @catch (NSException *exception) {

        if ([exception.name isEqualToString:NSInternalInconsistencyException]) {
            return nil;
        } else {
            @throw exception;
        }
    }
}

- (nullable UICollectionReusableView *)tryToDequeueSupplementaryViewOfKind:(nonnull NSString *)elementKind
                                                       withReuseIdentifier:(nonnull NSString *)identifier
                                                              forIndexPath:(nonnull NSIndexPath *)indexPath {

    @try {
        return [self dequeueReusableSupplementaryViewOfKind:elementKind
                                        withReuseIdentifier:identifier
                                               forIndexPath:indexPath];
    }

    @catch (NSException *exception) {

        if ([exception.name isEqualToString:NSInternalInconsistencyException]) {
            return nil;
        } else {
            @throw exception;
        }
    }
}

@end
