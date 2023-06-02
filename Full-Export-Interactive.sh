#!/bin/bash
## This script will make a whole server export.
## 
## EXPORT_DATE export made possible by: https://stackoverflow.com/questions/65154428/how-to-echo-text-containing-with-double-quotes.
##
## Converting to epoch time taken from: https://stackoverflow.com/questions/10990949/convert-date-time-string-to-epoch-in-bash And from: https://www.oreilly.com/library/view/bash-cookbook/0596526784/ch11s04.html (Second link is the best one).
##
## Examples of dates, from the coreutils manual: https://www.gnu.org/software/coreutils/manual/html_node/Examples-of-date.html A reduced version of the manual is available as a manpage for date in linux.
##
## This is a way to input single quotes without breaking a variable call:
##                  \'${Input}\'
##
##
## DATE="`date +%B-%d-%Y`"
##
EXPORT_DATE=`(date --date="last week UTC" '+%Y-%m-%d-00:00')` ## Will output the date of 7 days ago at 00:00, adjusted to the timezone (UTC in this case, change as you need). 
LASTWEEK=`(date --date="last week" +%B-%d-%Y)`
TODAY="`(date +%B-%d-%Y)`"
## Different date format: (date --date="last week" +'%Y-%m-%d-%H·%M%p')`

## Paste your data inside the single quotes.

TOKEN='Your token here'
OUTPUT_DIRECTORY="" ## Make sure this path doesn't have a slash at the end.
CHAT_EXPORTER_DIRECTORY='' ## The directory of the chat exporting tool.

cd ${CHAT_EXPORTER_DIRECTORY}

echo Enter server ID
read SERVER_ID
echo Enter output directory
read OUTPUT_DIRECTORY

dotnet DiscordChatExporter.Cli.dll exportguild -g ${SERVER_ID} --parallel 2 -p 100mb -t ${TOKEN} -o "${OUTPUT_DIRECTORY}/[FULL] %G [${TODAY}]/[%P] %T/[%p] %C.html"

## Having other types of quotes for the output path breaks the tool, using the example of line 11 messes up the path, having spaces in the export date breaks the tool too.
## No slashes, colons, or asterisks are allowed on paths. "| is also not allowed"
##
## FOLDER STRUCTURE: The script creates the following directory structure.
##
##  /'Server name' [Last week date]-[Today's date]/
##           |---> [Category position] Category name/
##                |---> [Channel position] Channel name.html
##                |---> [Channel position] Channel name.html
##
## JANS
