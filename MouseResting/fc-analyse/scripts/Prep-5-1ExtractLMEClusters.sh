#*****Parameters need to change******
rtpath='/prot/MCI'
#gResult='/prot/MCI/fc'

ROIs='DC Vis'
#************************************
cd ${rtpath}/MCfc

rm *DC_*_z.txt
rm *Vis_*_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_f2+tlrc ${rtpath}/NC/sub*/sub*_leftDC_z+tlrc.HEAD > NC_leftDC_f2_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_f2+tlrc ${rtpath}/NC/sub*/sub*_rightDC_z+tlrc.HEAD > NC_rightDC_f2_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z5+tlrc ${rtpath}/NC/sub*/sub*_leftDC_z+tlrc.HEAD > NC_leftDC_z5_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z7+tlrc ${rtpath}/NC/sub*/sub*_rightDC_z+tlrc.HEAD > NC_rightDC_z7_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z9+tlrc ${rtpath}/NC/sub*/sub*_leftDC_z+tlrc.HEAD > NC_leftDC_z9_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z11+tlrc ${rtpath}/NC/sub*/sub*_rightDC_z+tlrc.HEAD > NC_rightDC_z11_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z13+tlrc ${rtpath}/NC/sub*/sub*_leftDC_z+tlrc.HEAD > NC_leftDC_z13_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z15+tlrc ${rtpath}/NC/sub*/sub*_rightDC_z+tlrc.HEAD > NC_rightDC_z15_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z17+tlrc ${rtpath}/NC/sub*_leftDC_z+tlrc.HEAD > NC_leftDC_z17_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z17+tlrc ${rtpath}/NC/sub*_rightDC_z+tlrc.HEAD > NC_rightDC_z17_z.txt




#3dROIstats  -mask GrpLME_Vis_Clust_mask_f2+tlrc ${rtpath}/NC/sub*/sub*_leftVis_z+tlrc.HEAD > NC_leftVis_f2_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_f2+tlrc ${rtpath}/NC/sub*/sub*_rightVis_z+tlrc.HEAD > NC_rightVis_f2_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z5+tlrc ${rtpath}/NC/sub*/sub*_leftVis_z+tlrc.HEAD > NC_leftVis_z5_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z7+tlrc ${rtpath}/NC/sub*/sub*_leftVis_z+tlrc.HEAD > NC_leftVis_z7_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z11+tlrc ${rtpath}/NC/sub*/sub*_rightVis_z+tlrc.HEAD > NC_rightVis_z11_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z13+tlrc ${rtpath}/NC/sub*/sub*_leftVis_z+tlrc.HEAD > NC_leftVis_z13_z.txt

3dROIstats  -mask GrpLME_Vis_Clust_mask_z15+tlrc ${rtpath}/NC/sub*/sub*_rightVis_z+tlrc.HEAD > NC_rightVis_z15_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z17+tlrc ${rtpath}/NC/sub*_leftVis_z+tlrc.HEAD > NC_leftVis_z17_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z17+tlrc ${rtpath}/NC/sub*_rightVis_z+tlrc.HEAD > NC_rightVis_z17_z.txt




#*************************************************************************************



#3dROIstats  -mask GrpLME_DC_Clust_mask_f2+tlrc ${rtpath}/svMCI/sub*/sub*_leftDC_z+tlrc.HEAD > svMCI_leftDC_f2_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_f2+tlrc ${rtpath}/svMCI/sub*/sub*_rightDC_z+tlrc.HEAD > svMCI_rightDC_f2_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z5+tlrc ${rtpath}/svMCI/sub*/sub*_leftDC_z+tlrc.HEAD > svMCI_leftDC_z5_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z7+tlrc ${rtpath}/svMCI/sub*/sub*_rightDC_z+tlrc.HEAD > svMCI_rightDC_z7_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z9+tlrc ${rtpath}/svMCI/sub*/sub*_leftDC_z+tlrc.HEAD > svMCI_leftDC_z9_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z11+tlrc ${rtpath}/svMCI/sub*/sub*_rightDC_z+tlrc.HEAD > svMCI_rightDC_z11_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z13+tlrc ${rtpath}/svMCI/sub*/sub*_leftDC_z+tlrc.HEAD > svMCI_zleftDC_z13_.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z15+tlrc ${rtpath}/svMCI/sub*/sub*_rightDC_z+tlrc.HEAD > svMCI_rightDC_z15_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z17+tlrc ${rtpath}/svMCI/sub*_leftDC_z+tlrc.HEAD > svMCI_leftDC_z17_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z17+tlrc ${rtpath}/svMCI/sub*_rightDC_z+tlrc.HEAD > svMCI_rightDC_z17_z.txt




