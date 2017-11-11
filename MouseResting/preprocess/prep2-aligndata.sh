rtdir='/prot/MouseResting/YIkeSuo/Data'
Rats='1050 952 989 830 854 853 940 945 963 965 1055 888 969 978 1209 944 955 1054 896 901 961 984 1050 1079 902 932 948 949 960 966 976 986 1032 1072 886 895 942 946 950 979 1052 1068 1070 1071 1139 851 890 903 972 910 947'  #1053 
cd $rtdir
na=''


#for rat in ${Rats} # change the parameter in the bracket to your subject list
#do
#  #mkdir -p  ${rat}
#  cd $rtdir/${rat}  
#  # make sure each rat has a folder under the rtdir you have defined
#########################################################################  
  #mv ${rtdir}/${rat}*.nii ./
  
  #rm -f ${rat}_T2_2_refit_to1.nii
  #3dAllineate -prefix ${rat}_T2_2_refit_to1.nii -base ${rat}_T2_1_refit.nii -source ${rat}_T2_2_refit.nii  -twopass -cost ls -1Dmatrix_save ${rat}_T2_2to1_align.aff12.1D
  #in this above command, you just need to change the input anatomical image file name for the option â€?sourceâ€? and change the directory where you store 23slice_masterAnat+orig* for # the option â€?baseâ€?
  
  # apply align matrix to transform BOLD images to template space
  #3dAllineate -prefix ${rat}_T2star_2_refit_to1.nii -source ${rat}_T2star_2_refit.nii  -1Dmatrix_apply ${rat}_T2_2to1_align.aff12.1D -final wsinc5
  
  
  #rm -f ${rat}_anat.nii
  #3dcalc -a ${rat}_T2_1_refit.nii -b ${rat}_T2_2_refit_to1.nii -expr "(a+b)/2" -prefix ${rat}_anat.nii
  
  #rm -f ${rat}_BOLD.nii
  #3dcalc -a ${rat}_T2star_1_refit.nii -b ${rat}_T2star_2_refit_to1.nii -expr "(a+b)/2" -prefix ${rat}_BOLD.nii
###########################################################################  

#belove needed, but comment teoporally  
 
#  # align T1 image to template space
#  rm -f ${rat}_anat1_align+orig*
#  3dAllineate -prefix ${rat}_anat1_align -base ${rtdir}/atlas/anatmask_origin_rsmp+orig -source ${rat}_T2_1_refit.nii  -twopass -cost ls -1Dmatrix_save ${rat}_anat1_align.aff12.1D
#  
#  rm -f ${rat}_anat2_align2+orig*
#  3dAllineate -prefix ${rat}_anat2_align -base ${rtdir}/atlas/anatmask_origin_rsmp+orig -source ${rat}_T2_2_refit.nii  -twopass -cost ls -1Dmatrix_save ${rat}_anat2_align.aff12.1D
#  
#  # in this above command, you just need to change the input anatomical image file name for the option â€?sourceâ€? and change the directory where you store 23slice_masterAnat+orig* for # the option â€?baseâ€?
#  
#  # apply align matrix to transform BOLD images to template space
#  rm -f ${rat}_BOLD1_align+*
#  3dAllineate -prefix ${rat}_BOLD1_align -source ${rat}_T2star_1_refit.nii  -1Dmatrix_apply ${rat}_anat1_align.aff12.1D -final wsinc5
#  
#  rm -f ${rat}_BOLD2_align+*
#  3dAllineate -prefix ${rat}_BOLD2_align -source ${rat}_T2star_2_refit.nii  -1Dmatrix_apply ${rat}_anat2_align.aff12.1D -final wsinc5

###########################################################################   
  # in this above command, you just need to change the input BOLD image file name for the option â€?sourceâ€?
  # If 3dAllineate doesn't give a satisfied aligned image, you may
  # need to try mannualy placing tags at anatomical landmarks
  # (using AFNI plugin "edit Tagset") on T1 image of each animal,
  # and on the anatomical template as well. Please see the attached # exempal image file. Then use 3dTagalign to align T1 image to
  # the template space.
  
  #3dTagalign -master ./mask/23slice_masterAnat+orig -affine -nokeeptags -matvec ${rat}_matvec-affine -prefix ${rat}_anat_align-affine ${rat}_anat.nii
  # in this above command, you just need to change the input anatomical image file name at the end of the command; and change the directory where you
  #\ store 23slice_masterAnat+orig*
  # for the option â€?masterâ€?
  # apply align matrix to transform BOLD images to template space
  #3dWarp -matvec_in2out ${rat}_matvec-affine -prefix ${rat}_BOLD_align-affine+orig ${rat}_BOLD+orig
  # in this above command, you just need to change the input BOLD image file name at the end of the comand
###########################################################################   
#  cd $rtdir
#done


###########################################################################
#needed but once enough    use all in Data
#cd $rtdir
#rm -f All_anat_align+*
#3dmerge -prefix All_anat_align ${rtdir}/*/*_anat*_align+orig*
#rm -f All_anat2template+*
#3dAllineate -prefix All_anat2template -base ${rtdir}/atlas/anatmask_origin_rsmp+orig -source All_anat_align+orig  -twopass -cost ls -1Dmatrix_save All_anat_align.aff12.1D
###########################################################################


