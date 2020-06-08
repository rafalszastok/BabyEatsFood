
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
