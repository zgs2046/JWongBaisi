
#import <UIKit/UIKit.h>

typedef enum {
    JWTopicTypeAll = 1,
    JWTopicTypePicture = 10,
    JWTopicTypeWord = 29,
    JWTopicTypeVoice = 31,
    JWTopicTypeVideo = 41
} JWTopicType;

/** 精华-顶部标题的高度 */
UIKIT_EXTERN CGFloat const JWTitilesViewH;
/** 精华-顶部标题的Y */
UIKIT_EXTERN CGFloat const JWTitilesViewY;

/** 精华-cell-间距 */
UIKIT_EXTERN CGFloat const JWTopicCellMargin;
/** 精华-cell-文字内容的Y值 */
UIKIT_EXTERN CGFloat const JWTopicCellTextY;
/** 精华-cell-底部工具条的高度 */
UIKIT_EXTERN CGFloat const JWTopicCellBottomBarH;

/** 精华-cell-图片帖子的最大高度 */
UIKIT_EXTERN CGFloat const JWTopicCellPictureMaxH;
/** 精华-cell-图片帖子一旦超过最大高度,就是用Break */
UIKIT_EXTERN CGFloat const JWTopicCellPictureBreakH;

/** JWUser模型-性别属性值 */
UIKIT_EXTERN NSString * const JWUserSexMale;
UIKIT_EXTERN NSString * const JWUserSexFemale;

/** 精华-cell-最热评论标题的高度 */
UIKIT_EXTERN CGFloat const JWTopicCellTopCmtTitleH;

/** tabBar被选中的通知名字 */
UIKIT_EXTERN NSString * const JWTabBarDidSelectNotification;
/** tabBar被选中的通知 - 被选中的控制器的index key */
UIKIT_EXTERN NSString * const JWSelectedControllerIndexKey;
/** tabBar被选中的通知 - 被选中的控制器 key */
UIKIT_EXTERN NSString * const JWSelectedControllerKey;

/** 标签-间距 */
UIKIT_EXTERN CGFloat const JWTagMargin;
/** 标签-高度 */
UIKIT_EXTERN CGFloat const JWTagH;

