
rtpath=/prot/MCI

ROIs='leftVis leftDC rightVis rightDC'
ROIs1='DC Vis'
FBriks='2 3'
ZBriks='5 7 9 11 13 15'
var='GrpLME'
var1='C_default'

SubNum=120

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.05; th1=3.07; th2=1.95; vol=`ccalc -eval "3*3*3"`

echo $th1 $th2

#### generate mask 

cd ${rtpath}/MCfc

### yaha 6 wota ROi haalnu paryo

#rm -f DC-fcmask+tlrc.*

#rm -f VSi-fcmask+tlrc.*

#3dcalc -a ${rtpath}/MCfc/leftDC-mask+tlrc -b ${rtpath}/MCfc/rightDC-mask+tlrc -expr "step(a+b)" -prefix DC-fcmask
 
#3dcalc -a ${rtpath}/MCfc/leftVis-mask+tlrc -b ${rtpath}/MCfc/rightVis-mask+tlrc -expr "step(a+b)" -prefix Vis-fcmask

 
#********************************************************************************* 


#a=(`1dsum all-ACF.txt`)
#ACFa=`ccalc ${a[0]}/${SubNum}`
#ACFb=`ccalc ${a[1]}/${SubNum}`
#ACFc=`ccalc ${a[2]}/${SubNum}`
#ACF=`ccalc ${a[3]}/${SubNum}`




for roi in ${ROIs1}


do

#rm ${rtpath}/AlphaSim/AlphaSim_${roi}_C_default.*.*


#3dClustSim -mask ${roi}-fcmask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_${roi}_C_default

#done


#********************************************

#####  Cluster Size read directly from AlphaSim directory

  
#clust1=`cat /prot/MCI/AlphaSim/AlphaSim_${roi}_${var1}.NN1_2sided.1D|grep 0.001|awk '{print $3}'`
#	Clust1=`ccalc -eval "${clust1[0]}"`
#	echo ${clust1[0]} ${Clust1}

rm -f GrpLME_fcmask-${roi}+*

3dcalc -a GrpLME_${roi}+tlrc -b ${roi}-fcmask+tlrc  -expr a*b -prefix GrpLME_fcmask-${roi}

done

for sb in ${FBriks}	
do 
	#rm -f ClustMask_0.05_group_GrpLME_${roi}_${sb}+tlrc.*
	#rm -f ${var}_${roi}_Clust_mask_f${sb}+*
 
3dclust -1Dformat -nosum -1thresh ${th1} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_DC_Clust_mask_f${sb} 1.01 100.8 GrpLME_fcmask-DC+tlrc
  
3dcalc -a ${var}_DC_Clust_mask_f${sb}+tlrc -b GrpLME_fcmask-DC+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.05_group_${var}_DC_${sb}


3dclust -1Dformat -nosum -1thresh ${th1} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_Vis_Clust_mask_f${sb} 1.01 56 GrpLME_fcmask-Vis+tlrc
  
3dcalc -a ${var}_Vis_Clust_mask_f${sb}+tlrc -b GrpLME_fcmask-DC+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.05_group_${var}_Vis_${sb}


done

for sb in ${ZBriks}	
do 
 	#rm -f ClustMask_0.05_Z_GrpLME_${roi}_${sb}+tlrc.*
	#rm -f ${var}_${roi}_Clust_mask_z${sb}+*
 
3dclust -1Dformat -nosum -1thresh ${th2} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_DC_Clust_mask_z${sb} 1.01 100.8 GrpLME_fcmask-DC+tlrc
  
3dcalc -a ${var}_DC_Clust_mask_z${sb}+tlrc -b GrpLME_fcmask-DC+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.05_Z_${var}_DC_${sb} 


3dclust -1Dformat -nosum -1thresh ${th2} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_Vis_Clust_mask_z${sb} 1.01 56 GrpLME_fcmask-Vis+tlrc
  
3dcalc -a ${var}_Vis_Clust_mask_z${sb}+tlrc -b GrpLME_fcmask-Vis+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.05_Z_${var}_Vis_${sb} 

done 


done

 




