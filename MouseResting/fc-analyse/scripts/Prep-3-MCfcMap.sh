
#*****Parameters need to change******

rtpath= "/prot/MCI"

ROIs='rightVis leftVis rightVss leftVss rightDC leftDC rightDCP leftDCP rightDRP leftDRP rightVRP leftVRP rightaHipp leftaHipp rightpHipp leftpHipp'

#ROIs='hab3'

n=117; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.001; dir1=001; dir2=02; vol=`ccalc -eval "3*3*3"`

a=`cdf -p2t fitt ${pth1} ${df}`; th1NC=${a##*=}
a=`cdf -p2t fitt ${pth1} ${df}`; th1aMCI=${a##*=}
a=`cdf -p2t fitt ${pth1} ${df}`; th1svMCI=${a##*=}

echo $th1NC $th1aMCI $th1svMCI

var=rest_errt
#************************************

#####  Cluster Size read directly from AlphaSim directory

cd ${rtpath}
	#clust1=(`cat Alphasim_C_th${pth1}`)

	clust1=`cat /prot/MCI/AlphaSim/AlphaSim${var}C${pth1}.NN1_2sided.1D|grep 0.001|awk '{print $3}'`
	Clust1=`ccalc -eval "${vol}*${clust1}"`
	echo ${clust1} ${Clust1}

for roi in ${ROIs}
do
  	#rm -f mcNC_${roi}+tlrc.*
  	#rm -f mcsvMCI_${roi}+tlrc.*
  	#rm -f mcaMCI_${roi}+tlrc.*
  3dmerge -1thresh ${th1NC} -1clust ${dist} ${Clust1} -prefix mcNC_${roi} mNC_${roi}+tlrc 
  #3dmerge -1thresh ${th1N} -1clust ${dist} ${Clust1} -prefix mcN_${roi} mN_${roi}+tlrc'[1]'
  #3dmerge -1thresh ${th1U} -1clust ${dist} ${Clust1} -prefix mcU_${roi} mU_${roi}+tlrc'[1]'
done

#### generate mask based on the OR set of Normal & User Connectivity map
#for roi in ${ROIs}

#do
 # rm -f ${roi}mask+tlrc.*
  #rm -f mUvN_${roi}*
  #3dmerge -gcount -prefix tmp${roi}cnt mc[UN]_${roi}+tlrc.HEAD
  #3dcalc -a tmp${roi}cnt+tlrc -expr "ispositive(a)" -datum byte -prefix ${roi}mask
  #3dcalc -a UvN_${roi}+tlrc -b ${roi}mask+tlrc -expr "a*b" -prefix mUvN_${roi}
#done
#rm tmp*

#########[4] generate cluster table and the focus point position & name
#cd ${gResult}
#for roi in ${ROIs}
#do
#(2)create a table to see where the activation is
  #3dclust-table ${dist} ${Clust1} mcN_${roi}+tlrc > N${roi}_table.txt
  #3dclust-table ${dist} ${Clust1} mcU_${roi}+tlrc > U${roi}_table.txt
#done
