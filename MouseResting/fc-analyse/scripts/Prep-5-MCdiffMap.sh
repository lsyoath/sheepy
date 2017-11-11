#******Parameters need to change******
rtpath=/data/380/data/ControlCocaine-Resting
gResult=${rtpath}/results/reward+control-irg-pca3-hab
zBackup=${rtpath}/zBackup/reward+control-irg-pca3-hab
prefix=AlphaSim; var=irg
var=irg-GMmask
ROIs='hab3'
dist=3.1; dir1=001; dir2=02; pth2s=".02"
vol=`ccalc -eval "3*3*3"`
n=78; df=`echo $n-2 | bc`; df=71
#**************************************

#C-AlphaSimforDmap.sh
cd ${gResult}
for roi in ${ROIs}
do
  rm -f mcUvN-${roi}-?+tlrc.*
  rm -f mcUvN-${roi}-?-order+tlrc.*
  cnt=1
  for pth2 in ${pth2s}
  do
    a=`cdf -p2t fitt ${pth2} ${df}`; th2=${a##*=}; echo $th2
    cp ${rtpath}/AlphaSim/${prefix}${var}-${roi}D_th${pth2} .
    clust2=(`cat ${prefix}${var}-${roi}D_th${pth2}`)
    Clust2=`ccalc -eval "${vol}*${clust2[0]}"`
    echo ${roi} ${clust2[0]} ${Clust2}
    3dmerge -1thresh ${th2} -1clust ${dist} ${Clust2} -prefix mcUvN-${roi}-${cnt} mUvN-${roi}+tlrc'[1]'
    3dmerge -1thresh ${th2} -1clust_order ${dist} ${Clust2} -datum byte -prefix mcUvN-${roi}-${cnt}-order mUvN-${roi}+tlrc'[1]'
    cnt=`echo "${cnt}+1"|bc`
  done
done

#########[3] generate cluster table and the focus point position & name
cd ${rtpath}/group
rm -f *
ln -s ${zBackup}/N* .
ln -s ${zBackup}/U* .
ln -s ${gResult}/${prefix}${var}*D_th.* .
ln -s ${gResult}/mcUvN-*-?+tlrc.* .
ln -s ${gResult}/mcUvN-*-?-order+tlrc.* .
for roi in ${ROIs}
do
  cnt=1
  for pth2 in ${pth2s}
  do
    clust2=(`cat AlphaSim${var}-${roi}D_th${pth2}`)
    Clust2=`ccalc -eval "${vol}*${clust2[0]}"`
    echo ${roi} ${clust2[0]} ${Clust2}
#(1)create a table to see where the activation is
    ${rtpath}/scripts/3dclust-table-max.pl ${dist} ${Clust2} mcUvN-${roi}-${cnt}+tlrc > UvN${roi}-table${cnt}.txt
#(2)average all subjects data within the ROIs defined in step (2)
    3dROIstats -nzmean -mask mcUvN-${roi}-${cnt}-order+tlrc [UN]*${roi}*HEAD > UvNtmp.txt
    fixROIstats.pl sess 1 UvNtmp.txt > UvN-${roi}-clustz${cnt}.txt
    cnt=`echo "${cnt}+1"|bc`
  done
done
rm -f UvNtmp.txt

mv *.txt ${gResult}
cd $gResult
mv *.txt ${gResult}/c${dir1}d${dir2}
cd ${gResult}/c${dir1}d${dir2}
ln -s ${rtpath}/114705/114705-anat_al_at+tlrc.* .
mv ${gResult}/AlphaSim* .
mv ${gResult}/mcUvN*+tlrc.* .