cd $rtdir
for rat in ${Rats} # change the parameter in the bracket to your subject list
do
  cd $rtdir/${rat}
###########################################################################  

#belove needed, but comment teoporally 
#  rm -f ${rtdir}/${rat}/${rat}_anat1_align_mask+*
#  3dcalc -a ${rtdir}/atlas/anat_brainmask.nii -b ${rtdir}/${rat}/${rat}_anat1_align+orig -expr 'a*b' -prefix ${rtdir}/${rat}/${rat}_anat1_align_mask
#  # align T1 image to averaged space
#  rm -f ${rat}_anat_align_2All+orig* ${rtdir}/${rat}/${rat}_anat_align2All.aff12.1D
#  3dAllineate -base ${rtdir}/All_anat_align+orig -source ${rtdir}/${rat}/${rat}_anat1_align_mask+orig  -twopass -cost ls -1Dmatrix_save ${rtdir}/${rat}/${rat}_anat1_align2All.aff12.1D
#  # in this above command, you just need to change the input anatomical image file name for the option â€?sourceâ€? and change the directory where you #store 23slice_masterAnat+orig* for # the option â€?baseâ€?rm -f ${rtdir}/${rat}/${rat}_anat_align2template.1D
#  cat_matvec ${rtdir}/${rat}/${rat}_anat1_align2All.aff12.1D  ${rtdir}/All_anat_align.aff12.1D > ${rtdir}/${rat}/${rat}_anat1_align2template.1D
#  
#  rm -f ${rtdir}/${rat}/${rat}_anat2_align_mask+*
#  3dcalc -a ${rtdir}/atlas/anat_brainmask.nii -b ${rtdir}/${rat}/${rat}_anat2_align+orig -expr 'a*b' -prefix ${rtdir}/${rat}/${rat}_anat2_align_mask
#  rm -f ${rat}_anat2_align_2All+orig* ${rtdir}/${rat}/${rat}_anat2_align2All.aff12.1D
#  3dAllineate -base ${rtdir}/All_anat_align+orig -source ${rtdir}/${rat}/${rat}_anat2_align+orig  -twopass -cost ls -1Dmatrix_save ${rtdir}/${rat}/${rat}_anat2_align2All.aff12.1D
#  # in this above command, you just need to change the input anatomical image file name for the option â€?sourceâ€? and change the directory where you store 23slice_masterAnat+orig* for # the option â€?baseâ€?rm -f ${rtdir}/${rat}/${rat}_anat_align2template.1D
#  cat_matvec ${rtdir}/${rat}/${rat}_anat2_align2All.aff12.1D  ${rtdir}/All_anat_align.aff12.1D > ${rtdir}/${rat}/${rat}_anat2_align2template.1D
  
  
  # apply align matrix to transform BOLD images to template space
  
#  rm -f ${rtdir}/${rat}/${rat}_anat1_align2+*
#  3dAllineate -prefix ${rtdir}/${rat}/${rat}_anat1_align2 -source ${rtdir}/${rat}/${rat}_anat1_align_mask+orig. -1Dmatrix_apply ${rtdir}/${rat}/${rat}_anat1_align2template.1D -final wsinc5
#  
#  rm -f ${rtdir}/${rat}/${rat}_BOLD1_align_mask+*
#  3dcalc -a ${rtdir}/atlas/anat_brainmask_rsmp.nii -b ${rtdir}/${rat}/${rat}_BOLD1_align+orig -expr 'a*b' -prefix ${rtdir}/${rat}/${rat}_BOLD1_align_mask

  
  rm -f ${rtdir}/${rat}/${rat}_BOLD1_align2+*
  3dAllineate -master ${rtdir}/fc-analyse/fc-result/anat_brainmask_rsmp1.nii -prefix ${rtdir}/${rat}/${rat}_BOLD1_align2 -source ${rtdir}/${rat}/${rat}_BOLD1_align+orig  -1Dmatrix_apply ${rtdir}/${rat}/${rat}_anat1_align2template.1D -final wsinc5
  
#  rm -f ${rtdir}/${rat}/${rat}_anat2_align2+*
#  3dAllineate -prefix ${rtdir}/${rat}/${rat}_anat2_align2 -source ${rtdir}/${rat}/${rat}_anat2_align+orig.  -1Dmatrix_apply ${rtdir}/${rat}/${rat}_anat2_align2template.1D -final wsinc5
  
#  rm -f ${rtdir}/${rat}/${rat}_BOLD2_align_mask+*
#  3dcalc -a ${rtdir}/atlas/anat_brainmask_rsmp.nii -b ${rtdir}/${rat}/${rat}_BOLD2_align+orig -expr 'a*b' -prefix ${rtdir}/${rat}/${rat}_BOLD2_align_mask
  
  rm -f ${rtdir}/${rat}/${rat}_BOLD2_align2+*
  3dAllineate -master ${rtdir}/fc-analyse/fc-result/anat_brainmask_rsmp1.nii -prefix ${rtdir}/${rat}/${rat}_BOLD2_align2 -source ${rtdir}/${rat}/${rat}_BOLD2_align+orig  -1Dmatrix_apply ${rtdir}/${rat}/${rat}_anat2_align2template.1D -final wsinc5
###########################################################################################
  cd $rtdir
done