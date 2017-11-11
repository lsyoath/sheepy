
#rtdir='/Volumes/Elements/MouseResting/Data'
rtdir='/prot/MouseResting/YIkeSuo/Data'
#Rats='977	890	947	886	980	983	896	902	976	948	910	950	944	946	978	945968	971	979	942	986	901	895	989	949	854 972	969	903	851	941	940	904      954 957	958	1139 1140 1068 1070	1071 961 952 984 953 1079 960 955 888	963     1052	1006 1007 1008	966	1029	1082	830	1072	1032	932	1053 1209 1055	965	1050 1054'
Rats='910 947 1053 1050 952 989 830 854 853 940 945 963 965 1055 888 969 978 1209 944 955 1054 896 901 961 984 1050 1079 902 932 948 949 960 966 976 986 1032 1072 886 895 942 946 950 979 1052 1068 1070 1071 1139 851 890 903 972'  #
na=' '
cd $rtdir
for rat in ${Rats}
do 
  cd ${rtdir}/${rat}
  #ls -d ${rtdir}/*${rat}*
  n=`ls -d ${rtdir}/*${rat}* |wc -l`
  dd=`ls -d ${rtdir}/*${rat}*`
  
  for((i=1;i<=${n};i++))
  do 
    temp=`echo $dd|cut -d ' ' -f ${i}`
    /usr/local/mricrogl_lx/dcm2niix -a y -e N -g -o ./ ${temp} 
  done
done


for rat in ${Rats}
do
  cd $rtdir/${rat}
  #ls -d ${rtdir}/*/*${rat}*_T2_*.nii
  n=`ls -d ${rtdir}/*/*${rat}*_T2_*.nii |wc -l`
  dd=`ls -d ${rtdir}/*/*${rat}*_T2_*.nii`
  for((i=1;i<=${n};i++))
  do
    temp=`echo $dd|cut -d ' ' -f ${i}`
    mv $temp  tmp.nii
    
    rm ${rat}_T2_${i}.nii
    3drefit -orient RPS tmp.nii
    3dresample -orient RPS -prefix ./${rat}_T2_${i}.nii -input tmp.nii
    3drefit -orient RAI ${rat}_T2_${i}.nii
    rm tmp*.nii
  done
  
  for((i=1;i<=n;i++))
  do
    rm ${rat}_T2_${i}_refit.nii
    3dcopy ${rat}_T2_${i}.nii tmp.nii
    3drefit -orient RPS tmp.nii
    3dresample -orient RPS -prefix ./${rat}_T2_${i}_refit.nii -input tmp.nii
    3drefit -orient RAI ${rat}_T2_${i}_refit.nii
    rm tmp.nii
  done
  
  #ls -d ${rtdir}/*/*${rat}*T2star_*.nii
  n=`ls -d ${rtdir}/*/*${rat}*_T2star_*.nii |wc -l`
  dd=`ls -d ${rtdir}/*/*${rat}*_T2star_*.nii`
  for((i=1;i<=${n};i++))
  do
    temp=`echo $dd|cut -d ' ' -f ${i}`
    mv $temp  tmp.nii
    
    rm ${rat}_T2star_${i}.nii
    3drefit -orient RPS tmp.nii
    3dresample -orient RPS -prefix ./${rat}_T2star_${i}.nii -input tmp.nii
    3drefit -orient RAI ${rat}_T2star_${i}.nii
    rm tmp*.nii
  done
  
  for((i=1;i<=n;i++))
  do
    rm ${rat}_T2star_${i}_refit.nii
    3dcopy ${rat}_T2star_${i}.nii tmp.nii
    3drefit -orient RPS tmp.nii
    3dresample -orient RPS -prefix ./${rat}_T2star_${i}_refit.nii -input tmp.nii
    3drefit -orient RAI ${rat}_T2star_${i}_refit.nii
    rm tmp.nii
  done
done
