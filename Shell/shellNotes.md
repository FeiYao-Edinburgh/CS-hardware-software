1. When you cannot terminate a process by `Ctrl-C`, you can use `Ctrl-Z` to stop the command first, then use `jobs` to obtain its jobspec, finally use `kill -9 %jobspec` to kill it.
2. Short-cuts in Terminal to make life easier: Ctrl-left/right arrows to move between words quickly. Middle mouse button for quick copy and paste.
3. Short-cuts in Vim to make life easier: Ctrl/Shift-left/right arrows to move between words quickly. Visual code, v+left/right/up/down arrows to select a part of contexts, or Shift-v to select the whole line, then d for cut or y for copy, finally p for paste.
4. Double and single quotes functions differently when doing expansions, considering the following. Single quotes are more powerful. It is always a good habit to avoid having spaces or special characters in filenames.
```
echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER # All will be expanded.
echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER" # $(echo foo) $((2+2)) $USER will still be expanded.
echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER' # None will be expanded.
```
Nevertheless, if we assign a double or single quoted string with `*` to a variable, we can expand it again using `$`, considering the following.
```
a='*.csv' # This is similar to a=*.csv or a="*.csv", and hence $a is exactly *.csv.
echo $a # *.csv will be expanded and printed.
echo "$a" # Double quotes do not work for $ and hence it first becomes "*.csv". However, double quotes do work for * and hence *.csv printed eventually.
echo '$a' # Single quotes do not work for $ and hence $a printed directly.
```
5. Following 4, read more about variables.
6. Use bc to do math calculation in Terminal including floating numbers.
```
echo "9.45 / 2.327" | bc
echo "9.45 / 2.327" | bc -l
```
