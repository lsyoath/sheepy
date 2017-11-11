#*****Parameters need to change******
#rtpath='/Volumes/Elements/Mouse/' # change the ${dir}ectory where you store the data
rtpath='/home/prot/MouseResting/YIkeSuo/Data/'
dir='TgCON' 
Rats='1139 1068 1070 1071 961 952 984 1079 960 955 888 963'  
#WtCON 890 947 886 896 902 976 948 910 950 944 946 978 945
#WtLNBP 979 942 986 901 895 989 949 854 972 969 903 851 940
#TgCON 1139 1068 1070 1071 961 952 984 1079 960 955 888 963
#TgLNBP 1052 966 830 1072 1032 932 1053 1209 1055 965 1050 1054
var='volreg_despike_blur_filter'
ROIs='CA1 CA2 CA3 GM'
side='left' #right
Session='BOLD1 BOLD2'
rmm=0.8
dx=(-0.734 -2.484 -2.584 -1.484) #(0.816 2.416 2.566 1.366)
dy=(-1.434 -1.084 -0.734 -1.134) #(-1.484 -1.184 -0.784 -1.084)
dz=1.136
#ROIfname=Ctxmask_rsmp.nii
na=''
#************************************


for rat in ${Rats} # change the parameter in the bracket to your subject list
do
  cd ${rtpath}/${rat}
  #extract reference time courses from seed ROI
  cnt=0
  for roi in ${ROIs}
  do
    echo $side $rat $roi $cnt
    for sess in ${Session}
    do
      rm -f ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}.1D
      
      #3dresample -orient RAI -prefix ${rat}_${var}_RAI -inset ${rat}_${var}+orig
      # 3dmaskave -mask ${rtpath}/atlas/${ROIfname} -mrange ${cnt} ${cnt} -quiet ${rat}_${var}+orig > ${rat}.1D
      3dmaskave -xball ${dx[$cnt]} ${dy[$cnt]} ${dz} ${rmm} -quiet ${rat}_${sess}_${var}+orig > ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}.1D
      #3dmaskave  -xball  -1.2 -1.2 1.2 1 -quiet ${rat}_${sess}_${var}+orig > ${rat}-${sess}.1D
      #3dmaskave  -xball  0 -2 2 1 -quiet ${rat}_${sess}_${var}+orig > ${rat}-${sess}.1D
       
      #echo $rat $cnt $roi
      rm -f ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}_buc+orig.*
      rm -f ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}+orig.*
      #if e 'censor.1D'
      3dDeconvolve -input ${rat}_${sess}_${var}+orig \
        -jobs 8 -float \
        -num_stimts 1 \
        -stim_file 1 ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}.1D \
        -stim_label 1 "${rat}" \
       -tout -rout -bucket ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}_buc
      3dcalc -a ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}_buc+orig'[4]' -b ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}_buc+orig'[2]' -expr "ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)" -prefix ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}
  
      # cc->Z-score transform using fisher's z-transform
      rm -f  ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}_z+orig* 
      3dcalc -a ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}+orig -expr "0.5*log((1+a)/(1-a))" -datum float -prefix ../fc-analyse/${dir}/${side}_${roi}_${rat}_${sess}_z
    done
    ((cnt++))
  done
done

#for rat in ${Rats}
#do
#cd ${rtpath}/zBackup
#3dAFNItoNIFTI ${rat}-PL-z+orig
#done