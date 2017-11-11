

#rtpath="/prot/MCI/"
rtpath="/prot/MCI/Data"

#ROIs='rightVis leftVis rightVss leftVss rightDC leftDC rightDCP leftDCP rightDRP leftDRP rightVRP leftVRP rightaHipp leftaHipp rightpHipp leftpHipp'

#ROIs='rightVis leftVis rightDC leftDC'

ROIs='lvCa rvCa lGP rGP lNAC rNAC lvmPu rvmPu ldCa rdCa ldlPu rdlPu'

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

#dist=3.1; pth1=.001; dir1=001; dir2=02; vol=`ccalc -eval "3*3*3"`
#pth1=0.000005;
#a=`cdf -p2t fitt ${pth1} ${df}`; th1NC=${a##*=}
#a=`cdf -p2t fitt ${pth1} ${df}`; th1aMCI=${a##*=}
#a=`cdf -p2t fitt ${pth1} ${df}`; th1svMCI=${a##*=}

th1NC=5.28;
th1aMCI=5.28;
th1svMCI=5.28

echo $th1NC $th1aMCI $th1svMCI

var=rest_errt

#********************************************

#####  Cluster Size read directly from AlphaSim directory

cd ${rtpath}/Grpttest

	clust1=`cat /prot/MCI/AlphaSim/AlphaSim_${var}_C_${pth1}.NN1_2sided.1D|grep 0.001|awk '{print $3}'`
	Clust1=`ccalc -eval "${clust1[0]}"`
	echo ${clust1[0]} ${Clust1}

for roi in ${ROIs}
do
  	rm -f ${rtpath}/MCfc/mc_NC_${roi}+tlrc.*
  	rm -f ${rtpath}/MCfc/mc_svMCI_${roi}+tlrc.*
  	rm -f ${rtpath}/MCfc/mc_aMCI_${roi}+tlrc.*	
 
rm -f Clust_mask+*
 3dclust -1Dformat -nosum -1dindex 1 -1tindex 1 -1thresh ${th1NC} -dxyz=1 -savemask Clust_mask 1.01 24.6 m_NC_${roi}+tlrc
  
  3dcalc -a Clust_mask+tlrc -b m_NC_${roi}+tlrc -expr 'step(a)*b' -prefix ${rtpath}/MCfc/mc_NC_${roi} 

 rm -f Clust_mask+*
 3dclust -1Dformat -nosum -1dindex 1 -1tindex 1 -1thresh ${th1aMCI} -dxyz=1 -savemask Clust_mask 1.01 24.6 m_aMCI_${roi}+tlrc
  
  3dcalc -a Clust_mask+tlrc -b m_aMCI_${roi}+tlrc -expr 'step(a)*b' -prefix ${rtpath}/MCfc/mc_aMCI_${roi} 

 rm -f Clust_mask+*
 3dclust -1Dformat -nosum -1dindex 1 -1tindex 1 -1thresh ${th1svMCI} -dxyz=1 -savemask Clust_mask 1.01 24.6 m_svMCI_${roi}+tlrc
  
  3dcalc -a Clust_mask+tlrc -b m_svMCI_${roi}+tlrc -expr 'step(a)*b' -prefix ${rtpath}/MCfc/mc_svMCI_${roi} 
 
 #3dmerge -session ${rtpath}/MCfc -1thresh ${th1NC} -dxyz=3 -1clust ${dist} ${Clust1} -prefix mc_NC_${roi} mNC_${roi}+tlrc
 #3dmerge -session ${rtpath}/MCfc -1thresh ${th1aMCI} -1clust ${dist} ${Clust1} -prefix mc_aMCI_${roi} maMCI_${roi}+tlrc
 #3dmerge -session ${rtpath}/MCfc -1thresh ${th1svMCI} -1clust ${dist} ${Clust1} -prefix mc_svMCI_${roi} msvMCI_${roi}+tlrc

done
	
#### generate mask based on the OR set of Normal & User Connectivity map

cd ${rtpath}/MCfc

for roi in ${ROIs}

do
 rm -f ${roi}-mask+tlrc.*
  #rm -f mUvN_${roi}*
  rm -f tmp${roi}cnt*
  
3dmerge -gcount -prefix tmp${roi}cnt mc_NC_${roi}+tlrc.HEAD mc_aMCI_${roi}+tlrc.HEAD mc_svMCI_${roi}+tlrc.HEAD
  
  #3dmerge -gcount -prefix tmp${roi}cnt2 mc_aMCI_${roi}+tlrc.HEAD
  #3dmerge -gcount -prefix tmp${roi}cnt3 mc_svMCI_${roi}+tlrc.HEAD
  #3dmerge -gcount -prefix tmp${roi}cnt tmp${roi}cnt*+tlrc.HEAD

  3dcalc -a tmp${roi}cnt+tlrc -expr "ispositive(a)" -datum byte -prefix ${roi}-mask
  
	#3dcalc -a UvN_${roi}+tlrc -b ${roi}mask+tlrc -expr "a*b" -prefix mUvN_${roi}

done



#rm tmp*

