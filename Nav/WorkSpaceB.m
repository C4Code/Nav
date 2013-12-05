//
//  WorkSpaceB.m
//  Nav
//
//  Created by moi on 12/5/2013.
//  Copyright (c) 2013 moi. All rights reserved.
//

#import "WorkSpaceB.h"

@implementation WorkSpaceB

-(void)setup {
    //sets the title
    self.title = @"B";
    
    //adds a label
    C4Font *font = [C4Font fontWithName:@"AppleSDGothicNeo-Bold" size:36];
    C4Label *label = [C4Label labelWithText:@"WorkSpace A" font:font];
    label.center = self.canvas.center;
    [self.canvas addLabel:label];
}

@end
