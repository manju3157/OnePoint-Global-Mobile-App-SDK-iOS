//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ashchauhan/Desktop/SampleApp/OnePoint/Runtime/Common/IOM/SavePoint.java
//
//  Created by ashchauhan on 6/20/14.
//

//#ifndef _SavePoint_H_
//#define _SavePoint_H_
#import <Foundation/Foundation.h>

@protocol ISavePoints;
#import "Cache.h"
#import "Handler.h"
#import "ISavePoint.h"
#import "IQuestion.h"


@interface SavePoint : NSObject < ISavePoint > {
 @public
  Cache *__Cache_;
  Handler *__Handler_;
  long long int __HistoryIndex_;
  BOOL __IsLocked_;
  NSString *__Label_;
  NSString *__Name_;
  id<ISavePoints> __Parent_;
  id<ISavePoint> __Previous_;
    id<IQuestion> _question;
}

- (id)initWithISavePoints:(id<ISavePoints>)parent
           withISavePoint:(id<ISavePoint>)previous
                                           withId:(id)handler;
- (id)initWithISavePoint:(id<ISavePoint>)savePoint
            withNSString:(NSString *)label
            withNSString:(NSString *)name withQuestion:(id<IQuestion>)quest;
- (Cache *)getCache;
- (void)setCache:(Cache *)value;
- (Handler*)getHandler;
- (void)setHandler:(Handler*)value;
- (long long int)getHistoryIndex;
- (void)setHistoryIndex:(long long int)value;
- (BOOL)getIsLocked;
- (void)setIsLocked:(BOOL)value;
- (NSString *)getLabel;
- (void)setLabel:(NSString *)value;
- (NSString *)getName;
- (void)setName:(NSString *)value;
- (id<ISavePoints>)getParent;
- (void)setParent:(id<ISavePoints>)value;
- (id<ISavePoint>)getPrevious;
- (void)setPrevious:(id<ISavePoint>)value;
- (void)go;
-(BOOL)getIsTemporary;
@end
