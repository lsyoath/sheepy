#!/bin/bash
. /etc/profile
#*****Parameters need to change******
rtpath='/home/prot/MouseResting/YIkeSuo/Data' #RATS fc-analyse ATLAS
ROIs='CA1 CA2 CA3 GM' #
side='left right' #
#************************************
for s in ${side}
do
  for roi in ${ROIs}
  do
    cd ${rtpath}/fc-analyse/   #fc-result WtCON WtLNBP TgCON TgLNBP
    #  rm -f [AH]f*+orig.*
    #  rm -f m[AH]f*+orig.*
    #after the last step of processing, we've get a z-score for every-brain and now we are aiming to get a group-wise statistics which may be the statistical significance of the difference of two groups.  
    
    #intragroup 
#    3dttest -prefix ./fc-result/${s}_${roi}_WtLNBP -base1 0 -set2 ./WtLNBP/${s}_${roi}*_z+orig.HEAD 2> /dev/null  
#    3dttest -prefix ./fc-result/${s}_${roi}_WtCON -base1 0 -set2 ./WtCON/${s}_${roi}*_z+orig.HEAD 2> /dev/null  
    3dttest -prefix ./fc-result/${s}_${roi}_TgLNBP -base1 0 -set2 ./TgLNBP/${s}_${roi}*_z+orig.HEAD 2> /dev/null  
#    3dttest -prefix ./fc-result/${s}_${roi}_TgCON -base1 0 -set2 ./TgCON/${s}_${roi}*_z+orig.HEAD 2> /dev/null  
#    
#    3dcalc -a ./fc-result/${s}_${roi}_WtLNBP+orig -b ../atlas/anat_brainmask_rsmp.nii -expr a*b -prefix ./fc-result/${s}_${roi}_mWtLNBP
#    3dcalc -a ./fc-result/${s}_${roi}_WtCON+orig -b ../atlas/anat_brainmask_rsmp.nii -expr a*b -prefix ./fc-result/${s}_${roi}_mWtCON
#    3dcalc -a ./fc-result/${s}_${roi}_TgLNBP+orig -b ../atlas/anat_brainmask_rsmp.nii -expr a*b -prefix ./fc-result/${s}_${roi}_mTgLNBP
#    3dcalc -a ./fc-result/${s}_${roi}_TgCON+orig -b ../atlas/anat_brainmask_rsmp.nii -expr a*b -prefix ./fc-result/${s}_${roi}_mTgCON
#    
#    intergroup
#    3dttest -prefix ./fc-result/${s}_${roi}_TgCON_v_WtCON -set1 ./TgCON/${s}_${roi}*_z+orig.HEAD -set2 ./WtCON/${s}_${roi}*_z+orig.HEAD 2> /dev/null 
#    3dttest -prefix ./fc-result/${s}_${roi}_TgLNBP_v_WtCON -set1 ./TgLNBP/${s}_${roi}*_z+orig.HEAD -set2 ./WtCON/${s}_${roi}*_z+orig.HEAD 2> /dev/null 
#    3dttest -prefix ./fc-result/${s}_${roi}_TgLNBP_v_TgCON -set1 ./TgLNBP/${s}_${roi}*_z+orig.HEAD -set2 ./TgCON/${s}_${roi}*_z+orig.HEAD 2> /dev/null     
#      
#    3dcalc -a ./fc-result/${s}_${roi}_TgCON_v_WtCON+orig -b ../atlas/anat_brainmask_rsmp.nii -expr a*b -prefix ./fc-result/${s}_${roi}_mTgCON_v_WtCON
#    3dcalc -a ./fc-result/${s}_${roi}_TgLNBP_v_WtCON+orig -b ../atlas/anat_brainmask_rsmp.nii -expr a*b -prefix ./fc-result/${s}_${roi}_mTgLNBP_v_WtCON
    3dcalc -a ./fc-result/${s}_${roi}_TgLNBP_v_TgCON+orig -b ../atlas/anat_brainmask_rsmp.nii -expr a*b -prefix ./fc-result/${s}_${roi}_mTgLNBP_v_TgCON
    gzip *K
  done
done