#3dROIstats  -mask GrpLME_Vis_Clust_mask_f2+tlrc ${rtpath}/svMCI/sub*/sub*_leftVis_z+tlrc.HEAD > svMCI_leftVis_f2_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_f2+tlrc ${rtpath}/svMCI/sub*/sub*_rightVis_z+tlrc.HEAD > svMCI_rightVis_f2_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z5+tlrc ${rtpath}/svMCI/sub*/sub*_leftVis_z+tlrc.HEAD > svMCI_leftVis_z5_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z7+tlrc ${rtpath}/svMCI/sub*/sub*_leftVis_z+tlrc.HEAD > svMCI_leftVis_z7_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z11+tlrc ${rtpath}/svMCI/sub*/sub*_rightVis_z+tlrc.HEAD > svMCI_rightVis_z11_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z13+tlrc ${rtpath}/svMCI/sub*/sub*_leftVis_z+tlrc.HEAD > svMCI_leftVis_z13_z.txt

3dROIstats  -mask GrpLME_Vis_Clust_mask_z15+tlrc ${rtpath}/svMCI/sub*/sub*_rightVis_z+tlrc.HEAD > svMCI_rightVis_z15_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z17+tlrc ${rtpath}/svMCI/sub*_leftVis_z+tlrc.HEAD > svMCI_leftVis_z17_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z17+tlrc ${rtpath}/svMCI/sub*_rightVis_z+tlrc.HEAD > svMCI_rightVis_z17_z.txt


#******************************************************************************************


#3dROIstats  -mask GrpLME_DC_Clust_mask_f2+tlrc ${rtpath}/aMCI/sub*/sub*_leftDC_z+tlrc.HEAD > aMCI_leftDC_f2_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_f2+tlrc ${rtpath}/aMCI/sub*/sub*_rightDC_z+tlrc.HEAD > aMCI_rightDC_f2_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z5+tlrc ${rtpath}/aMCI/sub*/sub*_leftDC_z+tlrc.HEAD > aMCI_leftDC_z5_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z7+tlrc ${rtpath}/aMCI/sub*/sub*_rightDC_z+tlrc.HEAD > aMCI_rightDC_z7_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z9+tlrc ${rtpath}/aMCI/sub*/sub*_leftDC_z+tlrc.HEAD > aMCI_leftDC_z9_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z11+tlrc ${rtpath}/aMCI/sub*/sub*_rightDC_z+tlrc.HEAD > aMCI_rightDC_z11_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z13+tlrc ${rtpath}/aMCI/sub*/sub*_leftDC_z+tlrc.HEAD > aMCI_leftDC_z13_z.txt

3dROIstats  -mask GrpLME_DC_Clust_mask_z15+tlrc ${rtpath}/aMCI/sub*/sub*_rightDC_z+tlrc.HEAD > aMCI_rightDC_z15_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z17+tlrc ${rtpath}/aMCI/sub*_leftDC_z+tlrc.HEAD > aMCI_leftDC_z17_z.txt

#3dROIstats  -mask GrpLME_DC_Clust_mask_z17+tlrc ${rtpath}/aMCI/sub*_rightDC_z+tlrc.HEAD > aMCI_rightDC_z17_z.txt





#3dROIstats  -mask GrpLME_Vis_Clust_mask_f2+tlrc ${rtpath}/aMCI/sub*/sub*_leftVis_z+tlrc.HEAD > aMCI_leftVis_f2_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_f2+tlrc ${rtpath}/aMCI/sub*/sub*_rightVis_z+tlrc.HEAD > aMCI_rightVis_f2_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z5+tlrc ${rtpath}/aMCI/sub*/sub*_leftVis_z+tlrc.HEAD > aMCI_leftVis_z5_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z9+tlrc ${rtpath}/aMCI/sub*/sub*_leftVis_z+tlrc.HEAD > aMCI_leftVis_z9_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z11+tlrc ${rtpath}/aMCI/sub*/sub*_rightVis_z+tlrc.HEAD > aMCI_rightVis_z11_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z13+tlrc ${rtpath}/aMCI/sub*/sub*_leftVis_z+tlrc.HEAD > aMCI_leftVis_z13_z.txt

3dROIstats  -mask GrpLME_Vis_Clust_mask_z15+tlrc ${rtpath}/aMCI/sub*/sub*_rightVis_z+tlrc.HEAD > aMCI_rightVis_z15_z.txt



#3dROIstats  -mask GrpLME_Vis_Clust_mask_z17+tlrc ${rtpath}/aMCI/sub*_leftVis_z+tlrc.HEAD > aMCI_leftVis_z17_z.txt

#3dROIstats  -mask GrpLME_Vis_Clust_mask_z17+tlrc ${rtpath}/aMCI/sub*_rightVis_z+tlrc.HEAD > aMCI_rightVis_z17_z.txt


