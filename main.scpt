set numbers_key_codes to {82, 83, 84, 85, 86, 87, 88, 89, 91, 92}
set digits to "0123456789"

set input to do shell script "pbpaste"

if (input is not missing value) then
	tell application "System Events"
		repeat with char in the characters of input
			set digit_index to offset of char in digits
			if digit_index is greater than 0 then
				key code numbers_key_codes's item digit_index
			else
				keystroke char
			end if
		end repeat
	end tell
end if
