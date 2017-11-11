rtpath=/prot/MCI/Data




ROIs='vCa CP NAC vmPu dCa dlPu'


FBriks='2 3'
ZBriks='5 7 9 11 13 15'
var='GrpLME'
var1='C_default'

SubNum=109

n=109; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.05; th1=3.07; th2=1.95; vol=`ccalc -eval "3*3*3"`


#### generate mask 

cd ${rtpath}/MCfc

#*********************************************************************************
a=(`1dsum all-ACF.txt`)
ACFa=`ccalc ${a[0]}/${SubNum}`
ACFb=`ccalc ${a[1]}/${SubNum}`
ACFc=`ccalc ${a[2]}/${SubNum}`
ACF=`ccalc ${a[3]}/${SubNum}`


na=''
for roi in ${ROIs}


do

rm ${rtpath}/AlphaSim/AlphaSim_${roi}_fcmask.*.*

3dClustSim -mask ${roi}-fcmask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_${roi}_fcmask


#3dClustSim -mask ${roi}-fcmask+tlrc -FWHM 8 -iter 10000  -prefix  ${rtpath}/AlphaSim/AlphaSim_${roi}_C_default

done
