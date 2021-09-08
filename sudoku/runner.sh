input="./inputs.txt"
valid=true

while IFS= read -r line
do
  expectedRes=`eval ./checker $line`
  res=`eval $1 $line`
  if [ "$expectedRes" = "$res" ]; then
    echo "☑"
  else
    echo "❌ $line"
    valid=false
  fi
done < "$input"


if [ $valid = true ]; then
    echo "\n\n ☑ All tests passed successfully"
    exit 0
  else
    echo "\n\n ❌ Some tests failed."
    exit 1
  fi