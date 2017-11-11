#******************************


SubNum=120
rtpath='/prot/MCI/Data'

#ROIs='rightVis leftVis rightVss leftVss rightDC leftDC rightDCP leftDCP rightDRP leftDRP rightVRP leftVRP rightaHipp leftaHipp rightpHipp leftpHipp'

#ROIs='rightVis leftVis rightDC leftDC'

ROIs='lvCa rvCa lGP rGP lNAC rNAC lvmPu rvmPu ldCa rdCa ldlPu rdlPu'

apath=${rtpath}/AlphaSim

#uncorrected p value

#pth1=.05 #.02 .001 .005'
#pth2=.02
#pth3=.001
#pth4=.005
 
#****************************

cd ${rtpath}/MCfc

a=(`1dsum all-ACF.txt`)
ACFa=`ccalc ${a[0]}/${SubNum}`
ACFb=`ccalc ${a[1]}/${SubNum}`
ACFc=`ccalc ${a[2]}/${SubNum}`
ACF=`ccalc ${a[3]}/${SubNum}`


for roi in ${ROIs}

do
rm -f ${apath}/AlphaSim_${roi}_C_default

3dClustSim -mask ${roi}-mask+tlrc -acf ${ACFa} ${ACFb} ${ACFc} -iter 10000  -prefix  ${apath}/AlphaSim_${roi}_C_default



done

