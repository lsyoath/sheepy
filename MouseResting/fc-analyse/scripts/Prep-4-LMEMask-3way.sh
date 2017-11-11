
rtpath=/prot/MCI/Data

ROIs='vCa GP NAC vmPu dCa dlPu'

GrpLME_3way_aMCI_NC+tlrc
FBriks='2 6'

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.01 ; th1=6.968 ; th2=3.037; vol=`ccalc -eval "3*3*3"`

Clust=60

echo $th1 $th2

cd ${rtpath}/MCfc



3dcalc -a GrpLME_3way_aMCI_NC+tlrc -b ROI-fcmask+tlrc  -expr a*b -prefix GrpLME_fcmask-aMCI_NC

3dcalc -a GrpLME_3way_svMCI_NC+tlrc -b ROI-fcmask+tlrc  -expr a*b -prefix GrpLME_fcmask-svMCI_NC

3dcalc -a GrpLME_3way_aMCI_svMCI+tlrc -b ROI-fcmask+tlrc  -expr a*b -prefix GrpLME_fcmask-aMCI_svMCI

#***************************************************************************************************************************

	

3dclust -1Dformat -nosum -1thresh 6.96 -1dindex 2 -1tindex 2 -dxyz=1 -savemask GrpLME_aMCI_NC_Clust_mask_f2 1.01 60 GrpLME_fcmask-aMCI_NC+tlrc
  
3dcalc -a GrpLME_aMCI_NC_Clust_mask_f2+tlrc -b GrpLME_fcmask-aMCI_NC+tlrc"[2]" -expr 'step(a)*b' -prefix ClustMask_0.01_group_GrpLME_aMCI_NC



3dclust -1Dformat -nosum -1thresh 6.96 -1dindex 2 -1tindex 2 -dxyz=1 -savemask GrpLME_svMCI_NC_Clust_mask_f2 1.01 60 GrpLME_fcmask-svMCI_NC+tlrc
  
3dcalc -a GrpLME_svMCI_NC_Clust_mask_f2+tlrc -b GrpLME_fcmask-svMCI_NC+tlrc"[2]" -expr 'step(a)*b' -prefix ClustMask_0.01_group_GrpLME_svMCI_NC



3dclust -1Dformat -nosum -1thresh 6.96 -1dindex 2 -1tindex 2 -dxyz=1 -savemask GrpLME_aMCI_svMCI_Clust_mask_f2 1.01 60 GrpLME_fcmask-aMCI_svMCI+tlrc
  
3dcalc -a GrpLME_aMCI_svMCI_Clust_mask_f2+tlrc -b GrpLME_fcmask-aMCI_svMCI+tlrc"[2]" -expr 'step(a)*b' -prefix ClustMask_0.01_group_GrpLME_aMCI_svMCI

#***************************************************************************************************************************************************************



3dclust -1Dformat -nosum -1thresh 3.037 -1dindex 6 -1tindex 6 -dxyz=1 -savemask GrpLME_aMCI_NC_Clust_mask_f6 1.01 60 GrpLME_fcmask-aMCI_NC+tlrc
  
3dcalc -a GrpLME_aMCI_NC_Clust_mask_f6+tlrc -b GrpLME_fcmask-aMCI_NC+tlrc"[6]" -expr 'step(a)*b' -prefix ClustMask_0.01_group_VS_ROI_GrpLME_aMCI_NC



3dclust -1Dformat -nosum -1thresh 3.037 -1dindex 6 -1tindex 6 -dxyz=1 -savemask GrpLME_svMCI_NC_Clust_mask_f6 1.01 60 GrpLME_fcmask-svMCI_NC+tlrc
  
3dcalc -a GrpLME_svMCI_NC_Clust_mask_f6+tlrc -b GrpLME_fcmask-svMCI_NC+tlrc"[6]" -expr 'step(a)*b' -prefix ClustMask_0.01_group_VS_ROI_GrpLME_svMCI_NC



3dclust -1Dformat -nosum -1thresh 3.037 -1dindex 6 -1tindex 6 -dxyz=1 -savemask GrpLME_aMCI_svMCI_Clust_mask_f6 1.01 60 GrpLME_fcmask-aMCI_svMCI+tlrc
  
3dcalc -a GrpLME_aMCI_svMCI_Clust_mask_f6+tlrc -b GrpLME_fcmask-aMCI_svMCI+tlrc"[6]" -expr 'step(a)*b' -prefix ClustMask_0.01_group_VS_ROI_GrpLME_aMCI_svMCI

 




