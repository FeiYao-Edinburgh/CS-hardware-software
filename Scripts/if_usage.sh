MIN_VAL=1
MAX_VAL=100
INT=50
if [[ "$INT" =~ ^-?[0-9]+$ ]]; then
    if ((INT>MIN_VAL && INT<MAX_VAL)); then # if [[ $INT -gt $MIN_VAL && $INT -lt $MAX_VAL ]], if [ $INT -gt $MIN_VAL -a $INT -lt $MAX_VAL ], if [[ INT -gt MIN_VAL && INT -lt MAX_VAL ]]. These tests are recommended in an descending order.
        echo "$INT is within $MIN_VAL to $MAX_VAL."
    else
        echo "$INT is out of range."
    fi
else
    echo "INT is not an integer." >&2
    exit 1
fi