//
//  AppDelegate.h
//  demo
//
//  Created by cyq on 2019/10/20.
//  Copyright © 2019 www.helloworld.cyq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

