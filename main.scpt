set focus_delay to 0.2
set key_delay to 0.06
set accent_delay to 0.12

set input to do shell script "pbpaste"

if (input is not missing value) then
	tell application "System Events"
		delay focus_delay
		repeat with char in the characters of input
			if char is return then
				key code 36
			else if char is tab then
				key code 48
			else if char is space then
				key code 49
			else if char is "á" then
				keystroke "e" using {option down}
				keystroke "a"
			else if char is "é" then
				keystroke "e" using {option down}
				keystroke "e"
			else if char is "í" then
				keystroke "e" using {option down}
				keystroke "i"
			else if char is "ó" then
				keystroke "e" using {option down}
				keystroke "o"
			else if char is "ú" then
				keystroke "e" using {option down}
				keystroke "u"
			else if char is "Á" then
				keystroke "e" using {option down}
				keystroke "a" using {shift down}
			else if char is "É" then
				keystroke "e" using {option down}
				keystroke "e" using {shift down}
			else if char is "Í" then
				keystroke "e" using {option down}
				keystroke "i" using {shift down}
			else if char is "Ó" then
				keystroke "e" using {option down}
				keystroke "o" using {shift down}
			else if char is "Ú" then
				keystroke "e" using {option down}
				keystroke "u" using {shift down}
			else if char is "ñ" then
				keystroke "n" using {option down}
				keystroke "n"
			else if char is "Ñ" then
				keystroke "n" using {option down}
				keystroke "n" using {shift down}
			else if char is "ü" then
				keystroke "u" using {option down}
				keystroke "u"
			else if char is "Ü" then
				keystroke "u" using {option down}
				keystroke "u" using {shift down}
			else if char is "¿" then
				keystroke "/" using {option down, shift down}
			else if char is "¡" then
				keystroke "1" using {option down}
			else
				keystroke char
			end if
			if (id of char) > 127 then
				delay accent_delay
			else
				delay key_delay
			end if
		end repeat
	end tell
end if
