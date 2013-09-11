~/blog.sh/make-all.sh
for f in slightlynew/*
do
  gzip -9 $f
  mv ${f}.gz $f
done
s3cmd sync --add-header='Content-Encoding: gzip' slightlynew s3://www.leebutterman.com/
