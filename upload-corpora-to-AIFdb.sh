# Iterates through all files in a specified folder and uploads them as JSONs to the local AIFdb instance
# Takes one argument, e.g. ./upload-corpora-to-AIFdb.sh ./downloads/britishempire
# AIFdb must be running on localhost, port 80

if [ $# -eq 0 ]
  then
    echo "Provide an argument for folder with JSON files"
fi

# Keeps track of names of uploaded files
processedFiles=""
processedFilesCount=0

for f in "$1"/*
do
  echo "Processing $f"
  curl -X POST -H "Cookie: XDEBUG_SESSION=XDEBUG_ECLIPSE;" -F "file=@$f" http://localhost/json/

  processedFiles="$processedFiles, $(basename -- "$f")"
  ((processedFilesCount++));
done

echo $processedFiles
echo "--"
echo $processedFilesCount