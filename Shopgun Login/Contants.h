//
//  Contants.h
//  Shopgun Login
//
//  Created by Eng Waseem on 10/06/2016.
//  Copyright © 2016 ShopGun. All rights reserved.
//

#ifndef Contants_h
#define Contants_h

// ******************* DEVICE INDENTIFICATION MACROS *****************//
#define STANDARD_WIDTH 375.0f
#define STANDARD_HEIGHT 667.0f

#define MAIN_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define MAIN_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define STANDARD_GAP 5.0f
#define IS_IPAD             (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE4          (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0f || IS_IPHONE && [[UIScreen mainScreen]bounds].size.width == 480.0f)
#define IS_IPHONE5          (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f || IS_IPHONE && [[UIScreen mainScreen]bounds].size.width == 568.0f)
#define IS_IPHONE6          (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0 || IS_IPHONE && [[UIScreen mainScreen]bounds].size.width == 667.0f)
#define IS_IPHONE6PLUS      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || IS_IPHONE && [[UIScreen mainScreen]bounds].size.width == 736.0f)
#define IS_RETINA           ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))

#endif /* Contants_h */
