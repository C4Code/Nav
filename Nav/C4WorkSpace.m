//
//  C4WorkSpace.m
//  Nav
//
//  Created by moi on 12/5/2013.
//

#import "C4Workspace.h"
#import "WorkSpaceA.h"
#import "WorkSpaceB.h"

@implementation C4WorkSpace {
    WorkSpaceA *workspaceA;
    WorkSpaceB *workspaceB;
    
    C4Button *buttonA, *buttonB;
}

-(void)setup {
    //sets the title for the current nav item
    self.title = @"Nav Example";

    //create the workspaces to drill into
    [self createWorkSpaces];
    
    //create the buttons
    [self createAddButtons];
}

-(void)createWorkSpaces {
    //NOTE: To create a new workspace I subclass C4CanvasController, and create an XIB for the class
    //I then have to set the main view of the XIB to be a C4View!!! this is an important step
    
    //create workspace A
    workspaceA = [[WorkSpaceA alloc] initWithNibName:@"WorkSpaceA" bundle:[NSBundle mainBundle]];
    [workspaceA setup];
    
    //create workspace B
    workspaceB = [[WorkSpaceB alloc] initWithNibName:@"WorkSpaceB" bundle:[NSBundle mainBundle]];
    [workspaceB setup];
}

-(void)createAddButtons {
    //create button A
    buttonA = [C4Button buttonWithType:ROUNDEDRECT];
    buttonA.frame = CGRectMake(0,0,128,40);
    [buttonA setTitle:@"WorkSpace A" forState:NORMAL];
    
    //create button B
    buttonB = [C4Button buttonWithType:ROUNDEDRECT];
    buttonB.frame = CGRectMake(0,0,128,40);
    [buttonB setTitle:@"WorkSpace B" forState:NORMAL];
    
    //position them
    buttonA.center = CGPointMake(self.canvas.center.x, self.canvas.center.y - 100);
    buttonB.center = CGPointMake(self.canvas.center.x, self.canvas.center.y + 100);
    
    //give them methods to run
    [buttonA runMethod:@"goToA" target:self forEvent:TOUCHUPINSIDE];
    [buttonB runMethod:@"goToB" target:self forEvent:TOUCHUPINSIDE];
    
    //add them to the canvas
    [self.canvas addObjects:@[buttonA,buttonB]];
}

//pushes workspaceA onto the stack
-(void)goToA {
    [self.navigationController pushViewController:workspaceA animated:YES];
}

//pushes workspaceB onto the stack
-(void)goToB {
    [self.navigationController pushViewController:workspaceB animated:YES];
}

@end
