
script AppDelegate
    property parent : class "NSObject"
    property TestClass : missing value
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
    property portPesa : 0
    property file1 : "SoundcraftRM100:list1.apls"

    
    
    on applicationWillFinishLaunching:aNotification
    end applicationWillFinishLaunching:
    
    on AnotherScript_(sender)
        set my TestClass to current application's TestClass's alloc()'s init()
        try
            set theResult to (my TestClass's activeRIC())
#            display dialog (theResult as text)
            on error
            display dialog "Error occured"
        end try
    end AnotherScript_
    
    on applicationDidFinishLaunching:aNotification
        set portRef to serialport open "/dev/cu.usbserial" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0
        if portRef is -1 then
            tell PESAledOFF to setHidden_(1)
            tell PESAledON1 to setHidden_(1)
            tell PESAledON2 to setHidden_(1)
            tell PESAcaution to setHidden_(1)
            tell cautionText to setHidden_(0)
        end if
        set myTimer1 to current application's NSTimer's scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(0.1,me,"doSomething1:",missing value,true)
        tell PortClosedLabel to setHidden_(1)
        tell PESAcaution to setHidden_(1)
        tell labelNA1 to setHidden_(1)
        tell labelNA2 to setHidden_(1)
        tell labelNA3 to setHidden_(1)
        tell labelNA4 to setHidden_(1)
        tell labelInactive1 to setHidden_(0)
        tell labelInactive2 to setHidden_(0)
        tell labelInactive3 to setHidden_(0)
        tell labelInactive4 to setHidden_(0)
        tell ledRed1 to setHidden_(0)
        tell ledRed2 to setHidden_(0)
        tell ledRed3 to setHidden_(0)
        tell ledRed4 to setHidden_(0)
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
            tell application "System Events" to click button 4 of group 1 of window "list1.apls" of process "OnTheAir Studio"
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
            tell application "System Events" to click button 2 of group 1 of window "list1.apls" of process "OnTheAir Studio"
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
            tell application "System Events" to click button 4 of group 1 of window "list2.apls" of process "OnTheAir Studio"
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
            tell application "System Events" to click button 2 of group 1 of window "list2.apls" of process "OnTheAir Studio"
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
            tell application "System Events" to click button 4 of group 1 of window "list3.apls" of process "OnTheAir Studio"
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
            tell application "System Events" to click button 2 of group 1 of window "list3.apls" of process "OnTheAir Studio"
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
            tell application "System Events" to click button 4 of group 1 of window "list4.apls" of process "OnTheAir Studio"
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
            tell application "System Events" to click button 2 of group 1 of window "list4.apls" of process "OnTheAir Studio"
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
        if portRef is -1 then
            tell PESAcaution to setHidden_(1)
            tell cautionText to setHidden_(0)
            
        else
        serialport close my portRef
        tell PESAcaution to setHidden_(1)
        tell PESAledOFF to setHidden_(1)
        tell PESAledON1 to setHidden_(1)
        tell PESAledON2 to setHidden_(1)
        tell cautionText to setHidden_(1)
        tell PortClosedLabel to setHidden_(0)
        end if
    end portOff_
    
    on pesaToMSK_(sender)
        display dialog "MSK's fader is ON?" buttons {"YES", "NO"} default button 2
        set x to button returned of result
        if x is "YES" then
            set portPesa to serialport open "/dev/cu.serial1" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0
            if portPesa is -1 then
                tell PESAledOFF to setHidden_(1)
                tell PESAledON1 to setHidden_(1)
                tell PESAledON2 to setHidden_(1)
                tell cautionText to setHidden_(1)
                tell PortClosedLabel to setHidden_(1)
                tell PESAcaution to setHidden_(0)
                log "PESA's serial port is unavailable"
            else
            set pesaCommand1ToMSK to MakeString({72, 48, 48, 56, 48, 48, 50, 48, 48, 50, 48, 48, 50, 48, 48, 50, 52, 57, 10})
            set pesaCommand2ToMSK to MakeString({72, 48, 48, 50, 48, 48, 56, 48, 48, 56, 48, 48, 56, 48, 48, 56, 53, 59, 10})
            serialport write pesaCommand1ToMSK to portPesa
            delay 2
            serialport write pesaCommand2ToMSK to portPesa
            delay 2
            serialport close my portPesa
            tell PortClosedLabel to setHidden_(1)
            tell PESAledOFF to setHidden_(1)
            tell PESAledON2 to setHidden_(1)
            tell PESAledON1 to setHidden_(0)
            end if
        end if
        if x is "NO" then
            log x
        end if
    end pesaToMSK_
    
    on pesaToMSK2_(sender)
        display dialog "MSK's fader is ON?" buttons {"YES", "NO"} default button 2
        set x to button returned of result
        if x is "YES" then
            set portPesa to serialport open "/dev/cu.serial1" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0
            if portPesa is -1 then
                tell PESAledOFF to setHidden_(1)
                tell PESAledON1 to setHidden_(1)
                tell PESAledON2 to setHidden_(1)
                tell cautionText to setHidden_(1)
                tell PortClosedLabel to setHidden_(1)
                tell PESAcaution to setHidden_(0)
                log "PESA's serial port is unavailable"
            else
            set pesaCommand3ToMSK to MakeString({72, 48, 48, 56, 48, 48, 54, 48, 48, 54, 48, 48, 54, 48, 48, 54, 53, 57, 10})
            set pesaCommand4ToMSK to MakeString({72, 48, 48, 50, 48, 48, 56, 48, 48, 56, 48, 48, 56, 48, 48, 56, 53, 59, 10})
            serialport write pesaCommand3ToMSK to portPesa
            delay 2
            serialport write pesaCommand4ToMSK to portPesa
            delay 2
            serialport close my portPesa
            tell PortClosedLabel to setHidden_(1)
            tell PESAledOFF to setHidden_(1)
            tell PESAledON1 to setHidden_(1)
            tell PESAledON2 to setHidden_(0)
            end if
        end if
        if x is "NO" then
            log x
        end if
    end pesaToMSK2_
    
    on pesaFromMSK_(sender)
            set portPesa to serialport open "/dev/cu.serial1" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0
            if portPesa is -1 then
                tell PESAledOFF to setHidden_(1)
                tell PESAledON1 to setHidden_(1)
                tell PESAledON2 to setHidden_(1)
                tell cautionText to setHidden_(1)
                tell PortClosedLabel to setHidden_(1)
                tell PESAcaution to setHidden_(0)
                log "PESA's serial port is unavailable"
            else
            set pesaCommand5FromMSK to MakeString({72, 48, 48, 50, 48, 48, 50, 48, 48, 50, 48, 48, 50, 48, 48, 50, 52, 51, 10})
            set pesaCommand6FromMSK to MakeString({72, 48, 48, 54, 48, 48, 50, 48, 48, 50, 48, 48, 50, 48, 48, 50, 52, 55, 10})
            serialport write pesaCommand5FromMSK to portPesa
            delay 2
            serialport write pesaCommand6FromMSK to portPesa
            delay 2
            serialport close my portPesa
            tell PortClosedLabel to setHidden_(1)
            tell PESAledON1 to setHidden_(1)
            tell PESAledON2 to setHidden_(1)
            tell PESAledOFF to setHidden_(0)
            end if
    end pesaFromMSK_
    
    on pesaFromMSK2_(sender)
        set portPesa to serialport open "/dev/cu.serial1" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0
        if portPesa is -1 then
            tell PESAledOFF to setHidden_(1)
            tell PESAledON1 to setHidden_(1)
            tell PESAledON2 to setHidden_(1)
            tell cautionText to setHidden_(1)
            tell PortClosedLabel to setHidden_(1)
            tell PESAcaution to setHidden_(0)
            log "PESA's serial port is unavailable"
        else
        set pesaCommand7FromMSK to MakeString({72, 48, 48, 50, 48, 48, 54, 48, 48, 54, 48, 48, 54, 48, 48, 54, 53, 51, 10})
        set pesaCommand8FromMSK to MakeString({72, 48, 48, 54, 48, 48, 54, 48, 48, 54, 48, 48, 54, 48, 48, 54, 53, 55, 10})
        serialport write pesaCommand7FromMSK to portPesa
        delay 2
        serialport write pesaCommand8FromMSK to portPesa
        delay 2
        serialport close my portPesa
        tell PortClosedLabel to setHidden_(1)
        tell PESAledON2 to setHidden_(1)
        tell PESAledON1 to setHidden_(1)
        tell PESAledOFF to setHidden_(0)
        end if
    end pesaFromMSK2_
    
    on pesaOffbutton_(sender)
            display dialog "MSK's fader is ON?" buttons {"YES", "NO"} default button 1
            set x to button returned of result
            if x is "YES" then
                set portPesa to serialport open "/dev/cu.serial1" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0
                if portPesa is -1 then
                    tell PESAledOFF to setHidden_(1)
                    tell PESAledON1 to setHidden_(1)
                    tell PESAledON2 to setHidden_(1)
                    tell cautionText to setHidden_(1)
                    tell PortClosedLabel to setHidden_(1)
                    tell PESAcaution to setHidden_(0)
                    log "PESA's serial port is unavailable"
                else
                set pesaCommandOffStream to MakeString({72, 48, 48, 56, 48, 48, 52, 48, 48, 52, 48, 48, 52, 48, 48, 52, 53, 49, 10})
                serialport write pesaCommandOffStream to portPesa
                delay 2
                serialport close my portPesa
                tell PortClosedLabel to setHidden_(1)
                tell PESAcaution to setHidden_(1)
                tell PESAledON1 to setHidden_(1)
                tell PESAledON2 to setHidden_(1)
                tell PESAledOFF to setHidden_(0)
                end if
            end if
            if x is "NO" then
                tell PESAledOFF to setHidden_(1)
            end if
    end pesaOffbutton_
    
    on openPlaylists_(sender)
        set appURLList1 to quoted form of ((current application's NSBundle's mainBundle()'s pathForResource_ofType_("list1", "apls")) as string)
        set appURLList2 to quoted form of ((current application's NSBundle's mainBundle()'s pathForResource_ofType_("list2", "apls")) as string)
        set appURLList3 to quoted form of ((current application's NSBundle's mainBundle()'s pathForResource_ofType_("list3", "apls")) as string)
        set appURLList4 to quoted form of ((current application's NSBundle's mainBundle()'s pathForResource_ofType_("list4", "apls")) as string)
        do shell script "open " & appURLList1
        do shell script "open " & appURLList2
        do shell script "open " & appURLList3
        do shell script "open " & appURLList4
    end openPlaylists_
    
    on MakeString(theBytes)
        set thestr to ""
        repeat with i from 1 to length of theBytes
            set thestr to thestr & (ASCII character (item i of theBytes))
        end repeat
        return thestr
    end MakeString
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script
