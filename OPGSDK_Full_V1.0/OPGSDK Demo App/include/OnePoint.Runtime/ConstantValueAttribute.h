//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/chinthan/Framework/Logger/ConvertCode/OnePoint/Runtime/VirtualMachine/Core/ConstantValueAttribute.java
//
//  Created by chinthan on 12/2/13.
//

#ifndef _ConstantValueAttribute_H_
#define _ConstantValueAttribute_H_

@class Constant;


#import "Attribute.h"

@interface ConstantValueAttribute : Attribute {
 @public
  Constant *__Value_;
}

- (Constant *)getValue;
- (void)setValueWithConstant:(Constant *)value;
- (id)initWithConstant:(Constant *)constantValue;
@end


#endif // _ConstantValueAttribute_H_