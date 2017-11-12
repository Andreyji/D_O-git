#!/bin/bash
touch /tmp/mytempfile
ls -al /tmp/
mkdir /tmp/mytempdir
mv /tmp/mytempfile /tmp/mytempdir/
ls -al /tmp/mytempdir
rm -rf /tmp/mytempdir

echo "+Done."
