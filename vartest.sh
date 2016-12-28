#!/bin/bash
 
# This script tests whether a variable is set.  If not,
# it exits printing a message.
 
echo ${TESTVAR:?"There's so much I still wanted to do..."}
echo "TESTVAR is set, we can proceed."