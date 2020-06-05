//
// Created by Marcin Biolik on 11/07/2018.
// Copyright © 2018 DAZN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Dequeue)

- (nullable UICollectionViewCell *)tryToDequeueReusableCellWithReuseIdentifier:(nonnull NSString *)identifier
                                                                  forIndexPath:(nonnull NSIndexPath *)indexPath
NS_SWIFT_NAME(tryToDequeueReusableCell(withReuseIdentifier:for:));

- (nullable UICollectionReusableView *)tryToDequeueSupplementaryViewOfKind:(nonnull NSString *)elementKind
                                                       withReuseIdentifier:(nonnull NSString *)identifier
                                                              forIndexPath:(nonnull NSIndexPath *)indexPath
NS_SWIFT_NAME(tryToDequeueReusableSupplementaryView(ofKind:withReuseIdentifier:for:));

@end
