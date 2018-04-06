# PESA OFF - script handler
script pesaOffButtonHandler
    use scripting additions
on pesaOff:pLED0 pesaOff:pLED1 pesaOff:pLED2 pesaOff:cTEXT pesaOff:closedLED pesaOff:cautLEDset PESAledOFF to pLED0
set PESAledON1 to pLED1
set PESAledON2 to pLED2
set cautionText to cTEXT
set PortClosedLabel to closedLED
set PESAcaution to cautLED	display dialog "MSK's fader is ON?" buttons {"YES", "NO"} default button 1	set x to button returned of result	if x is "YES" then				set portPesa to serialport open "/dev/cu.serial1" bps rate 9600 data bits 8 parity 0 stop bits 1 handshake 0		if portPesa is -1 then			            tell PESAledOFF to setHidden:1            			tell  PESAledON1 to setHidden:1			tell  PESAledON2 to setHidden:1			tell  cautionText to setHidden:0			tell  PortClosedLabel to setHidden:1			tell  PESAcaution to setHidden:1			log "PESA's serial port is unavailable"		else			set pesaCommandOffStream to MakeString({72, 48, 48, 56, 48, 48, 52, 48, 48, 52, 48, 48, 52, 48, 48, 52, 53, 49, 10})			serialport write pesaCommandOffStream to portPesa			delay 0.5			serialport close my portPesa			tell PortClosedLabel to setHidden:1			tell PESAcaution to setHidden:1			tell PESAledON1 to setHidden:1			tell PESAledON2 to setHidden:1			tell PESAledOFF to setHidden:0		end if	end if	if x is "NO" then		log "NOTHING TO DO"	end if    end pesaOff:end script