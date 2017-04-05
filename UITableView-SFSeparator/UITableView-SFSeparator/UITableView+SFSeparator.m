//
//  UITableView+SFSeparator.m
//  UITableView-SFSeparator
//
//  Created by Jakey on 2017/4/4.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "UITableView+SFSeparator.h"
#import <objc/runtime.h>

static const void *k_sf_dataSource = &k_sf_dataSource;
static const void *k_sf_delegate = &k_sf_delegate;

@interface UITableView () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) id <UITableViewDataSource> sf_dataSource;
@property (nonatomic, weak) id <UITableViewDelegate> sf_delegate;
@end

@implementation UITableView (SFSeparator)

+ (void)load {
    SEL selectors[] = {
        @selector(dataSource),
        @selector(setDataSource:),
        @selector(delegate),
        @selector(setDelegate:),
        @selector(respondsToSelector:),
        @selector(forwardInvocation:),
        @selector(layoutSubviews)
    };
    
    for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
        SEL originalSelector = selectors[index];
        SEL swizzledSelector = NSSelectorFromString([@"sf_swizzle" stringByAppendingString:NSStringFromSelector(originalSelector)]);
        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
-(void)sf_swizzle_layoutSubviews{

}
- (id <UITableViewDataSource>)sf_swizzle_dataSource
{
    return self.sf_dataSource;
}

- (void)sf_swizzle_setDataSource:(id <UITableViewDataSource>)dataSource
{
    self.sf_dataSource = dataSource;
    [self sf_swizzle_setDataSource:self];
}
- (id <UITableViewDelegate>)sf_swizzle_delegate
{
    return self.sf_delegate;
}

- (void)sf_swizzle_setDelegate:(id <UITableViewDelegate>)delegate
{
    self.sf_delegate = delegate;
    [self sf_swizzle_setDelegate:self];
}

#pragma mark - auxDataSource Getter/Setter
- (id <UITableViewDataSource>)sf_dataSource
{
    id  <UITableViewDataSource> sf_dataSource = objc_getAssociatedObject(self, k_sf_dataSource);
    return sf_dataSource;
}

- (void)setSf_dataSource:(id<UITableViewDataSource>)sf_dataSource
{
    objc_setAssociatedObject(self, k_sf_dataSource, sf_dataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id <UITableViewDelegate>)sf_delegate
{
    id  <UITableViewDelegate> sf_delegate = objc_getAssociatedObject(self, k_sf_delegate);
    return sf_delegate;
}

- (void)setSf_delegate:(id<UITableViewDelegate>)sf_delegate
{
    objc_setAssociatedObject(self, k_sf_delegate, sf_delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark - Override
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self.sf_delegate tableView:tableView heightForRowAtIndexPath:indexPath];
  
    return height;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.sf_dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
    
   
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row==2) {
//        CGRect frame = cell.frame;
//        frame.origin.y-=10;
//        cell.contentView.frame = frame;
//        
//    }
//    
    [self.sf_delegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
}
#pragma mark - Message Forwarding
- (BOOL)sf_swizzle_respondsToSelector:(SEL)aSelector
{
    if ([self sf_swizzle_respondsToSelector:aSelector] )
        return YES;
    else if ([self.sf_dataSource respondsToSelector:aSelector]){
        return YES;
    }
    return NO;
}

- (NSMethodSignature*)methodSignatureForSelector:(SEL)selector
{
    NSMethodSignature* signature = [super methodSignatureForSelector:selector];
    if (!signature) {
        signature = [(id)self.sf_dataSource methodSignatureForSelector:selector];
    }
    return signature;
}

- (void)sf_swizzle_forwardInvocation:(NSInvocation *)anInvocation
{
    if ([self.sf_dataSource respondsToSelector:[anInvocation selector]])
        [anInvocation invokeWithTarget:self.sf_dataSource];
    else
        [self sf_swizzle_forwardInvocation:anInvocation];
}
@end
