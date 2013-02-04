//
//  TaskObj.h
//  ToDue
//
//  Created by Mike Cranwill on 1/31/13.
//  Copyright (c) 2013 Self. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskObj : NSObject
@property (nonatomic, copy) NSMutableAttributedString *text;
- (id) initWithText:(NSMutableAttributedString *)text;
-(id)initWithCoder:(NSKeyedUnarchiver *)aDecoder;
-(void)encodeWithCoder:(NSCoder *)aCoder;
@end
