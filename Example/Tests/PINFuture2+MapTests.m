//
//  MapTests.m
//  PINFuture
//
//  Created by Chris Danford on 12/4/16.
//  Copyright (c) 2016 Pinterest. All rights reserved.
//

// https://github.com/Specta/Specta

#import "PINFuture.h"
#import "TestUtil.h"

SpecBegin(PINFuture2MapSpecs)

describe(@"map", ^{
    it(@"can return a value of a different type", ^{
        NSNumber *valueA = numberFixture();
        NSString *valueB = stringFixture();
        PINFuture<NSNumber *> *futureA = [PINFuture<NSNumber *> withValue:valueA];
        PINFuture<NSString *> *futureB = [PINFuture2<NSNumber *, NSString *> map:futureA success:^NSString * _Nonnull(NSNumber * _Nonnull fromValue) {
            return valueB;
        }];
        expectFutureToResolveWith(self, futureB, valueB);
    });
});

SpecEnd
