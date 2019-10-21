//
//  BaseViewController.h
//  demo
//
//  Created by cyq on 2019/10/20.
//  Copyright © 2019 www.helloworld.cyq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol BaseViewControllerProtocal <NSObject>

@optional

-(void)startLoadViews;

@end

@interface BaseViewController : UIViewController<BaseViewControllerProtocal>

@end

NS_ASSUME_NONNULL_END
