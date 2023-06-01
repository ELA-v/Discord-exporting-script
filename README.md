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

These files are supposed to be interactive, only token and the exporting tool are needed, once that is done the script will ask you for a server ID and then for an output PATH for your export.

## Output files
## Examining the script
