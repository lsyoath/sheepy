
rtpath=/prot/MCI

ROIs='lVSi lDC rVSi rDC'
ROIs1='DC VSi'
FBriks='2 5'
ZBriks='7 9 11 13 15 17'
var='GrpANOVA'
var1='C_default'

SubNum=120

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.05; th1=3.07; th2=1.95; vol=`ccalc -eval "3*3*3"`

echo $th1 $th2

#### generate mask 

cd ${rtpath}/new


#rm -f DC_fcmask+tlrc.*

#rm -f VSi_fcmask+tlrc.*

#3dcalc -a ${rtpath}/MCfc/leftDCmask+tlrc -b ${rtpath}/MCfc/rightDCmask+tlrc -expr "step(a+b)" -prefix DC_fcmask
 
#3dcalc -a ${rtpath}/MCfc/leftVismask+tlrc -b ${rtpath}/MCfc/rightVismask+tlrc -expr "step(a+b)" -prefix VSi_fcmask

 
 




#a=(`1dsum all-ACF.txt`)
#ACFa=`ccalc ${a[0]}/${SubNum}`
#ACFb=`ccalc ${a[1]}/${SubNum}`
#ACFc=`ccalc ${a[2]}/${SubNum}`
#ACF=`ccalc ${a[3]}/${SubNum}`




for roi in ${ROIs1}

do

#rm ${rtpath}/new/Alphasim/AlphaSim_${roi}_C_default.*.*


#3dClustSim -mask ${roi}_fcmask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -prefix  ${rtpath}/new/Alphasim/AlphaSim_${roi}_C_default

#done


#********************************************

#####  Cluster Size read directly from AlphaSim directory

  
clust1=`cat /prot/MCI/new/Alphasim/AlphaSim_${roi}_${var1}.NN1_2sided.1D|grep 0.001|awk '{print $3}'`
	Clust1=`ccalc -eval "${clust1[0]}"`
	echo ${clust1[0]} ${Clust1}

rm -f GrpANOVA_fcmask_${roi}+*

3dcalc -a GrpANOVA_${roi}_1+tlrc -b ${roi}_fcmask+tlrc  -expr a*b -prefix GrpANOVA_fcmask_${roi}

for sb in ${FBriks}	
do 
	rm -f ClustMask_0.05_group_GrpANOVA_${roi}_${sb}+tlrc.*
	rm -f ${var}_${roi}_Clust_mask_f${sb}+*
 
3dclust -1Dformat -nosum -1thresh ${th1} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_${roi}_Clust_mask_f${sb} 1.01 12.4 GrpANOVA_fcmask_${roi}+tlrc
  
3dcalc -a ${var}_${roi}_Clust_mask_f${sb}+tlrc -b GrpANOVA_fcmask_${roi}+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.05_group_${var}_${roi}_${sb}

done

for sb in ${ZBriks}	
do 
 	rm -f ClustMask_0.05_Z_GrpANOVA_${roi}_${sb}+tlrc.*
	rm -f ${var}_${roi}_Clust_mask_z${sb}+*
 
3dclust -1Dformat -nosum -1thresh ${th2} -1dindex ${sb} -1tindex ${sb} -dxyz=1 -savemask ${var}_${roi}_Clust_mask_z${sb} 1.01 12.4 GrpANOVA_fcmask_${roi}+tlrc
  
3dcalc -a ${var}_${roi}_Clust_mask_z${sb}+tlrc -b GrpANOVA_fcmask_${roi}+tlrc"[$sb]" -expr 'step(a)*b' -prefix ClustMask_0.05_Z_${var}_${roi}_${sb} 

done 


done

 




