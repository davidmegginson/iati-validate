# iati-validate
Simple shell script for validating remote IATI activity files

## Requirements
This script should run on any *nix system. It requires two common utilities:

* curl
* xmllint

These are both available in most *nix distributions.

## Usage
Validate an IATI activities file:

    sh iati-validate.sh <url>
    
Display command help:

    sh iati-validate.sh -h
    
## Notes
This utility validates against the IATI 2.03 schema, which is backwards-compatible with all 2.* versions.

You can install this as a command by removing the ".sh" extension, adding an executable permission, and moving it somewhere on your command path. Example:

    $ cp iati-validate.sh $HOME/bin/iati-validate
    $ chmod +x $HOME/bin/iati-validate

## Example

Validate DFID's Asia Regional activities file:

    $ sh iati-validate.sh "http://iati.dfid.gov.uk/iati_files/Region/DFID-Asia-regional-798.xml"
    
(or, if installed as a command)

    $ iati-validate "http://iati.dfid.gov.uk/iati_files/Region/DFID-Asia-regional-798.xml"

## License
This script is in the Public Domain.
