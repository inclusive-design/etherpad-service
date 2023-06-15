# About

The files in this directory can be used to create a local instance of the pad.inclusivedesign.ca Etherpad service. A compressed version of its database is included. Information such as account email addresses and passwords was scrubbed from the database.

## Requirements:
- Docker
- [xz](https://tukaani.org/xz/)

## Deploy the container
Run the following wrapper script to decompress the SQLite database and start the Etherpad container:

``./run.sh``

Once the container is provisioned, Etherpad logs should be displayed in your terminal.

## Access the Etherpad service
Etherpad can be accessed by visiting the http://127.0.0.1:38097 URL. 

The [page_ids.txt](./page_ids.txt) file contains a list of all the pages stored in this instance's database.

To view a particular page, copy its ID from the file above, for example, *'windows-summit-29-7-16-alr4n2a'*, and append it to the instance's URL like so:

http://127.0.0.1:38097/p/windows-summit-29-7-16-alr4n2a
