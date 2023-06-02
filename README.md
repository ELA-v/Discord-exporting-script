# Discord-exporting-script
This bash script is made to perfectly archive a discord server. It requires Tyrzz discord chat exporter.
I have created this template in the hopes many other people use it, it creates a layout that aims to be as close as the original server is currently shown. Putting the server name on a folder, followed by category folders, and finally the channels of each numbered in order.

FOLDER STRUCTURE: The script creates the following directory structure.

    /'Server name' [DATE]/
         |---> [Category position] Category name/
                |---> [Channel position] Channel name.html
                |---> [Channel position] Channel name.html

The full export script outputs: [SERVER_NAME][FULL]-[DATE].

The weekly export script outputs: [SERVER_NAME]{Last-week}-{Today}.
## Script explanation
-- ATTENTION --
You still need to manually edit the files. On line 23 of each file you will need to paste your discord token and the path to your chat exporter tool.

It is reccomended to not use a discord session while the exporter is working, just to prevent your account from making too many API calls and getting rate limited or your account flagged.

These files are supposed to be interactive, only token and the exporting tool are needed, once that is done the script will ask you for a server ID and then for an output PATH for your export.

Beware that the output files could be as big as a couple gigabytes if you are exporting an whole server, big and old servers can even get just a couple GBs for each channel. I reccomend you use the weekly export first for testing.

## Output files
The script outputs slpit HTML files into 100mbs for each channel, I set this limit since it is the biggest a file can be opened without eating all your ram or taking a while to open, it also makes it easier to navigate through the whole file.
## Examining the script
    dotnet DiscordChatExporter.Cli.dll exportguild -g ${SERVER_ID} --after ${EXPORT_DATE} --parallel 2 -p 100mb -t ${TOKEN} -o "${OUTPUT_DIRECTORY}/%G [${LASTWEEK}] - [${TODAY}]/[%P] %T/[%p] %C.html"
    
The script start by calling the CLI program using dotnet. Then uses the -g option which is for a server ID, then it goes with the --after parameter to make it know to only export after a certain date, the date is pulled at the start of the script using the gnu coreutils from linux and replaces them on the script (The full export doesn't use the date pull for a week, it just does a full export and attaches the date of the export on the filename).

We continue with the --parallel option which has a value of 2, this means that the exporting tool will be exporting TWO channels simultaneously, it is reccomended to NOT USE your current discord session while the archiving takes place, just in case. The value of 2 was selected because it was tested to be the most appropiate for export time because many channels take a while and you can finish exporting many other small channels while the big ones finish completion, and because 2 is the most you should be able to risk so you don't get your account flagged. Change at your own risk. Of course no one is going to start exporting 10 channels at the same time on their main account.

## Reccomendations 
7zip compressions becomes best when compressing the resulting files.
COMPRESSING THE HTML FILES WITH 7ZIP CAN GRANT UP TO 90% REDUCTION IN SIZE. From a couple hundred megabytes to 20/30mbs. From a few gigabytes to just 100/200mbs.

This is reccomended and encouraged for archival purposes.
