
#rtdir='/Volumes/Elements/MouseResting/Data'
rtdir='/home/prot/LearningBehavior'
Dirs='20170825 20170912'
Rats='A1 A2 A3 P1 P2 P3 P4 P5 R1 R2 R3 R4 R5'  # 
na=' '
for dir in ${Dirs}
do
  cd $rtdir/${dir}
  for rat in ${Rats}
  do 
    cd ${rtdir}/${dir}/${rat}
    rm -rf ${rat}*
  done
done


#for rat in ${Rats}
#do
#  cd $rtdir/${rat}
#  ls -d ${rtdir}/*/*${rat}*_T2_*.nii
#  n=`ls -d ${rtdir}/*/*${rat}*_T2_*.nii |wc -l`
#  dd=`ls -d ${rtdir}/*/*${rat}*_T2_*.nii`
#  for((i=1;i<=${n};i++))
#  do
#    temp=`echo $dd|cut -d ' ' -f ${i}`
#    mv $temp  tmp.nii
#    
#    rm ${rat}_T2_${i}.nii
#    3drefit -orient RPS tmp.nii
#    3dresample -orient RPS -prefix ./${rat}_T2_${i}.nii -input tmp.nii
#    3drefit -orient RAI ${rat}_T2_${i}.nii
#    rm tmp*.nii
#  done
#  
#  
#done
