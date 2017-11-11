#*****Parameters need to change******
#aMCI 65,NC 76
SubNum=141
rtpath=/home/rp/Data
var=rest_errt
#use edge neighbor with voxel size of 3x3x3mm
dist=4.3
#uncorrected p value
pth1=.001
#corrected p value
pc=.05
apath=${rtpath}/fc-analyse/AlphaSim
mkdir -p ${apath}
#************************************


### Estimate FWHM based on the epi data right before CC analysis ###
### 3dFWHMx:Estimating and using noise smoothness values
for s in ${rtpath}/aMCI/*
do
  num=${s##*/}
  num=${num#*sub}
  cd ${s}
  3dFWHMx -dset ${num}_${var}+tlrc -automask -unif -acf > sub${num}-acf.1D
  mv sub${num}-acf.1D ${apath}
done

for s in ${rtpath}/NC/*
do
  num=${s##*/}
  num=${num#*sub}
  cd ${s}
  3dFWHMx -dset ${num}_${var}+tlrc -automask -unif -acf > sub${num}-acf.1D
  mv sub${num}-acf.1D ${apath}
done

#use average estimated FWHM in the group
#as the input of alphasim
cd ${apath}
sed -n '2p' sub*-acf.1D > all-ACF.txt
a=(`1dsum all-ACF.txt`)
ACFa=`ccalc ${a[0]}/${SubNum}`
ACFb=`ccalc ${a[1]}/${SubNum}`
ACFc=`ccalc ${a[2]}/${SubNum}`
echo $ACFa $ACFb $ACFc > avg-ACF.txt



## Calc cluster threshold for Connectivity map
## based on uncorrected p value, estimated FWHM,
## the mask where multiple comparison performed, and corrected p value

ln -s ${rtpath}/mask/CommonGMmask+tlrc.* ./
rm -f AlphaSim${var}C${pth1}

3dClustSim -mask CommonGMmask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -pthr ${pth1} -prefix  AlphaSim${var}C${pth1}

