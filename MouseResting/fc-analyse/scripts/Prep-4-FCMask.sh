rtpath=/prot/MCI/Data


ROIs='lvCa rvCa lGP rGP lNAC rNAC lvmPu rvmPu ldCa rdCa ldlPu rdlPu'

ROIs1='vCa GP NAC vmPu dCa dlPu'


FBriks='2 3'
ZBriks='5 7 9 11 13 15'
var='GrpLME'
var1='C_default'

SubNum=120

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.05; th1=3.07; th2=1.95; vol=`ccalc -eval "3*3*3"`


#### generate mask 

cd ${rtpath}/MCfc

#rm -f *-fcmask+tlrc.*

#rm -f *-fcmask+tlrc.*

#3dcalc -a ${rtpath}/MCfc/lvCa-mask+tlrc -b ${rtpath}/MCfc/rvCa-mask+tlrc -expr "step(a+b)" -prefix vCa-fcmask
 
#3dcalc -a ${rtpath}/MCfc/lGP-mask+tlrc -b ${rtpath}/MCfc/rGP-mask+tlrc -expr "step(a+b)" -prefix GP-fcmask

#3dcalc -a ${rtpath}/MCfc/lNAC-mask+tlrc -b ${rtpath}/MCfc/rNAC-mask+tlrc -expr "step(a+b)" -prefix NAC-fcmask

#3dcalc -a ${rtpath}/MCfc/lvmPu-mask+tlrc -b ${rtpath}/MCfc/rvmPu-mask+tlrc -expr "step(a+b)" -prefix vmPu-fcmask


#3dcalc -a ${rtpath}/MCfc/ldCa-mask+tlrc -b ${rtpath}/MCfc/rdCa-mask+tlrc -expr "step(a+b)" -prefix dCa-fcmask


#3dcalc -a ${rtpath}/MCfc/ldlPu-mask+tlrc -b ${rtpath}/MCfc/rdlPu-mask+tlrc -expr "step(a+b)" -prefix dlPu-fcmask 


#*********************************************************************************
a=(`1dsum all-ACF.txt`)
ACFa=`ccalc ${a[0]}/${SubNum}`
ACFb=`ccalc ${a[1]}/${SubNum}`
ACFc=`ccalc ${a[2]}/${SubNum}`
ACF=`ccalc ${a[3]}/${SubNum}`



for roi in ${ROIs1}


do
rm ${rtpath}/AlphaSim/AlphaSim_${roi}_fcmask.*.*

#3dClustSim -mask ${roi}-fcmask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_${roi}_fcmask


#rm ${rtpath}/AlphaSim/AlphaSim_${roi}_C_default.*.*

#3dClustSim -mask ${roi}-fcmask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_${roi}_C_default


3dClustSim -mask ${roi}-fcmask+tlrc -FWHM 8 -pthr 0.03 -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_${roi}_C_default

done
