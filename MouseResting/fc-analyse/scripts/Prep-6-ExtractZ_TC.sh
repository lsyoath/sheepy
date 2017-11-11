#******Parameters need to change******
rtpath=/data/380/data/ControlCocaine-Resting
gResult=${rtpath}/results/VBM-YZ-irg-pca3
zBackup=${rtpath}/zBackup/VBM-YZ-irg-pca3
prefix=AlphaSim; var=irg
ROIs='DglFrontal005 DgrFrontalMid005 IglCaudate005 IgrPutamenCaudate005 IgrSMA001'
dir1=001; dir2=01; pth2=.01
vol=`ccalc -eval "3*3*3"`
n=78; df=`echo $n-2 | bc`
a=`cdf -p2t fitt ${pth2} ${df}`; th2=${a##*=}; echo $th2
th2s=($th2 $th2 2.79 $th2 $th2)
clust=(32 27 51 22 22)
HCs='100270 114705 117907 126587 129659 132583 135282 136406 138157 139642 141392 141996 142196 142725 143130 143215 143274 144069 144289 145217 146090 146215 146253 146907 146958 148623 149057 149166 149191 149256 149523 149593 149612 149934 152385 155871 157263 160181 8579'
CUs='101628 112880 11794 117986 119042 124143 135065 136166 136263 139092 139120 139321 139752 140029 140625 141002 141048 141075 141092 141468 142007 142066 142960 143533 144453 145101 146761 146783 146817 157105 157294 159138 159459 160051 160124 160302 4840 5157 6425'
na=""
#**************************************

#########[3] generate cluster table and the focus point position & name
cd ${rtpath}/group
rm -f *
ln -s ${zBackup}/N* .
ln -s ${zBackup}/U* .
ln -s ${gResult}/mUvN-*+tlrc.* .
sROI=DgrFrontalMid005
ln -s ${gResult}/mN-${sROI}+tlrc.* .
pth1=.001; df=38; a=`cdf -p2t fitt ${pth1} ${df}`; th1N=${a##*=}
3dmerge -dxyz=1 -1thresh ${th1N} -1clust_order 1.1 25 -prefix mcN-${sROI}-order mN-${sROI}+tlrc'[1]'
3dcalc -a mcN-${sROI}-order+tlrc -expr "equals(a,11)" -prefix vMPFCmask
3dROIstats -nzmean -mask vMPFCmask+tlrc [UN]*-${sROI}-z+tlrc.HEAD > UvNtmp.txt
fixROIstats.pl sess 1 UvNtmp.txt > N-${sROI}_vMPFC-clustz.txt

cnt=1
for roi in $na
#for roi in ${ROIs}
do
  ind=`echo $cnt-1|bc`
  echo ${roi} ${clust[$ind]} ${th2s[$ind]}
  3dmerge -dxyz=1 -1thresh ${th2s[$ind]} -1clust_order 1.1 ${clust[$ind]} -datum byte -prefix mcUvN-${roi}-order mUvN-${roi}+tlrc'[1]'
#(2)average all subjects data within the ROIs defined in step (2)
  3dROIstats -nzmean -mask mcUvN-${roi}-order+tlrc [UN]*${roi}*HEAD > UvNtmp.txt
  fixROIstats.pl sess 1 UvNtmp.txt > UvN-${roi}-clustz.txt
  cnt=`echo "${cnt}+1"|bc`
done
rm -f UvNtmp.txt

mkdir -p ${gResult}/ROIana
mv *.txt ${gResult}/ROIana

ROIfname=VBMseed_YZ+tlrc
cd ${gResult}/ROIana
#rm -f ${gResult}/ROIana/AllSub-*.1D
#rm -f ${gResult}/ROIana/SubjList.txt
for s in $na
#for s in ${HCs}
do
  #extract reference time courses from seed ROI
  cd $rtpath/$s
  cnt=2; roi=DgrFrontalMid005
  3dmaskave -mask ${rtpath}/ROI/${ROIfname} -mrange ${cnt} ${cnt} \
    -quiet ${s}-irg-errt-lp+tlrc > tmp.1D
  1dtranspose tmp.1D tmpt.1D
  cat tmpt.1D >> ${gResult}/ROIana/AllSub-${roi}.1D
  rm tmp*.1D
  cnt=4; roi=IgrPutamenCaudate005
  3dmaskave -mask ${rtpath}/ROI/${ROIfname} -mrange ${cnt} ${cnt} \
    -quiet ${s}-irg-errt-lp+tlrc > tmp.1D
  1dtranspose tmp.1D tmpt.1D
  cat tmpt.1D >> ${gResult}/ROIana/AllSub-${roi}.1D
  rm tmp*.1D
  echo $s >> ${gResult}/ROIana/SubjList.txt  
done
for s in $na
#for s in ${CUs}
do
  #extract reference time courses from seed ROI
  cd $rtpath/$s
  cnt=2; roi=DgrFrontalMid005
  3dmaskave -mask ${rtpath}/ROI/${ROIfname} -mrange ${cnt} ${cnt} \
    -quiet ${s}-irg-errt-lp+tlrc > tmp.1D
  1dtranspose tmp.1D tmpt.1D
  cat tmpt.1D >> ${gResult}/ROIana/AllSub-${roi}.1D
  rm tmp*.1D
  cnt=4; roi=IgrPutamenCaudate005
  3dmaskave -mask ${rtpath}/ROI/${ROIfname} -mrange ${cnt} ${cnt} \
    -quiet ${s}-irg-errt-lp+tlrc > tmp.1D
  1dtranspose tmp.1D tmpt.1D
  cat tmpt.1D >> ${gResult}/ROIana/AllSub-${roi}.1D
  rm tmp*.1D
  echo $s >> ${gResult}/ROIana/SubjList.txt  
done
for s in ${HCs}
do
  echo $s >> ${gResult}/ROIana/SubjList.txt  
done
for s in ${CUs}
do
  echo $s >> ${gResult}/ROIana/SubjList.txt  
done
