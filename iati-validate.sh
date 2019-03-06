#!/bin/sh
########################################################################
# Bourne shell script to validate remote IATI activity files
#
# Requirements:
#   xmllint, curl (both available in most Linux distributions)
#
# Usage:
#   sh iati-validate.sh <url>
#
# This script is in the Public Domain.
#
# David Megginson, 2019-02-06
########################################################################

# IATI schema to use
IATI_ACTIVITIES_SCHEMA="http://reference.iatistandard.org/203/schema/downloads/iati-activities-schema.xsd"

# Display commandline help
show_help() {
    echo "$0 - validate a remote IATI activity file."
    echo ""
    echo "Usage: $0 <url>"
    echo "  url - complete URL of the IATI file (e.g. from the IATI Registry)"
}

# Test for the correct number of arguments
if [ "$#" -ne 1 ]; then
    show_help >&2
    echo "" >&2
    echo "**Error: wrong number of arguments $#" >&2
    exit 2
fi

# Special case: -h displays help
if [ "X$1" = "X-h" ]; then
    show_help
    exit 0
fi

# Try the actual download and validation
curl -sSLf "$1" | xmllint --noout --schema "$IATI_ACTIVITIES_SCHEMA" -

# Test the result
if [ $? -eq 0 ]; then
    echo ""
    echo "Success: $1 is a valid IATI 2.03 activities file"
    exit 0
else
    echo ""
    echo "**Error: $1 is not a valid IATI 2.03 activities file"
    exit 1
fi

# end
