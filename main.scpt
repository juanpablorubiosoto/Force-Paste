set input to do shell script "pbpaste"

if (input is not missing value) then
	do shell script "FP_TEXT=" & quoted form of input & " /usr/bin/osascript -l JavaScript -e " & quoted form of jxa_script
end if
