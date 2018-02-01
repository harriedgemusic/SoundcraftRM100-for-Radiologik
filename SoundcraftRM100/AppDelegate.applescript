use framework "Foundation"
use scripting additions

global PESAledOFF, PESAledON2, PESAledON1, PESAcaution, PortClosedLabel, PESAcontroller, pesaOffButtonHandler, AppDelegate
script AppDelegate
    
    property parent : class "NSObject"
    property name : "AppDelegate"
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
    property myTimer1 : missing value
    property myTimer2 : missing value
    property myTimer3 : missing value
    property myTimer4 : missing value
    property portRef : 0
    property portPesa : 0
    property file1 : "SoundcraftRM100:list1.apls"
    property myPESAcontroller : missing value
    
    on applicationWillFinishLaunching:aNotification
        set my myPESAcontroller to current application's PESAcontroller's alloc()'s itit()
        my myPESAcontroller's method()
    end applicationWillFinishLaunching:
    
    #    on AnotherScript_(sender)
    #        set my TestClass to current application's TestClass's alloc()'s init()
    #        try
    #            set theResult to (my TestClass's activeRIC())
    #            display dialog (theResult as text)
    #            on error
    #            display dialog "Error occured"
    #        end try
    #    end AnotherScript_
    
    # ==== INITIALIZATION
    
    on applicationDidFinishLaunching:aNotification
        # open serial port
        set portRef to serialport open "/dev/cu.usbserial" bps rate 19200 data bits 8 parity 0 stop bits 1 handshake 0
        
        # if serial port disconnected then set LED to RED
        if portRef is -1 then
            tell PESAledOFF to setHidden:1
            tell PESAledON1 to setHidden:1
            tell PESAledON2 to setHidden:1
            tell PESAcaution to setHidden:1
            tell cautionText to setHidden:0
        end if
        
        # setting fader's timers
        set myTimer1 to current application's NSTimer's scheduledTimerWithTimeInterval:0.01 target:me selector:"doSomething1:" userInfo:(missing value) repeats:true
        set myTimer2 to current application's NSTimer's scheduledTimerWithTimeInterval:0.01 target:me selector:"doSomething2:" userInfo:(missing value) repeats:true
        set myTimer3 to current application's NSTimer's scheduledTimerWithTimeInterval:0.01 target:me selector:"doSomething3:" userInfo:(missing value) repeats:true
        
        # setting init values
        tell PortClosedLabel to setHidden:1
        tell PESAcaution to setHidden:1
        tell labelNA1 to setHidden:1
        tell labelNA2 to setHidden:1
        tell labelNA3 to setHidden:1
        tell labelNA4 to setHidden:1
        tell ledNone1 to setHidden:1
        tell ledNone2 to setHidden:1
        tell ledNone3 to setHidden:1
        tell ledNone4 to setHidden:1
        tell labelInactive1 to setHidden:0
        tell labelInactive2 to setHidden:0
        tell labelInactive3 to setHidden:0
        tell labelInactive4 to setHidden:0
        tell ledRed1 to setHidden:0
        tell ledRed2 to setHidden:0
        tell ledRed3 to setHidden:0
        tell ledRed4 to setHidden:0
        log "The timers are starting."
        return
    end applicationDidFinishLaunching:
    
    # run timer of CTS
    
    on doSomething1:aArgument
        
        # get cts status
        set cts to serialport status my portRef line 0
        
        if cts is -1 then
            myTimer1's invalidate()
            tell ledGreen1 to setHidden:1
            tell ledRed1 to setHidden:1
            tell labelInactive1 to setHidden:1
            tell labelActive1 to setHidden:1
            tell labelNA1 to setHidden:0
            tell ledNone1 to setHidden:0
        end if
        
        # check cts
        if cts is 1 then
            set cnt to cnt + 1
        end if
        if cts is 0 then
            set cntF to cntF + 1
        end if
        
        if cnt is 1 then
            tell application "System Events" to click button 6 of window 1 of process "Radiologik DJ"
            set cntF to 0
            tell ledRed1 to setHidden:1
            tell labelInactive1 to setHidden:1
            tell ledGreen1 to setHidden:0
            tell labelActive1 to setHidden:0
        end if
        
        if cntF is 1 then
            tell application "System Events" to click button 5 of window 1 of process "Radiologik DJ"
            set cnt to 0
            tell ledGreen1 to setHidden:1
            tell labelActive1 to setHidden:1
            tell ledRed1 to setHidden:0
            tell labelInactive1 to setHidden:0
        end if
    end doSomething1:
    
    # run timer of DCD
    
    on doSomething2:aArgument
        
         # get dcd status
         
        set dcd to serialport status my portRef line 3
        
        if dcd is -1 then
            myTimer2's invalidate()
            tell ledGreen2 to setHidden:1
            tell ledRed2 to setHidden:1
            tell labelInactive2 to setHidden:1
            tell labelActive2 to setHidden:1
            tell labelNA2 to setHidden:0
            tell ledNone2 to setHidden:0
        end if
        
        # check dcd
        
        if dcd is 1 then
            set dcdc to dcdc + 1
        end if
        if dcd is 0 then
            set dcdcF to dcdcF + 1
        end if
        
        if dcdc is 1 then
            tell application "System Events" to click button 13 of window 1 of process "Radiologik DJ"
            set dcdcF to 0
            tell ledRed2 to setHidden:1
            tell labelInactive2 to setHidden:1
            tell labelActive2 to setHidden:0
            tell ledGreen2 to setHidden:0
        end if
        
        if dcdcF is 1 then
            tell application "System Events" to click button 12 of window 1 of process "Radiologik DJ"
            set dcdc to 0
            tell ledGreen2 to setHidden:1
            tell labelActive2 to setHidden:1
            tell ledRed2 to setHidden:0
            tell labelInactive2 to setHidden:0
        end if
    end doSomething2:
    
    # run timer of DSR
    
    on doSomething3:aArgument
        set dsr to serialport status my portRef line 4
        if dsr is -1 then
            myTimer3's invalidate()
            tell ledGreen3 to setHidden:1
            tell ledRed3 to setHidden:1
            tell labelInactive3 to setHidden:1
            tell labelActive3 to setHidden:1
            tell labelNA3 to setHidden:0
            tell ledNone3 to setHidden:0
        end if
        
        # check dsr
        
        if dsr is 1 then
            set dsrc to dsrc + 1
        end if
        if dsr is 0 then
            set dsrcF to dsrcF + 1
        end if
        
        if dsrc is 1 then
            tell application "System Events" to click button 10 of window 1 of process "Radiologik DJ"
            set dsrcF to 0
            tell ledRed3 to setHidden:1
            tell labelInactive3 to setHidden:1
            tell labelActive3 to setHidden:0
            tell ledGreen3 to setHidden:0
        end if
        
        if dsrcF is 1 then
            tell application "System Events" to click button 9 of window 1 of process "Radiologik DJ"
            set dsrc to 0
            tell ledGreen3 to setHidden:1
            tell labelActive3 to setHidden:1
            tell ledRed3 to setHidden:0
            tell labelInactive3 to setHidden:0
        end if
        
    end doSomething3:
    
    # SERIAL PORT CLOSER

    on portOff:sender
        if portRef is -1 then
            tell PESAcaution to setHidden:1
            tell cautionText to setHidden:1
             tell PESAledOFF to setHidden:1
            log "PESA's serial port is unavailable (port closer)"
            else
            serialport close my portRef
            tell PESAcaution to setHidden:1
            tell PESAledOFF to setHidden:1
            tell PESAledON1 to setHidden:1
            tell PESAledON2 to setHidden:1
            tell cautionText to setHidden:1
            tell PortClosedLabel to setHidden:0
            log "PESA's serial port is CLOSED(port closer)"
        end if
    end portOff:
    
    # PESA SWITCH to MSK
    on pesaToMSK:sender
        current application's pesaSwithToMskHandler's pesaSwToMsk:PESAledOFF pesaSwToMsk:PESAledON1 pesaSwToMsk:PESAledON2 pesaSwToMsk:cautionText pesaSwToMsk:PortClosedLabel pesaSwToMsk:PESAcaution
    end pesaToMSK:
    
    # PESA SWITCH to MSK (RESERVED SATELLITE)
    on pesaToMSK2:sender
        current application's pesaSwithToMskRHandler's pesaSwToMsk2:PESAledOFF pesaSwToMsk2:PESAledON1 pesaSwToMsk2:PESAledON2 pesaSwToMsk2:cautionText pesaSwToMsk2:PortClosedLabel pesaSwToMsk2:PESAcaution
    end pesaToMSK2:
    
    # PESA SWITCH FROM MSK TO MIXER
    
    on pesaFromMSK:sender
        current application's pesaSwithFromMskHandler's pesaSwFromMsk:PESAledOFF pesaSwFromMsk:PESAledON1 pesaSwFromMsk:PESAledON2 pesaSwFromMsk:cautionText pesaSwFromMsk:PortClosedLabel pesaSwFromMsk:PESAcaution
    end pesaFromMSK:
    
    # PESA SWITCH FROM MSK TO MIXER (FROM RESERVED SATELLITE)
    
    on pesaFromMSK2:sender
        current application's pesaSwithFromMskRHandler's pesaSwFromMsk2:PESAledOFF pesaSwFromMsk2:PESAledON1 pesaSwFromMsk2:PESAledON2 pesaSwFromMsk2:cautionText pesaSwFromMsk2:PortClosedLabel pesaSwFromMsk2:PESAcaution
    end pesaFromMSK2:
    
  # Handler of button "PESA OFF"
  
    on pesaOffbutton:sender
        current application's pesaOffButtonHandler's pesaOff:PESAledOFF pesaOff:PESAledON1 pesaOff:PESAledON2 pesaOff:cautionText pesaOff:PortClosedLabel pesaOff:PESAcaution
    end pesaOffbutton:
    
    on applicationShouldTerminate:sender
        -- Insert code here to do any housekeeping before your application quits
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
end script
