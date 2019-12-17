# made-some-tools
made some tools 

## replaceLinks.sh

takes in an "old link to new link mapping csv or txt file" and "path/to/snapshot.droit.1.0" and replaces the old links in the mandates json files with the new links. 

Example command:

`./replaceLinks.sh bofa-mifir-links.csv path/to/snapshot.droit.1.0`

* will create an output affectedFiles.txt, which shows all the files that contained the old links
* replace all the old links in the mandates with the new links listed in the *bofa-mifir-links.csv*

Note: perform `chmod +x replaceLinks.sh` first to use it
