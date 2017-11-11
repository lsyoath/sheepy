
#rtpath=/prot/MCI
rtpath=/prot/MCI/Data

#ROIs='rightVis leftVis rightVss leftVss rightDC leftDC rightDCP leftDCP rightDRP leftDRP rightVRP leftVRP rightaHipp leftaHipp rightpHipp leftpHipp'

#ROIs='rightVis leftVis rightDC leftDC'

ROIs='lvCa rvCa lGP rGP lNAC rNAC lvmPu rvmPu ldCa rdCa ldlPu rdlPu'


n=120; n_1=`echo $n-1 | bc`; nh=`echo $n/3 | bc`; nh_1=`echo $nh-1 | bc`


gResult=${rtpath}/fc

cd ${rtpath}/Grpttest

for roi in ${ROIs}

do

rm -f NC_vs_aMCI_${roi}+tlrc*
rm -f NC_vs_svMCI_${roi}+tlrc*
rm -f aMCI_vs_svMCI_${roi}+tlrc*

3dttest++ -prefix NC_vs_aMCI_${roi} -setA ${rtpath}/NC/*/sub*_${roi}_z3+tlrc.HEAD -setB  ${rtpath}/aMCI/*/sub*_${roi}_z3+tlrc.HEAD
  
3dttest++ -prefix NC_vs_svMCI_${roi} -setA ${rtpath}/NC/*/sub*_${roi}_z3+tlrc.HEAD -setB ${rtpath}/svMCI/*/sub*_${roi}_z3+tlrc.HEAD 

3dttest++ -prefix aMCI_vs_svMCI_${roi} -setA ${rtpath}/aMCI/*/sub*_${roi}_z3+tlrc.HEAD -setB ${rtpath}/svMCI/*/sub*_${roi}_z3+tlrc.HEAD 



#***********************************************************************************


rm -f m_NC_vs_aMCI_${roi}+tlrc*
rm -f m_NC_vs_svMCI_${roi}+tlrc*
rm -f m_aMCI_vs_svMCI_${roi}+tlrc*

3dcalc -a NC_vs_aMCI_${roi}+tlrc -b ${rtpath}/MCfc/${roi}-mask+tlrc -expr a*b -prefix m_NC_vs_aMCI_${roi}

3dcalc -a NC_vs_svMCI_${roi}+tlrc -b ${rtpath}/MCfc/${roi}-mask+tlrc -expr a*b -prefix m_NC_vs_svMCI_${roi}

3dcalc -a aMCI_vs_svMCI_${roi}+tlrc -b ${rtpath}/MCfc/${roi}-mask+tlrc -expr a*b -prefix m_aMCI_vs_svMCI_${roi}



done
  

