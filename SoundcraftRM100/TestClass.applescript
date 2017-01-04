--
--  AppDelegate.applescript
--  RM-100 FaderController
--
--  Created by Radio On-Air on 09.12.16.
--  Copyright � 2016 Radio On-Air. All rights reserved.
--

script TestClass
    property parent : class "NSObject"
    
    -- IBOutlets
    property theWindow : missing value
    
    
    
    on applicationWillFinishLaunching:aNotification
        -- Insert code here to initialize your application before any files are opened
    end applicationWillFinishLaunching:
    
    -- ///////////////////////////////////////////////////////////////////////
    -- ///////////////////////////      TEST BUTTONS        //////////////////
    -- ///////////////////////////////////////////////////////////////////////
    
    on init()
        continue init()
        return me
    end init
    
    
    
    on specialFunction()
        
        display alert "test"
    end specialFunction
    
    -- ///////////////////////////////////////////////////////////////////////
    -- ///////////////////////////      TEST BUTTONS        //////////////////
    -- ///////////////////////////////////////////////////////////////////////
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script
