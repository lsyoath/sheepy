rtdir='/home/prot/LearningBehavior'
Dirs='20170912' #20170825
Rats='A1 A2 A3 P1 P3 P4 P5 R1 R2 R3 R4 R5'  #A1 A2 A3 P1 P2 P3 P4 P5 R1 R2 R3 R4 R5
for dir in ${Dirs}
do
  na=' '
  cd $rtdir/${dir}
  for rat in ${Rats}
  do 
    cd ${rtdir}/${dir}/${rat}
    ls -d ${rtdir}/${dir}/*${rat}*
    n=`ls -d ${rtdir}/${dir}/*${rat}* |wc -l`
    dd=`ls -d ${rtdir}/${dir}/*${rat}*`
    #echo ${n}
    
    for((i=1;i<=${n};i++))
    do 
      temp=`echo $dd|cut -d ' ' -f ${i}`
      /usr/local/mricrogl_lx/dcm2niix -a y -e N -g -o ./ ${temp} 
    done
  done

  for rat in ${Rats}
  do
    cd $rtdir/${dir}/${rat}
    #ls -d ${rtdir}/${dir}/*/*${rat}*_T2_*.nii
    n=`ls -d ${rtdir}/${dir}/*/*${rat}*_T2_*.nii |wc -l`
    dd=`ls -d ${rtdir}/${dir}/*/*${rat}*_T2_*.nii`
    for((i=1;i<=${n};i++))
    do
      temp=`echo $dd|cut -d ' ' -f ${i}`
      mv $temp  tmp.nii
      
      rm -f ${rat}_T2_${i}.nii
      3drefit -orient RPS tmp.nii
      3dresample -orient RPS -prefix ./${rat}_T2_${i}.nii -input tmp.nii
      3drefit -orient RAI ${rat}_T2_${i}.nii
      rm -f tmp*.nii
    done
    
    for((i=1;i<=n;i++))
    do
      rm -f ${rat}_T2_${i}_refit.nii
      3dcopy ${rat}_T2_${i}.nii tmp.nii
      3drefit -orient RPS tmp.nii
      3dresample -orient RPS -prefix ./${rat}_T2_${i}_refit.nii -input tmp.nii
      3drefit -orient RAI ${rat}_T2_${i}_refit.nii
      rm -f tmp.nii
    done
    
    #ls -d ${rtdir}/${dir}/*/*${rat}*T2star_*.nii
    n=`ls -d ${rtdir}/${dir}/*/*${rat}*_T2star_*.nii |wc -l`
    dd=`ls -d ${rtdir}/${dir}/*/*${rat}*_T2star_*.nii`
    for((i=1;i<=${n};i++))
    do
      temp=`echo $dd|cut -d ' ' -f ${i}`
      mv $temp  tmp.nii
      
      rm -f ${rat}_T2star_${i}.nii
      3drefit -orient RPS tmp.nii
      3dresample -orient RPS -prefix ./${rat}_T2star_${i}.nii -input tmp.nii
      3drefit -orient RAI ${rat}_T2star_${i}.nii
      rm -f tmp*.nii
    done
    
    for((i=1;i<=n;i++))
    do
      rm -f ${rat}_T2star_${i}_refit.nii
      3dcopy ${rat}_T2star_${i}.nii tmp.nii
      3drefit -orient RPS tmp.nii
      3dresample -orient RPS -prefix ./${rat}_T2star_${i}_refit.nii -input tmp.nii
      3drefit -orient RAI ${rat}_T2star_${i}_refit.nii
      rm -f tmp.nii
    done
  done
done
