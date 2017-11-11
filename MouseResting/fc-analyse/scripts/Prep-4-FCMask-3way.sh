rtpath=/prot/MCI/Data


ROIs='vCa GP NAC vmPu dCa dlPu'


SubNum=120

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.01 ; th1=6.968 ; th2=3.037; vol=`ccalc -eval "3*3*3"`


#### generate mask 

cd ${rtpath}/MCfc

#rm -f *-fcmask+tlrc.*

3dcalc -a vCa-fcmask+tlrc -b GP-fcmask+tlrc -c NAC-fcmask+tlrc -d vmPu-fcmask+tlrc -e dCa-fcmask+tlrc -f dlPu-fcmask+tlrc  -exp "step(a+b+c+d+e+f)" -prefix ROI-fcmask
 
#3dcalc -a ${rtpath}/MCfc/lGP-mask+tlrc -b ${rtpath}/MCfc/rGP-mask+tlrc -expr "step(a+b)" -prefix GP-fcmask

#3dcalc -a ${rtpath}/MCfc/lNAC-mask+tlrc -b ${rtpath}/MCfc/rNAC-mask+tlrc -expr "step(a+b)" -prefix NAC-fcmask

#3dcalc -a ${rtpath}/MCfc/lvmPu-mask+tlrc -b ${rtpath}/MCfc/rvmPu-mask+tlrc -expr "step(a+b)" -prefix vmPu-fcmask


#3dcalc -a ${rtpath}/MCfc/ldCa-mask+tlrc -b ${rtpath}/MCfc/rdCa-mask+tlrc -expr "step(a+b)" -prefix dCa-fcmask


#3dcalc -a ${rtpath}/MCfc/ldlPu-mask+tlrc -b ${rtpath}/MCfc/rdlPu-mask+tlrc -expr "step(a+b)" -prefix dlPu-fcmask 
#

#*********************************************************************************
a=(`1dsum all-ACF.txt`)
ACFa=`ccalc ${a[0]}/${SubNum}`
ACFb=`ccalc ${a[1]}/${SubNum}`
ACFc=`ccalc ${a[2]}/${SubNum}`
ACF=`ccalc ${a[3]}/${SubNum}`



rm ${rtpath}/AlphaSim/AlphaSim_ROI-fcmask_*.*.*

3dClustSim -mask ROI-fcmask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_ROI-fcmask_ACF


3dClustSim -mask ROI-fcmask+tlrc -FWHM 8 -pthr 0.01 -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_ROI-fcmask_FWHM


