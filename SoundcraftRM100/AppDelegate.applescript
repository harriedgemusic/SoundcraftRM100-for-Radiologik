
script AppDelegate
    property parent : class "NSObject"
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
    property cts : 0
    property dcd : 0
    property dsr : 0
    property rng : 0
    property rts : 0
    property cnt : 0
    property cntF : 0
    property dcdc : 0
    property dcdcF : 0
    property dsrc : 0
    property dsrcF : 0
    property ric : 0
    property ricF : 0
    property myTimer1: missing value
    property portRef : 0

    
    
    on applicationWillFinishLaunching:aNotification
        activate
        tell labelInactive1 to setHidden_(1)
        tell labelInactive2 to setHidden_(1)
        tell labelInactive3 to setHidden_(1)
        tell labelInactive4 to setHidden_(1)
        tell labelActive1 to setHidden_(1)
        tell labelActive2 to setHidden_(1)
        tell labelActive3 to setHidden_(1)
        tell labelActive4 to setHidden_(1)
        tell ledGreen1 to setHidden_(1)
        tell ledGreen2 to setHidden_(1)
        tell ledGreen3 to setHidden_(1)
        tell ledGreen4 to setHidden_(1)
        tell ledRed1 to setHidden_(1)
        tell ledRed2 to setHidden_(1)
        tell ledRed3 to setHidden_(1)
        tell ledRed4 to setHidden_(1)
        tell ledNone1 to setHidden_(0)
        tell ledNone2 to setHidden_(0)
        tell ledNone3 to setHidden_(0)
        tell ledNone4 to setHidden_(0)
        tell labelNA1 to setHidden_(0)
        tell labelNA2 to setHidden_(0)
        tell labelNA3 to setHidden_(0)
        tell labelNA4 to setHidden_(0)
        
    end applicationWillFinishLaunching:
    
    
    on applicationDidFinishLaunching:aNotification
        set portRef to serialport open "/dev/cu.usbserial" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0
        if portRef is -1 then
            tell cautionIcon to setHidden_(0)
            tell cautionText to setHidden_(0)
        end if
        set myTimer1 to current application's NSTimer's scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(0.01,me,"doSomething1:",missing value,true)
        tell labelNA1 to setHidden_(1)
        tell labelNA2 to setHidden_(1)
        tell labelNA3 to setHidden_(1)
        tell labelNA4 to setHidden_(1)
        tell labelInactive1 to setHidden_(0)
        tell labelInactive2 to setHidden_(0)
        tell labelInactive3 to setHidden_(0)
        tell labelInactive4 to setHidden_(0)
        log "The timers are starting."
        return
    end applicationDidFinishLaunching:
        
    
    on doSomething1_(aArgument)
        set cts to serialport status my portRef line 0
        set dcd to serialport status my portRef line 3
        set dsr to serialport status my portRef line 4
        set rng to serialport status my portRef line 5
        
        if cts is -1 then
            myTimer1's invalidate()
            tell ledGreen1 to setHidden_(1)
            tell ledGreen2 to setHidden_(1)
            tell ledGreen3 to setHidden_(1)
            tell ledGreen4 to setHidden_(1)
            tell ledRed1 to setHidden_(1)
            tell ledRed2 to setHidden_(1)
            tell ledRed3 to setHidden_(1)
            tell ledRed4 to setHidden_(1)
            tell labelInactive1 to setHidden_(1)
            tell labelInactive2 to setHidden_(1)
            tell labelInactive3 to setHidden_(1)
            tell labelInactive4 to setHidden_(1)
            tell labelActive1 to setHidden_(1)
            tell labelActive2 to setHidden_(1)
            tell labelActive3 to setHidden_(1)
            tell labelActive4 to setHidden_(1)
            tell labelNA1 to setHidden_(0)
            tell labelNA2 to setHidden_(0)
            tell labelNA3 to setHidden_(0)
            tell labelNA4 to setHidden_(0)
            tell ledNone1 to setHidden_(0)
            tell ledNone2 to setHidden_(0)
            tell ledNone3 to setHidden_(0)
            tell ledNone4 to setHidden_(0)
        end if
        
        if cts is 1 then
            set cnt to cnt + 1
        end if
        if cts is 0 then
            set cntF to cntF + 1
        end if
        
        if dcd is 1 then
            set dcdc to dcdc + 1
        end if
        if dcd is 0 then
            set dcdcF to dcdcF + 1
        end if
        
        if dsr is 1 then
            set dsrc to dsrc + 1
        end if
        if dsr is 0 then
            set dsrcF to dsrcF + 1
        end if
        
        if rng is 1 then
            set ric to ric + 1
        end if
        if rng is 0 then
            set ricF to ricF + 1
        end if
        
        if cnt = 1 then
            tell application "System Events" to click button 4 of group 1 of window "1 - PLAYLIST.apls" of process "OnTheAir Studio"
            set cntF to 0
            tell ledNone1 to setHidden_(1)
            tell ledRed1 to setHidden_(1)
            tell labelInactive1 to setHidden_(1)
            tell labelNA1 to setHidden_(1)
            tell ledGreen1 to setHidden_(0)
            tell labelActive1 to setHidden_(0)
            else if cnt is not 1 then
            log "sucsess"
        end if
        
        if cntF = 1 then
            tell application "System Events" to click button 2 of group 1 of window "1 - PLAYLIST.apls" of process "OnTheAir Studio"
            set cnt to 0
            tell ledNone1 to setHidden_(1)
            tell ledGreen1 to setHidden_(1)
            tell labelActive1 to setHidden_(1)
            tell labelNA1 to setHidden_(1)
            tell ledRed1 to setHidden_(0)
            tell labelInactive1 to setHidden_(0)
            else if cntF is not 1 then
            log "sucsess"
        end if
        
        if dcdc = 1 then
            tell application "System Events" to click button 4 of group 1 of window "2 - SINGLE FILE.apls" of process "OnTheAir Studio"
            set dcdcF to 0
            tell ledNone2 to setHidden_(1)
            tell ledRed2 to setHidden_(1)
            tell labelInactive2 to setHidden_(1)
            tell labelNA2 to setHidden_(1)
            tell labelActive2 to setHidden_(0)
            tell ledGreen2 to setHidden_(0)
            else if dcdc is not 1 then
            log "sucsess"
        end if
        
        if dcdcF = 1 then
            tell application "System Events" to click button 2 of group 1 of window "2 - SINGLE FILE.apls" of process "OnTheAir Studio"
            set dcdc to 0
            tell ledNone2 to setHidden_(1)
            tell ledGreen2 to setHidden_(1)
            tell labelActive2 to setHidden_(1)
            tell labelNA2 to setHidden_(1)
            tell ledRed2 to setHidden_(0)
            tell labelInactive2 to setHidden_(0)
            else if dcdcF is not 1 then
            log "sucsess"
        end if
        
        if dsrc = 1 then
            tell application "System Events" to click button 4 of group 1 of window "3 - SINGLE FILE.apls" of process "OnTheAir Studio"
            set dsrcF to 0
            tell ledNone3 to setHidden_(1)
            tell ledRed3 to setHidden_(1)
            tell labelInactive3 to setHidden_(1)
            tell labelNA3 to setHidden_(1)
            tell labelActive3 to setHidden_(0)
            tell ledGreen3 to setHidden_(0)
            else if dsrc is not 1 then
            log "sucsess"
        end if
        
        if dsrcF = 1 then
            tell application "System Events" to click button 2 of group 1 of window "3 - SINGLE FILE.apls" of process "OnTheAir Studio"
            set dsrc to 0
            tell ledNone3 to setHidden_(1)
            tell ledGreen3 to setHidden_(1)
            tell labelActive3 to setHidden_(1)
            tell labelNA3 to setHidden_(1)
            tell ledRed3 to setHidden_(0)
            tell labelInactive3 to setHidden_(0)
            else if dsrcF is not 1 then
            log "sucsess"
        end if
        
        if ric = 1 then
            tell application "System Events" to click button 4 of group 1 of window "4 - BACKGROUND.apls" of process "OnTheAir Studio"
            set ricF to 0
            tell ledNone4 to setHidden_(1)
            tell ledRed4 to setHidden_(1)
            tell labelInactive4 to setHidden_(1)
            tell labelNA4 to setHidden_(1)
            tell labelActive4 to setHidden_(0)
            tell ledGreen4 to setHidden_(0)
            else if ric is not 1 then
            log "sucsess"
        end if
        
        if ricF = 1 then
            tell application "System Events" to click button 2 of group 1 of window "4 - BACKGROUND.apls" of process "OnTheAir Studio"
            set ric to 0
            tell ledNone4 to setHidden_(1)
            tell ledGreen4 to setHidden_(1)
            tell labelActive4 to setHidden_(1)
            tell labelNA4 to setHidden_(1)
            tell labelInactive4 to setHidden_(0)
            tell ledRed4 to setHidden_(0)
            else if ricF is not 1 then
            log "sucsess"
        end if
        log cts & dcd & dsr & rng
        
    end doSomething1_

    on portOff_(sender)
        serialport close my portRef
    end portOff_
    
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script
