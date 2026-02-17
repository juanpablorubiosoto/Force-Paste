set focus_delay to 0.2
set key_delay to 0.06
set accent_delay to 0.12

set input to do shell script "pbpaste"

if (input is not missing value) then
	set input to my normalize_text(input)
	tell application "System Events"
		delay focus_delay
		repeat with char in the characters of input
			if char is return then
				key code 36
			else if char is tab then
				key code 48
			else if char is space then
				key code 49
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

on normalize_text(t)
	set t to my replace_text("á", "a", t)
	set t to my replace_text("é", "e", t)
	set t to my replace_text("í", "i", t)
	set t to my replace_text("ó", "o", t)
	set t to my replace_text("ú", "u", t)
	set t to my replace_text("Á", "A", t)
	set t to my replace_text("É", "E", t)
	set t to my replace_text("Í", "I", t)
	set t to my replace_text("Ó", "O", t)
	set t to my replace_text("Ú", "U", t)
	set t to my replace_text("ü", "u", t)
	set t to my replace_text("Ü", "U", t)
	set t to my replace_text("ñ", "n", t)
	set t to my replace_text("Ñ", "N", t)
	set t to my replace_text("¿", "?", t)
	set t to my replace_text("¡", "!", t)
	return t
end normalize_text

on replace_text(find_text, replace_text, source_text)
	set AppleScript's text item delimiters to find_text
	set text_items to text items of source_text
	set AppleScript's text item delimiters to replace_text
	set source_text to text_items as text
	set AppleScript's text item delimiters to ""
	return source_text
end replace_text
