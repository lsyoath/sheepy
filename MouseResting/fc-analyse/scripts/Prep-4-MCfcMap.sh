#*****Parameters need to change******
rtpath='/home/rp/Data' 
pth1=.001
var=rest_errt
#aMCI 65
Anh=65;Adf=`echo $Anh-1 | bc`
#NC 76
Hnh=76;Hdf=`echo $Hnh-1 | bc`
dist=3.1; pth1=.001; dir1=001; dir2=02; vol=`ccalc -eval "3*3*3"`
a=`cdf -p2t fitt ${pth1} ${Adf}`; th1A=${a##*=}
a=`cdf -p2t fitt ${pth1} ${Hdf}`; th1H=${a##*=}
#************************************

#####  Cluster Size read directly from AlphaSim directory
  cd ${rtpath}/fc-analyse/data
  #-n and '9p' are directed to the 9th line of AlphaSim${var}C${pth1} files.
  clust1=(`sed -n '9p' ../AlphaSim/AlphaSim${var}C${pth1}*`)
  Clust1=`ccalc -eval "${vol}*${clust1[0]}"`
  echo ${clust1[0]} ${Clust1}

  rm -f mc[AH]_ROI+tlrc.*
  3dmerge -1thresh ${th1A} -1clust ${dist} ${Clust1} -prefix mcA_ROI mA_ROI+tlrc'[1]'
  3dmerge -1thresh ${th1H} -1clust ${dist} ${Clust1} -prefix mcH_ROI mH_ROI+tlrc'[1]'


#### generate mask based on the OR set of Normal & User Connectivity map

  rm -f ROImask+tlrc.*
  rm -f mAvH_ROI*
  3dmerge -gcount -prefix tmpROIcnt mc[AH]_ROI+tlrc.HEAD
  3dcalc -a tmpROIcnt+tlrc -expr "ispositive(a)" -datum byte -prefix ROImask
  3dcalc -a AvH_ROI+tlrc -b ROImask+tlrc -expr "a*b" -prefix mAvH_ROI

  rm tmp*

#########generate cluster table and the focus point position & name
  mkdir result
  cd result
#create a table to see where the activation is
  3dclust  ${dist} ${Clust1} ../mcA_ROI+tlrc > AROI_table.txt
  3dclust  ${dist} ${Clust1} ../mcH_ROI+tlrc > HROI_table.txt

