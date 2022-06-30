# Iterates through all files in a specified folder and uploads them as JSONs to the local AIFdb instance
# Takes one argument (the folder path), e.g. ./upload-corpora-to-AIFdb.sh ./downloads/britishempire
# AIFdb must be running on localhost, port 80

# Check if a folder path is provided
if [ $# -eq 0 ]
  then
    echo "Provide an argument for folder with JSON files"
fi

# Keeps track of names/count of uploaded files
processedFiles=""
processedFilesCount=0

# Iterates through all files in the folder
for f in "$1"/*
do
  echo "Processing $f"

  # Sends a POST request to localhost/json, with the current file attached
  curl -X POST -H "Cookie: XDEBUG_SESSION=XDEBUG_ECLIPSE;" -F "file=@$f" http://localhost/json/

  # Adds the name of the file to the string of all processed filenames
  processedFiles="$processedFiles, $(basename -- "$f")"
  ((processedFilesCount++));
done

# Outputs names and count of processed files
echo $processedFiles
echo "--"
echo $processedFilesCount
