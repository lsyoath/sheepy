#rtdir='/Volumes/Elements/Mouse/' # change the directory where you store the data
#
##### make masks for RS data from aligned anatomy ############################
#Rats="CON1 CON2 CON3 CON4 CON5 LW5 LW6 LW7 LW8 LW9 LWAFC1 LWAFC8 LWAFC9 LWAFC10 M3 M4 M5 M6 M9"

rtdir='/home/prot/LearningBehavior'
dir='20170825' #20170912
Rats='A1 A2 A3 P1 P2 P3 P4 P5 R1 R2 R3 R4 R5'  #A1 A2 A3 P1 P2 P3 P4 P5 R1 R2 R3 R4 R5   #A1 A2 A3 P1 P3 P4 P5 R1 R2 R3 R4 R5
cd $rtdir/${dir}

for rat in ${Rats} # change the parameter in the bracket to your subject list
do
  cd ${rtdir}/${dir}/${rat}
  for((i=1;i<=2;i++))
  do
    rm -f ${rat}_BOLD_align_cut+orig*
    #3dZcutup -prefix ${rat}_BOLD2_align2_cut+orig -keep 11 27 ${rat}_BOLD2_align2+orig
    
    #3dresample -prefix ${rat}_BOLD_mask -master ${rat}_BOLD_align2_cut+orig -inset ${rtdir}/${dir}/Dataset/All_Anatmask+orig
    # apply brain mask to BOLD images
    rm -f ${rat}_BOLD${i}_align2_masked+orig*
    #3dcalc -a  ${rat}_BOLD${i}_align2+orig -b ${rtdir}/${dir}/atlas/anat_brainmask_rsmp.nii -expr 'a*b' -datum float -prefix ${rat}_BOLD${i}_align2_masked
    
    
    rm -f ${rat}_BOLD${i}_volreg+orig*
    rm -f ${rat}_BOLD${i}_volreg_parameters*
    3dvolreg -tshift 0 -zpad 4 -prefix ${rat}_BOLD${i}_volreg -1Dfile ${rat}_BOLD${i}_volreg_parameters  ${rat}_BOLD${i}_align2+orig[10..299]
    # in the above command, make sure the input file name is correct - the aligned BOLD
    # image file name
    
    
    #####################   Despike, and Gaussian spatial smoothing (0.4 mm FWHM) ###################
    
    rm -f ${rat}_BOLD${i}_volregbe_despike+orig*
    3dDespike -prefix ${rat}_BOLD${i}_volreg_despike -nomask ${rat}_BOLD${i}_volreg+orig
    rm -f ${rat}_BOLD${i}_volreg+orig*
    
    #####smooth
    rm -f ${rat}_BOLD${i}_volreg_despike_blur+orig*
    3dmerge -doall -1blur_fwhm 0.6 -prefix ${rat}_BOLD${i}_volreg_despike_blur ${rat}_BOLD${i}_volreg_despike+orig
    rm -f ${rat}_BOLD${i}_volreg_despike+orig*
    
    ## bandpass
    rm -f ${rat}_BOLD${i}_volreg_despike_blur_filter+orig*
    3dBandpass -prefix ${rat}_BOLD${i}_volreg_despike_blur_filter \
    0.01 1 ${rat}_BOLD${i}_volreg_despike_blur+orig
    rm -f ${rat}_BOLD${i}_volreg_despike_blur+orig*
    
    gzip *.BRIK
  done
done