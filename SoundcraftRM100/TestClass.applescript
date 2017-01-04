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
    property cautionIcon : missing value
    property cautionText : missing value
    property ledGreen1 : missing value
    property ledRed1 : missing value
    property ledNone1 : missing value
    property ledGreen2 : missing value
    property ledRed2 : missing value
    property ledNone2 : missing value
    property ledGreen3 : missing value
    property ledRed3 : missing value
    property ledNone3 : missing value
    property ledGreen4 : missing value
    property ledRed4 : missing value
    property ledNone4 : missing value
    property button : missing value
    property labelActive1 : missing value
    property labelActive2 : missing value
    property labelActive3 : missing value
    property labelActive4 : missing value
    property labelInactive1 : missing value
    property labelInactive2 : missing value
    property labelInactive3 : missing value
    property labelInactive4 : missing value
    property labelNA1 : missing value
    property labelNA2 : missing value
    property labelNA3 : missing value
    property labelNA4 : missing value
    property PESAledON1 : missing value
    property PESAledON2 : missing value
    property PESAledOFF : missing value
    property PESAcaution : missing value
    property PortClosedLabel : missing value
    
    
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
    end specialFunction
    
    on activeCnt1()
        tell ledNone1 to setHidden_(1)
        tell ledRed1 to setHidden_(1)
        tell labelInactive1 to setHidden_(1)
        tell labelNA1 to setHidden_(1)
        tell ledGreen1 to setHidden_(0)
        tell labelActive1 to setHidden_(0)
    end activeCnt1
    
    on activeCntF()
        tell ledNone1 to setHidden_(1)
        tell ledGreen1 to setHidden_(1)
        tell labelActive1 to setHidden_(1)
        tell labelNA1 to setHidden_(1)
        tell ledRed1 to setHidden_(0)
        tell labelInactive1 to setHidden_(0)
    end activeCntF
    
    on activeDCDC()
        tell ledNone2 to setHidden_(1)
        tell ledRed2 to setHidden_(1)
        tell labelInactive2 to setHidden_(1)
        tell labelNA2 to setHidden_(1)
        tell labelActive2 to setHidden_(0)
        tell ledGreen2 to setHidden_(0)
    end activeDCDC
    
    on activateDCDCF()
        tell ledNone2 to setHidden_(1)
        tell ledGreen2 to setHidden_(1)
        tell labelActive2 to setHidden_(1)
        tell labelNA2 to setHidden_(1)
        tell ledRed2 to setHidden_(0)
        tell labelInactive2 to setHidden_(0)
    end activateDCDCF
    
    on activeDSRC()
        tell ledNone3 to setHidden_(1)
        tell ledRed3 to setHidden_(1)
        tell labelInactive3 to setHidden_(1)
        tell labelNA3 to setHidden_(1)
        tell labelActive3 to setHidden_(0)
        tell ledGreen3 to setHidden_(0)
    end activeDSRC
    
    on activeDSRCF()
        tell ledNone3 to setHidden_(1)
        tell ledGreen3 to setHidden_(1)
        tell labelActive3 to setHidden_(1)
        tell labelNA3 to setHidden_(1)
        tell ledRed3 to setHidden_(0)
        tell labelInactive3 to setHidden_(0)
    end activeDSRCF
    
    on activeRIC()
        tell ledNone4 to setHidden_(1)
        tell ledRed4 to setHidden_(1)
        tell labelInactive4 to setHidden_(1)
        tell labelNA4 to setHidden_(1)
        tell labelActive4 to setHidden_(0)
        tell ledGreen4 to setHidden_(0)
    end activeRIC
    
    on activeRICF()
        tell ledNone4 to setHidden_(1)
        tell ledGreen4 to setHidden_(1)
        tell labelActive4 to setHidden_(1)
        tell labelNA4 to setHidden_(1)
        tell labelInactive4 to setHidden_(0)
        tell ledRed4 to setHidden_(0)
    end activeRICF
    
    -- ///////////////////////////////////////////////////////////////////////
    -- ///////////////////////////      TEST BUTTONS        //////////////////
    -- ///////////////////////////////////////////////////////////////////////
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script
