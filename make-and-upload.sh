#!/bin/bash -xe
for p in posts/* ; do ~/blog.sh/restore-file-mtime.sh $p ; done # shlemiel the painter has a blog, too
~/blog.sh/make-all.sh
for f in $1/*
do
  gzip -9 $f
  mv ${f}.gz $f
done
s3cmd sync --add-header='Content-Encoding: gzip' $1 s3://www.leebutterman.com/
