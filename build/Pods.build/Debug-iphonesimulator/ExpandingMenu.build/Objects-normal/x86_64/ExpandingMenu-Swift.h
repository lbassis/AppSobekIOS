// Generated by Apple Swift version 3.0.2 (swiftlang-800.0.63 clang-800.0.42.1)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIColor;
@class UIImage;
@class NSCoder;
@class ExpandingMenuItem;
@class UITouch;
@class UIEvent;
@class UIGestureRecognizer;

SWIFT_CLASS("_TtC13ExpandingMenu19ExpandingMenuButton")
@interface ExpandingMenuButton : UIView <UIGestureRecognizerDelegate>
@property (nonatomic) CGFloat menuItemMargin;
@property (nonatomic) BOOL allowSounds;
@property (nonatomic, copy) NSString * _Nonnull expandingSoundPath;
@property (nonatomic, copy) NSString * _Nonnull foldSoundPath;
@property (nonatomic, copy) NSString * _Nonnull selectedSoundPath;
@property (nonatomic, strong) UIColor * _Nonnull bottomViewColor;
@property (nonatomic) CGFloat bottomViewAlpha;
@property (nonatomic) BOOL titleTappedActionEnabled;
@property (nonatomic, copy) void (^ _Nullable willPresentMenuItems)(ExpandingMenuButton * _Nonnull);
@property (nonatomic, copy) void (^ _Nullable didPresentMenuItems)(ExpandingMenuButton * _Nonnull);
@property (nonatomic, copy) void (^ _Nullable willDismissMenuItems)(ExpandingMenuButton * _Nonnull);
@property (nonatomic, copy) void (^ _Nullable didDismissMenuItems)(ExpandingMenuButton * _Nonnull);
- (nonnull instancetype)initWithFrame:(CGRect)frame centerImage:(UIImage * _Nonnull)centerImage centerHighlightedImage:(UIImage * _Nonnull)centerHighlightedImage OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCenterImage:(UIImage * _Nonnull)centerImage centerHighlightedImage:(UIImage * _Nonnull)centerHighlightedImage;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)addMenuItems:(NSArray<ExpandingMenuItem *> * _Nonnull)menuItems;
- (void)menuItemTapped:(ExpandingMenuItem * _Nonnull)item;
- (void)touchesBegan:(NSSet<UITouch *> * _Nonnull)touches withEvent:(UIEvent * _Nullable)event;
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer * _Nonnull)gestureRecognizer;
- (BOOL)gestureRecognizer:(UIGestureRecognizer * _Nonnull)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer * _Nonnull)otherGestureRecognizer;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC13ExpandingMenu17ExpandingMenuItem")
@interface ExpandingMenuItem : UIView
@property (nonatomic, copy) NSString * _Nullable title;
@property (nonatomic) CGFloat titleMargin;
@property (nonatomic, strong) UIColor * _Nullable titleColor;
- (nonnull instancetype)initWithImage:(UIImage * _Nonnull)image highlightedImage:(UIImage * _Nonnull)highlightedImage backgroundImage:(UIImage * _Nullable)backgroundImage backgroundHighlightedImage:(UIImage * _Nullable)backgroundHighlightedImage itemTapped:(void (^ _Nullable)(void))itemTapped;
- (nonnull instancetype)initWithTitle:(NSString * _Nonnull)title titleColor:(UIColor * _Nullable)titleColor image:(UIImage * _Nonnull)image highlightedImage:(UIImage * _Nonnull)highlightedImage backgroundImage:(UIImage * _Nullable)backgroundImage backgroundHighlightedImage:(UIImage * _Nullable)backgroundHighlightedImage itemTapped:(void (^ _Nullable)(void))itemTapped;
- (nonnull instancetype)initWithSize:(CGSize)size image:(UIImage * _Nonnull)image highlightedImage:(UIImage * _Nonnull)highlightedImage backgroundImage:(UIImage * _Nullable)backgroundImage backgroundHighlightedImage:(UIImage * _Nullable)backgroundHighlightedImage itemTapped:(void (^ _Nullable)(void))itemTapped;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end

#pragma clang diagnostic pop
