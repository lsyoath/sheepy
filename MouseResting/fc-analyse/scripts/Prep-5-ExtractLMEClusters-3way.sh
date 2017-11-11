#*****Parameters need to change******
rtpath=/prot/MCI/Data


ROIs='lvCa rvCa lGP rGP lNAC rNAC lvmPu rvmPu ldCa rdCa ldlPu rdlPu'

ROIs1='vCa GP NAC vmPu dCa dlPu'


FBriks='2 3'
ZBriks='5 7 9 11 13 15'

#************************************
cd ${rtpath}/MCfc

for roi in ${ROIs1}

do


#rm ${rtpath}/Clusters/*${roi}_*_z.txt

GrpLME_aMCI_NC_Clust_mask_f2

3dROIstats  -mask GrpLME_aMCI_NC_Clust_mask_f2+tlrc ${rtpath}/NC/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/NC_left${roi}_f2_z.txt

3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f2+tlrc ${rtpath}/NC/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/NC_right${roi}_f2_z.txt



3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f2+tlrc ${rtpath}/svMCI/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/svMCI_left${roi}_f2_z.txt

3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f2+tlrc ${rtpath}/svMCI/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/svMCI_right${roi}_f2_z.txt



3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f2+tlrc ${rtpath}/aMCI/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/aMCI_left${roi}_f2_z.txt

3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f2+tlrc ${rtpath}/aMCI/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/aMCI_right${roi}_f2_z.txt



#********************************************************************************************************************************


3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f3+tlrc ${rtpath}/NC/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/NC_left${roi}_f3_z.txt

3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f3+tlrc ${rtpath}/NC/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/NC_right${roi}_f3_z.txt


3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f3+tlrc ${rtpath}/svMCI/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/svMCI_left${roi}_f3_z.txt

3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f3+tlrc ${rtpath}/svMCI/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/svMCI_right${roi}_f3_z.txt


3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f3+tlrc ${rtpath}/aMCI/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/aMCI_left${roi}_f3_z.txt

3dROIstats  -mask GrpLME_${roi}_Clust_mask1_f3+tlrc ${rtpath}/aMCI/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/aMCI_right${roi}_f3_z.txt


#for sb in ${ZBriks}

#do

#3dROIstats  -mask GrpLME_${roi}_Clust_mask1_z${sb}+tlrc ${rtpath}/NC/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/NC_left${roi}_z${sb}_z.txt

#3dROIstats  -mask GrpLME_${roi}_Clust_mask1_z${sb}+tlrc ${rtpath}/NC/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/NC_right${roi}_z${sb}_z.txt


#3dROIstats  -mask GrpLME_${roi}_Clust_mask1_z${sb}+tlrc ${rtpath}/aMCI/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/aMCI_left${roi}_z${sb}_z.txt

#3dROIstats  -mask GrpLME_${roi}_Clust_mask1_z${sb}+tlrc ${rtpath}/aMCI/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/aMCI_right${roi}_z${sb}_z.txt


#3dROIstats  -mask GrpLME_${roi}_Clust_mask1_z${sb}+tlrc ${rtpath}/svMCI/sub*/sub*_l${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/svMCI_left${roi}_z${sb}_z.txt

#3dROIstats  -mask GrpLME_${roi}_Clust_mask1_z${sb}+tlrc ${rtpath}/svMCI/sub*/sub*_r${roi}_z3+tlrc.HEAD > ${rtpath}/Clusters/svMCI_right${roi}_z${sb}_z.txt


#done

done













