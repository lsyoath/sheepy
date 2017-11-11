
#!/bin/bash

#rtpath="/prot/MCI/NC"
#rtpath="/prot/MCI/aMCI"
rtpath="/prot/MCI/svMCI"

#NC
#ARClist='sub101 sub102 sub104 sub105 sub106 sub107 sub109 sub111 sub112 sub117 sub120 sub121 sub126 sub127 sub132 sub133 sub134 sub139 sub141 sub143 sub145 sub146 sub147 sub149 sub150 sub155 sub156 sub157 sub159 sub161 sub163 sub168 sub169 sub170 sub171 sub173 sub176 sub177 sub181 sub182' 

#ARClist='sub126'

#aMCI
#ARClist='sub202 sub203 sub204 sub205 sub207 sub208 sub210 sub212 sub213 sub215 sub216 sub220 sub225 sub226 sub227 sub229 sub235 sub236 sub237 sub239 sub240 sub244 sub247 sub248 sub249 sub251 sub252 sub253 sub254 sub256 sub257 sub260 sub261 sub262 sub263 sub264 sub266 sub270 sub271 sub272'

#svMCI
ARClist=' sub01 sub04 sub03 sub05 sub06 sub08 sub09 sub10 sub11 sub12 sub13 sub14 sub15 sub16 sub19 sub21 sub22  sub25 sub26 sub29 sub30 sub31 sub32 sub33 sub35 sub36 sub37 sub38 sub39 sub41  sub43 sub44 sub45 sub46 sub48 sub51 sub50 sub53 sub55 sub56' 

#ROIs='rightVis leftVis rightVss leftVss rightDC leftDC rightDCP leftDCP rightDRP leftDRP rightVRP leftVRP rightaHipp leftaHipp rightpHipp leftpHipp'

ROIs='rightVis leftVis rightDC leftDC'

dx=(9 -9 10 -10 13 -13 28 -28 25 -25 20 -20 22 -22 22 -22)
dy=(-8 -8 -15 -15 -15 -15 -1 -1 -8 -8 -12 -12 5 5 31 31)
dz=(-7 -7 -1 -1 8 8 3 3 5 5 -3 -3 -15 -15 -3 -3)

##ROIs='rightVis'

#dx=(9)
#dy=(-8)
#dz=(-7)

rmm=6
var=rest_errt


for s in ${ARClist}
do
  cd ${rtpath}/${s}
	rm -f ${s}_brain_auto_mask*
	3dAutomask -prefix ${s}_brain_auto_mask+tlrc -dilate 2 ${s}_anat_ns_shft_alBOLDEC_shft+tlrc
	rm -f ${s}_brain_mask_rsmp*
	3dresample -master ${s}_${var}+tlrc -prefix ${s}_brain_mask_rsmp+tlrc -inset ${s}_brain_auto_mask+tlrc
  
#extract reference time courses from seed ROI
  cnt=0
  for roi in ${ROIs}
  do
    echo $s $cnt $roi
    3dmaskave -q -xball ${dx[$cnt]} ${dy[$cnt]} ${dz[$cnt]} $rmm  ${s}_${var}+tlrc.HEAD > ${s}_${roi}.1D
    cnt=`echo "${cnt}+1"|bc`
  done
 

  for roi in ${ROIs}
  do
    echo $s $roi
    rm -f ${s}_${roi}_cc+tlrc.*
    rm -f ${s}_${roi}_z+tlrc.*
	

    3dDeconvolve -GOFORIT 10 -input ${s}_${var}+tlrc.HEAD \
      -censor ${s}_censor.1D \
      -mask ${s}_brain_mask_rsmp+tlrc \
      -jobs 8 -float \
      -num_stimts 1 \
      -stim_file 1 ${s}_${roi}.1D \
      -stim_label 1 "${s}" \
      -tout -rout -bucket ${s}_buc
    3dcalc -a ${s}_buc+tlrc'[4]' -b ${s}_buc+tlrc'[2]' -expr "ispositive(b)*sqrt(a)-isnegative(b)*sqrt(a)" -prefix ${s}_${roi}_cc

# cc->Z-score transform using fisher's z-transform
    
3dcalc -a ${s}_${roi}_cc+tlrc -expr "0.5*log((1+a)/(1-a))" -datum float -prefix ${s}_${roi}_z
    rm -f ${s}_buc+tlrc.*
    rm -f ${s}_${roi}.1D
    #gzip *K
  done
done

 
