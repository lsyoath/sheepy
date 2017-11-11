#rtdir='/Volumes/Elements/Mouse/' # change the directory where you store the data
#
##### make masks for RS data from aligned anatomy ############################
#Rats="CON1 CON2 CON3 CON4 CON5 LW5 LW6 LW7 LW8 LW9 LWAFC1 LWAFC8 LWAFC9 LWAFC10 M3 M4 M5 M6 M9"

rtdir='/prot/MouseResting/YIkeSuo/Data'
Rats='1050 952 989 830 854 853 940 945 963 965 1055 888 969 978 1209 944 955 1054 896 901 961 984 1050 1079 902 932 948 949 960 966 976 986 1032 1072 886 895 942 946 950 979 1052 1068 1070 1071 1139 851 890 903 972 910 947' #1053
cd $rtdir

for rat in ${Rats} # change the parameter in the bracket to your subject list
do
  cd ${rtdir}/${rat}
  for((i=1;i<=2;i++))
  do
    rm -f ${rat}_BOLD_align_cut+orig*
    #3dZcutup -prefix ${rat}_BOLD2_align2_cut+orig -keep 11 27 ${rat}_BOLD2_align2+orig
    
    #3dresample -prefix ${rat}_BOLD_mask -master ${rat}_BOLD_align2_cut+orig -inset ${rtdir}/Dataset/All_Anatmask+orig
    # apply brain mask to BOLD images
    rm -f ${rat}_BOLD${i}_align2_masked+orig*
    #3dcalc -a  ${rat}_BOLD${i}_align2+orig -b ${rtdir}/atlas/anat_brainmask_rsmp.nii -expr 'a*b' -datum float -prefix ${rat}_BOLD${i}_align2_masked
    
    
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