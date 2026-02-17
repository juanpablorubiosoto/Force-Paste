set input to do shell script "pbpaste"

if (input is not missing value) then
	set jxa_script to "ObjC.import('ApplicationServices'); ObjC.import('stdlib'); ObjC.import('unistd'); function sendText(text){ var source=$.CGEventSourceCreate($.kCGEventSourceStateCombinedSessionState); var chars=Array.from(text); for (var i=0; i<chars.length; i++){ var ch=chars[i]; var event=$.CGEventCreateKeyboardEvent(source, 0, true); $.CGEventKeyboardSetUnicodeString(event, ch.length, ch); $.CGEventPost($.kCGHIDEventTap, event); $.CFRelease(event); var up=$.CGEventCreateKeyboardEvent(source, 0, false); $.CGEventKeyboardSetUnicodeString(up, ch.length, ch); $.CGEventPost($.kCGHIDEventTap, up); $.CFRelease(up); $.usleep(2000); } } var text=$.getenv('FP_TEXT'); if (text) { sendText(ObjC.unwrap(text)); }"
	do shell script "FP_TEXT=" & quoted form of input & " /usr/bin/osascript -l JavaScript -e " & quoted form of jxa_script
end if
