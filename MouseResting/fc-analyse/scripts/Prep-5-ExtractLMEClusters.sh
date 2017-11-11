#*****Parameters need to change******
rtpath='/prot/MCI/new'
gResult='/prot/MCI/fc'

ROIs='DC VSi'
#************************************
cd ${rtpath}

rm *DC_*_z.txt
rm *VSi_*_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_f2+tlrc ${gResult}/NC/sub*_lDC_z+tlrc.HEAD > NC_lDC_f2_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_f2+tlrc ${gResult}/NC/sub*_rDC_z+tlrc.HEAD > NC_rDC_f2_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_z15+tlrc ${gResult}/NC/sub*_lDC_z+tlrc.HEAD > NC_lDC_z15_z.txt

#3dROIstats  -mask GrpANOVA_DC_Clust_mask_z15+tlrc ${gResult}/NC/sub*_rDC_z+tlrc.HEAD > NC_rDC_z15_z.txt

#3dROIstats  -mask GrpANOVA_DC_Clust_mask_z17+tlrc ${gResult}/NC/sub*_lDC_z+tlrc.HEAD > NC_lDC_z17_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_z17+tlrc ${gResult}/NC/sub*_rDC_z+tlrc.HEAD > NC_rDC_z17_z.txt



3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z15+tlrc ${gResult}/NC/sub*_lVSi_z+tlrc.HEAD > NC_lVSi_z15_z.txt

#3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z15+tlrc ${gResult}/NC/sub*_rVSi_z+tlrc.HEAD > NC_rVSi_z15_z.txt

#3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z17+tlrc ${gResult}/NC/sub*_lVSi_z+tlrc.HEAD > NC_lVSi_z17_z.txt

3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z17+tlrc ${gResult}/NC/sub*_rVSi_z+tlrc.HEAD > NC_rVSi_z17_z.txt

#*************************************************************************************

3dROIstats  -mask GrpANOVA_DC_Clust_mask_f2+tlrc ${gResult}/svMCI/sub*_lDC_z+tlrc.HEAD > svMCI_lDC_f2_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_f2+tlrc ${gResult}/svMCI/sub*_rDC_z+tlrc.HEAD > svMCI_rDC_f2_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_z15+tlrc ${gResult}/svMCI/sub*_lDC_z+tlrc.HEAD > svMCI_zlDC_z15_.txt

#3dROIstats  -mask GrpANOVA_DC_Clust_mask_z15+tlrc ${gResult}/svMCI/sub*_rDC_z+tlrc.HEAD > svMCI_rDC_z15_z.txt

#3dROIstats  -mask GrpANOVA_DC_Clust_mask_z17+tlrc ${gResult}/svMCI/sub*_lDC_z+tlrc.HEAD > svMCI_lDC_z17_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_z17+tlrc ${gResult}/svMCI/sub*_rDC_z+tlrc.HEAD > svMCI_rDC_z17_z.txt


3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z15+tlrc ${gResult}/svMCI/sub*_lVSi_z+tlrc.HEAD > svMCI_lVSi_z15_z.txt

#3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z15+tlrc ${gResult}/svMCI/sub*_rVSi_z+tlrc.HEAD > svMCI_rVSi_z15_z.txt

#3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z17+tlrc ${gResult}/svMCI/sub*_lVSi_z+tlrc.HEAD > svMCI_lVSi_z17_z.txt

3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z17+tlrc ${gResult}/svMCI/sub*_rVSi_z+tlrc.HEAD > svMCI_rVSi_z17_z.txt


#******************************************************************************************

3dROIstats  -mask GrpANOVA_DC_Clust_mask_f2+tlrc ${gResult}/aMCI/sub*_lDC_z+tlrc.HEAD > aMCI_lDC_f2_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_f2+tlrc ${gResult}/aMCI/sub*_rDC_z+tlrc.HEAD > aMCI_rDC_f2_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_z15+tlrc ${gResult}/aMCI/sub*_lDC_z+tlrc.HEAD > aMCI_lDC_z15_z.txt

#3dROIstats  -mask GrpANOVA_DC_Clust_mask_z15+tlrc ${gResult}/aMCI/sub*_rDC_z+tlrc.HEAD > aMCI_rDC_z15_z.txt

#3dROIstats  -mask GrpANOVA_DC_Clust_mask_z17+tlrc ${gResult}/aMCI/sub*_lDC_z+tlrc.HEAD > aMCI_lDC_z17_z.txt

3dROIstats  -mask GrpANOVA_DC_Clust_mask_z17+tlrc ${gResult}/aMCI/sub*_rDC_z+tlrc.HEAD > aMCI_rDC_z17_z.txt


3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z15+tlrc ${gResult}/aMCI/sub*_lVSi_z+tlrc.HEAD > aMCI_lVSi_z15_z.txt

#3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z15+tlrc ${gResult}/aMCI/sub*_rVSi_z+tlrc.HEAD > aMCI_rVSi_z15_z.txt

#3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z17+tlrc ${gResult}/aMCI/sub*_lVSi_z+tlrc.HEAD > aMCI_lVSi_z17_z.txt

3dROIstats  -mask GrpANOVA_VSi_Clust_mask_z17+tlrc ${gResult}/aMCI/sub*_rVSi_z+tlrc.HEAD > aMCI_rVSi_z17_z.txt


