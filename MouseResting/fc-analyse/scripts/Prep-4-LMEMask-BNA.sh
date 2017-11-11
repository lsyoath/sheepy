
rtpath=/prot/MCI/Data


ROIs='lvCa rvCa lGP rGP lNAC rNAC lvmPu rvmPu ldCa rdCa ldlPu rdlPu'

ROIs1='vCa GP NAC vmPu dCa dlPu'


FBriks='2 3'
ZBriks='5 7 9 11 13 15'
var='GrpLME'


SubNum=120

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

#dist=3.1; pth1=.05; th1=3.07; th2=1.95; vol=`ccalc -eval "3*3*3"`
dist=3.1; pth1=.03; th1=3.6; th2=2.16; vol=`ccalc -eval "3*3*3"`

#Clust=(142 184 135 162 184 204.5)  
#Clust=(200 244 220 158 210)

#Clust=(323 331 302 319 321 324)

echo $th1 $th2

cd ${rtpath}/MCfc

#####  Cluster Size read directly from AlphaSim directory

#for roi in ${ROIs1}


#do

#rm -f GrpLME_fcmask-${roi}+*

#3dcalc -a GrpLME_${roi}+tlrc -b ${roi}-fcmask+tlrc  -expr a*b -prefix GrpLME_fcmask-${roi}

#done

#cnt=0

for roi in ${ROIs1}
do

#cl=${Clust[$cnt]}

#echo $cnt $cl $roi

for sb in ${FBriks}	
do 
	rm -f ClustMask_0.03_group_GrpLME_${roi}_${sb}+tlrc.*
	rm -f ${var}_${roi}_Clust_mask1_f${sb}+*

3dclust -1Dformat -nosum -1thresh ${th1} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_${roi}_Clust_mask1_f${sb} 1.01 86 GrpLME_fcmask-${roi}+tlrc
  
3dcalc -a ${var}_${roi}_Clust_mask1_f${sb}+tlrc -b GrpLME_fcmask-${roi}+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.03_group_${var}_${roi}_${sb}

done
#cnt=`echo "${cnt}+1"|bc`

for sb in ${ZBriks}	
do 
	rm -f ClustMask_0.03_Z_GrpLME_${roi}_${sb}+tlrc.*
	rm -f ${var}_${roi}_Clust_mask1_z${sb}+*
 
3dclust -1Dformat -nosum -1thresh ${th2} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_${roi}_Clust_mask1_z${sb} 1.01 86 GrpLME_fcmask-${roi}+tlrc
 
3dcalc -a ${var}_${roi}_Clust_mask1_z${sb}+tlrc -b GrpLME_fcmask-${roi}+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.03_Z_${var}_${roi}_${sb} 

done 

#cnt=`echo "${cnt}+1"|bc`

done

 




