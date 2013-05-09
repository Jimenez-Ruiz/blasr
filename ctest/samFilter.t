For testing samFilter
Set up directories
  $ CURDIR=$TESTDIR
  $ REMOTEDIR=/mnt/secondary-siv/secondarytest/testdata/BlasrTestData/ctest
  $ DATDIR=$REMOTEDIR/data
  $ OUTDIR=$CURDIR/out
  $ STDDIR=$REMOTEDIR/stdout

Set up the executable: samFilter.
  $ BIN=$TESTDIR/../pbihdfutils/bin/
  $ EXEC=$BIN/samFilter

#Test samFilter with a *.sam file generated by blasr
  $ OUTFILE=$OUTDIR/lambda_bax_filter_1.sam
  $ STDFILE=$STDDIR/lambda_bax_filter_1.sam

  $ rm -f $OUTFILE
  $ $EXEC $DATDIR/lambda_bax.sam $DATDIR/lambda_ref.fasta $OUTFILE -minAccuracy 70 -minPctSimilarity 30 -hitPolicy all
  $ tail -n+6 $OUTFILE | md5sum 
  90918e80e7f62cc2bc907c7d4ebc47d0  -

#Test samFilter with -hitPolicy allbest
  $ OUTFILE=$OUTDIR/lambda_bax_filter_2.sam
  $ STDFILE=$STDDIR/lambda_bax_filter_2.sam

  $ rm -f $OUTFILE
  $ $EXEC $DATDIR/lambda_bax.sam $DATDIR/lambda_ref.fasta $OUTFILE -hitPolicy allbest
  $ tail -n+6 $OUTFILE | md5sum 
  c969dcb2c288168af34ceac3dfea6db1  -

#Test samFilter with -hitPolicy random   
  $ OUTFILE=$OUTDIR/lambda_bax_filter_3.sam
  $ STDFILE=$STDDIR/lambda_bax_filter_3.sam

  $ rm -f $OUTFILE
  $ $EXEC $DATDIR/lambda_bax.sam $DATDIR/lambda_ref.fasta $OUTFILE -hitPolicy random
  $ tail -n+6 $OUTFILE | md5sum 
  d6d006dcd8d558aa7680a783326428f0  -

#Test samFilter with -hitPolicy randombest   
  $ OUTFILE=$OUTDIR/lambda_bax_filter_4.sam
  $ STDFILE=$STDDIR/lambda_bax_filter_4.sam

  $ rm -f $OUTFILE
  $ $EXEC $DATDIR/lambda_bax.sam $DATDIR/lambda_ref.fasta $OUTFILE -hitPolicy randombest 
  $ tail -n+6 $OUTFILE | md5sum 
  27ea175208aa67a968a019175c03f4b8  -


#Test samFilter with -scoreFunction 
  $ OUTFILE=$OUTDIR/lambda_bax_filter_5.sam
  $ STDFILE=$STDDIR/lambda_bax_filter_5.sam

  $ rm -f $OUTFILE
  $ $EXEC $DATDIR/lambda_bax.sam $DATDIR/lambda_ref.fasta $OUTFILE -scoreFunction alignerscore
  $ tail -n+6 $OUTFILE | md5sum 
  8accc624e674a81353a4642455659427  -

#Test samFilter with -holeNumbers
  $ OUTFILE=$OUTDIR/lambda_bax_filter_6.sam
  $ STDFILE=$STDDIR/lambda_bax_filter_6.sam

  $ rm -f $OUTFILE
  $ $EXEC $DATDIR/lambda_bax.sam $DATDIR/lambda_ref.fasta $OUTFILE -holeNumbers 101350-105000,21494 
  $ tail -n+6 $OUTFILE | md5sum 
  76c41aecfdcf4da6492b1b629d17614c  -


