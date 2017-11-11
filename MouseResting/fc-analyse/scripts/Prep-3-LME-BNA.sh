#*****Parameters need to change******
rtpath='/prot/MCI/Data'

gResult=${rtpath}/fc
#ROIs='Vis Vss DC DCP DRP VRP aHipp pHipp'

#ROIs='lvCa rvCa lCP rCP lNAC rNAC lvmPu rvmPu ldCa rdCa ldlPu rdlPu'

ROIs='vCa GP NAC vmPu dCa dlPu'

#************************************
na=''

cd ${gResult}

for roi in ${ROIs}
do


  rm -f GrpLME_${roi}*
 3dLME -prefix GrpLME_${roi} -jobs 8 \
	-mask  /prot/MCI/Masks/CommonGMmask+tlrc \
	-model "hem*group" \
	-ranEff '~1' \
        -num_glt 6 \
	-gltLabel 1 'aMCI-NC_left' -gltCode 1 'group : 1*aMCI -1*NC hem : 1*left' \
	-gltLabel 2 'aMCI-NC_right' -gltCode 2 'group : 1*aMCI -1*NC hem : 1*right' \
	-gltLabel 3 'svMCI-NC_left' -gltCode 3 'group : 1*svMCI -1*NC hem : 1*left' \
	-gltLabel 4 'svMCI-NC_right' -gltCode 4 'group : 1*svMCI -1*NC hem : 1*right' \
	-gltLabel 5 'svMCI-aMCI_left' -gltCode 5 'group : 1*svMCI -1*aMCI hem : 1*left' \
	-gltLabel 6 'svMCI-aMCI_right' -gltCode 6 'group : 1*svMCI -1*aMCI hem : 1*right' \
        -dataTable \
Subj	group hem	InputFile \
sub101	NC	right	/prot/MCI/Data/NC/sub101/sub101_r${roi}_z3+tlrc \
sub102	NC	right	/prot/MCI/Data/NC/sub102/sub102_r${roi}_z3+tlrc	\
sub104	NC	right	/prot/MCI/Data/NC/sub104/sub104_r${roi}_z3+tlrc	\
sub105	NC	right	/prot/MCI/Data/NC/sub105/sub105_r${roi}_z3+tlrc	\
sub106	NC	right	/prot/MCI/Data/NC/sub106/sub106_r${roi}_z3+tlrc	\
sub107	NC	right	/prot/MCI/Data/NC/sub107/sub107_r${roi}_z3+tlrc \
sub109	NC	right	/prot/MCI/Data/NC/sub109/sub109_r${roi}_z3+tlrc	\
sub111	NC	right	/prot/MCI/Data/NC/sub111/sub111_r${roi}_z3+tlrc	\
sub112	NC	right	/prot/MCI/Data/NC/sub112/sub112_r${roi}_z3+tlrc	\
sub117	NC	right	/prot/MCI/Data/NC/sub117/sub117_r${roi}_z3+tlrc	\
sub120	NC	right	/prot/MCI/Data/NC/sub120/sub120_r${roi}_z3+tlrc	\
sub121	NC	right	/prot/MCI/Data/NC/sub121/sub121_r${roi}_z3+tlrc	\
sub126	NC	right	/prot/MCI/Data/NC/sub126/sub126_r${roi}_z3+tlrc	\
sub127	NC	right	/prot/MCI/Data/NC/sub127/sub127_r${roi}_z3+tlrc	\
sub132	NC	right	/prot/MCI/Data/NC/sub132/sub132_r${roi}_z3+tlrc	\
sub133	NC	right	/prot/MCI/Data/NC/sub133/sub133_r${roi}_z3+tlrc	\
sub134	NC	right	/prot/MCI/Data/NC/sub134/sub134_r${roi}_z3+tlrc	\
sub139	NC	right	/prot/MCI/Data/NC/sub139/sub139_r${roi}_z3+tlrc	\
sub141	NC	right	/prot/MCI/Data/NC/sub141/sub141_r${roi}_z3+tlrc	\
sub143	NC	right	/prot/MCI/Data/NC/sub143/sub143_r${roi}_z3+tlrc	\
sub145	NC	right	/prot/MCI/Data/NC/sub145/sub145_r${roi}_z3+tlrc	\
sub146	NC	right	/prot/MCI/Data/NC/sub146/sub146_r${roi}_z3+tlrc	\
sub147	NC	right	/prot/MCI/Data/NC/sub147/sub147_r${roi}_z3+tlrc	\
sub149	NC	right	/prot/MCI/Data/NC/sub147/sub147_r${roi}_z3+tlrc	\
sub150	NC	right	/prot/MCI/Data/NC/sub150/sub150_r${roi}_z3+tlrc	\
sub155	NC	right	/prot/MCI/Data/NC/sub155/sub155_r${roi}_z3+tlrc	\
sub156	NC	right	/prot/MCI/Data/NC/sub156/sub156_r${roi}_z3+tlrc	\
sub157	NC	right	/prot/MCI/Data/NC/sub157/sub157_r${roi}_z3+tlrc	\
sub159	NC	right	/prot/MCI/Data/NC/sub159/sub159_r${roi}_z3+tlrc	\
sub161	NC	right	/prot/MCI/Data/NC/sub161/sub161_r${roi}_z3+tlrc	\
sub163	NC	right	/prot/MCI/Data/NC/sub163/sub163_r${roi}_z3+tlrc	\
sub168	NC	right	/prot/MCI/Data/NC/sub168/sub168_r${roi}_z3+tlrc	\
sub169	NC	right	/prot/MCI/Data/NC/sub169/sub169_r${roi}_z3+tlrc	\
sub170	NC	right	/prot/MCI/Data/NC/sub170/sub170_r${roi}_z3+tlrc	\
sub171	NC	right	/prot/MCI/Data/NC/sub171/sub171_r${roi}_z3+tlrc	\
sub173	NC	right	/prot/MCI/Data/NC/sub173/sub173_r${roi}_z3+tlrc	\
sub176	NC	right	/prot/MCI/Data/NC/sub176/sub176_r${roi}_z3+tlrc	\
sub177	NC	right	/prot/MCI/Data/NC/sub177/sub177_r${roi}_z3+tlrc	\
sub181	NC	right	/prot/MCI/Data/NC/sub181/sub181_r${roi}_z3+tlrc	\
sub182	NC	right	/prot/MCI/Data/NC/sub182/sub182_r${roi}_z3+tlrc	\
sub101	NC	left	/prot/MCI/Data/NC/sub101/sub101_l${roi}_z3+tlrc \
sub102	NC	left	/prot/MCI/Data/NC/sub102/sub102_l${roi}_z3+tlrc	\
sub104	NC	left	/prot/MCI/Data/NC/sub104/sub104_l${roi}_z3+tlrc	\
sub105	NC	left	/prot/MCI/Data/NC/sub105/sub105_l${roi}_z3+tlrc	\
sub106	NC	left	/prot/MCI/Data/NC/sub106/sub106_l${roi}_z3+tlrc	\
sub107	NC	left	/prot/MCI/Data/NC/sub107/sub107_l${roi}_z3+tlrc	\
sub109	NC	left	/prot/MCI/Data/NC/sub109/sub109_l${roi}_z3+tlrc	\
sub111	NC	left	/prot/MCI/Data/NC/sub111/sub111_l${roi}_z3+tlrc	\
sub112	NC	left	/prot/MCI/Data/NC/sub112/sub112_l${roi}_z3+tlrc	\
sub117	NC	left	/prot/MCI/Data/NC/sub117/sub117_l${roi}_z3+tlrc	\
sub120	NC	left	/prot/MCI/Data/NC/sub120/sub120_l${roi}_z3+tlrc	\
sub121	NC	left	/prot/MCI/Data/NC/sub121/sub121_l${roi}_z3+tlrc	\
sub126	NC	left	/prot/MCI/Data/NC/sub126/sub126_l${roi}_z3+tlrc	\
sub127	NC	left	/prot/MCI/Data/NC/sub127/sub127_l${roi}_z3+tlrc	\
sub132	NC	left	/prot/MCI/Data/NC/sub132/sub132_l${roi}_z3+tlrc	\
sub133	NC	left	/prot/MCI/Data/NC/sub133/sub133_l${roi}_z3+tlrc	\
sub134	NC	left	/prot/MCI/Data/NC/sub134/sub134_l${roi}_z3+tlrc	\
sub139	NC	left	/prot/MCI/Data/NC/sub139/sub139_l${roi}_z3+tlrc	\
sub141	NC	left	/prot/MCI/Data/NC/sub141/sub141_l${roi}_z3+tlrc	\
sub143	NC	left	/prot/MCI/Data/NC/sub143/sub143_l${roi}_z3+tlrc	\
sub145	NC	left	/prot/MCI/Data/NC/sub145/sub145_l${roi}_z3+tlrc	\
sub146	NC	left	/prot/MCI/Data/NC/sub146/sub146_l${roi}_z3+tlrc	\
sub147	NC	left	/prot/MCI/Data/NC/sub147/sub147_l${roi}_z3+tlrc	\
sub149	NC	left	/prot/MCI/Data/NC/sub147/sub147_r${roi}_z3+tlrc	\
sub150	NC	left	/prot/MCI/Data/NC/sub150/sub150_l${roi}_z3+tlrc	\
sub155	NC	left	/prot/MCI/Data/NC/sub155/sub155_l${roi}_z3+tlrc	\
sub156	NC	left	/prot/MCI/Data/NC/sub156/sub156_l${roi}_z3+tlrc	\
sub157	NC	left	/prot/MCI/Data/NC/sub157/sub157_l${roi}_z3+tlrc	\
sub159	NC	left	/prot/MCI/Data/NC/sub159/sub159_l${roi}_z3+tlrc	\
sub161	NC	left	/prot/MCI/Data/NC/sub161/sub161_l${roi}_z3+tlrc	\
sub163	NC	left	/prot/MCI/Data/NC/sub163/sub163_l${roi}_z3+tlrc	\
sub168	NC	left	/prot/MCI/Data/NC/sub168/sub168_l${roi}_z3+tlrc	\
sub169	NC	left	/prot/MCI/Data/NC/sub169/sub169_l${roi}_z3+tlrc	\
sub170	NC	left	/prot/MCI/Data/NC/sub170/sub170_l${roi}_z3+tlrc	\
sub171	NC	left	/prot/MCI/Data/NC/sub171/sub171_l${roi}_z3+tlrc	\
sub173	NC	left	/prot/MCI/Data/NC/sub173/sub173_l${roi}_z3+tlrc	\
sub176	NC	left	/prot/MCI/Data/NC/sub176/sub176_l${roi}_z3+tlrc	\
sub177	NC	left	/prot/MCI/Data/NC/sub177/sub177_l${roi}_z3+tlrc	\
sub181	NC	left	/prot/MCI/Data/NC/sub181/sub181_l${roi}_z3+tlrc	\
sub182	NC	left	/prot/MCI/Data/NC/sub182/sub182_l${roi}_z3+tlrc	\
sub202	aMCI	right	/prot/MCI/Data/aMCI/sub202/sub202_r${roi}_z3+tlrc	\
sub203	aMCI	right	/prot/MCI/Data/aMCI/sub203/sub203_r${roi}_z3+tlrc	\
sub204	aMCI	right	/prot/MCI/Data/aMCI/sub203/sub203_r${roi}_z3+tlrc	\
sub205	aMCI	right	/prot/MCI/Data/aMCI/sub205/sub205_r${roi}_z3+tlrc	\
sub207	aMCI	right	/prot/MCI/Data/aMCI/sub207/sub207_r${roi}_z3+tlrc	\
sub208	aMCI	right	/prot/MCI/Data/aMCI/sub208/sub208_r${roi}_z3+tlrc	\
sub210	aMCI	right	/prot/MCI/Data/aMCI/sub208/sub208_r${roi}_z3+tlrc	\
sub212	aMCI	right	/prot/MCI/Data/aMCI/sub212/sub212_r${roi}_z3+tlrc	\
sub213	aMCI	right	/prot/MCI/Data/aMCI/sub213/sub213_r${roi}_z3+tlrc	\
sub215	aMCI	right	/prot/MCI/Data/aMCI/sub215/sub215_r${roi}_z3+tlrc	\
sub216	aMCI	right	/prot/MCI/Data/aMCI/sub216/sub216_r${roi}_z3+tlrc	\
sub220	aMCI	right	/prot/MCI/Data/aMCI/sub220/sub220_r${roi}_z3+tlrc	\
sub225	aMCI	right	/prot/MCI/Data/aMCI/sub225/sub225_r${roi}_z3+tlrc	\
sub226	aMCI	right	/prot/MCI/Data/aMCI/sub226/sub226_r${roi}_z3+tlrc	\
sub227	aMCI	right	/prot/MCI/Data/aMCI/sub227/sub227_r${roi}_z3+tlrc	\
sub229	aMCI	right	/prot/MCI/Data/aMCI/sub229/sub229_r${roi}_z3+tlrc	\
sub235	aMCI	right	/prot/MCI/Data/aMCI/sub235/sub235_r${roi}_z3+tlrc	\
sub236	aMCI	right	/prot/MCI/Data/aMCI/sub237/sub237_r${roi}_z3+tlrc	\
sub237	aMCI	right	/prot/MCI/Data/aMCI/sub237/sub237_r${roi}_z3+tlrc	\
sub239	aMCI	right	/prot/MCI/Data/aMCI/sub239/sub239_r${roi}_z3+tlrc	\
sub240	aMCI	right	/prot/MCI/Data/aMCI/sub240/sub240_r${roi}_z3+tlrc	\
sub244	aMCI	right	/prot/MCI/Data/aMCI/sub244/sub244_r${roi}_z3+tlrc	\
sub247	aMCI	right	/prot/MCI/Data/aMCI/sub247/sub247_r${roi}_z3+tlrc	\
sub248	aMCI	right	/prot/MCI/Data/aMCI/sub248/sub248_r${roi}_z3+tlrc	\
sub249	aMCI	right	/prot/MCI/Data/aMCI/sub249/sub249_r${roi}_z3+tlrc	\
sub251	aMCI	right	/prot/MCI/Data/aMCI/sub251/sub251_r${roi}_z3+tlrc	\
sub252	aMCI	right	/prot/MCI/Data/aMCI/sub252/sub252_r${roi}_z3+tlrc	\
sub253	aMCI	right	/prot/MCI/Data/aMCI/sub253/sub253_r${roi}_z3+tlrc	\
sub254	aMCI	right	/prot/MCI/Data/aMCI/sub254/sub254_r${roi}_z3+tlrc	\
sub256	aMCI	right	/prot/MCI/Data/aMCI/sub256/sub256_r${roi}_z3+tlrc	\
sub257	aMCI	right	/prot/MCI/Data/aMCI/sub257/sub257_r${roi}_z3+tlrc	\
sub260	aMCI	right	/prot/MCI/Data/aMCI/sub260/sub260_r${roi}_z3+tlrc	\
sub261	aMCI	right	/prot/MCI/Data/aMCI/sub261/sub261_r${roi}_z3+tlrc	\
sub262	aMCI	right	/prot/MCI/Data/aMCI/sub262/sub262_r${roi}_z3+tlrc	\
sub263	aMCI	right	/prot/MCI/Data/aMCI/sub263/sub263_r${roi}_z3+tlrc	\
sub264	aMCI	right	/prot/MCI/Data/aMCI/sub264/sub264_r${roi}_z3+tlrc	\
sub266	aMCI	right	/prot/MCI/Data/aMCI/sub266/sub266_r${roi}_z3+tlrc	\
sub270	aMCI	right	/prot/MCI/Data/aMCI/sub270/sub270_r${roi}_z3+tlrc	\
sub271	aMCI	right	/prot/MCI/Data/aMCI/sub271/sub271_r${roi}_z3+tlrc	\
sub272	aMCI	right	/prot/MCI/Data/aMCI/sub272/sub272_r${roi}_z3+tlrc	\
sub202	aMCI	left	/prot/MCI/Data/aMCI/sub202/sub202_l${roi}_z3+tlrc	\
sub203	aMCI	left	/prot/MCI/Data/aMCI/sub203/sub203_l${roi}_z3+tlrc	\
sub204	aMCI	left	/prot/MCI/Data/aMCI/sub203/sub203_l${roi}_z3+tlrc	\
sub205	aMCI	left	/prot/MCI/Data/aMCI/sub205/sub205_l${roi}_z3+tlrc	\
sub207	aMCI	left	/prot/MCI/Data/aMCI/sub207/sub207_l${roi}_z3+tlrc	\
sub208	aMCI	left	/prot/MCI/Data/aMCI/sub208/sub208_l${roi}_z3+tlrc	\
sub210	aMCI	left	/prot/MCI/Data/aMCI/sub208/sub208_l${roi}_z3+tlrc	\
sub212	aMCI	left	/prot/MCI/Data/aMCI/sub212/sub212_l${roi}_z3+tlrc	\
sub213	aMCI	left	/prot/MCI/Data/aMCI/sub213/sub213_l${roi}_z3+tlrc	\
sub215	aMCI	left	/prot/MCI/Data/aMCI/sub215/sub215_l${roi}_z3+tlrc	\
sub216	aMCI	left	/prot/MCI/Data/aMCI/sub216/sub216_l${roi}_z3+tlrc	\
sub220	aMCI	left	/prot/MCI/Data/aMCI/sub220/sub220_l${roi}_z3+tlrc	\
sub225	aMCI	left	/prot/MCI/Data/aMCI/sub225/sub225_l${roi}_z3+tlrc	\
sub226	aMCI	left	/prot/MCI/Data/aMCI/sub226/sub226_l${roi}_z3+tlrc	\
sub227	aMCI	left	/prot/MCI/Data/aMCI/sub227/sub227_l${roi}_z3+tlrc	\
sub229	aMCI	left	/prot/MCI/Data/aMCI/sub229/sub229_l${roi}_z3+tlrc	\
sub235	aMCI	left	/prot/MCI/Data/aMCI/sub235/sub235_l${roi}_z3+tlrc	\
sub236	aMCI	left	/prot/MCI/Data/aMCI/sub237/sub237_l${roi}_z3+tlrc	\
sub237	aMCI	left	/prot/MCI/Data/aMCI/sub237/sub237_l${roi}_z3+tlrc	\
sub239	aMCI	left	/prot/MCI/Data/aMCI/sub239/sub239_l${roi}_z3+tlrc	\
sub240	aMCI	left	/prot/MCI/Data/aMCI/sub240/sub240_l${roi}_z3+tlrc	\
sub244	aMCI	left	/prot/MCI/Data/aMCI/sub244/sub244_l${roi}_z3+tlrc	\
sub247	aMCI	left	/prot/MCI/Data/aMCI/sub247/sub247_l${roi}_z3+tlrc	\
sub248	aMCI	left	/prot/MCI/Data/aMCI/sub248/sub248_l${roi}_z3+tlrc	\
sub249	aMCI	left	/prot/MCI/Data/aMCI/sub249/sub249_l${roi}_z3+tlrc	\
sub251	aMCI	left	/prot/MCI/Data/aMCI/sub251/sub251_l${roi}_z3+tlrc	\
sub252	aMCI	left	/prot/MCI/Data/aMCI/sub252/sub252_l${roi}_z3+tlrc	\
sub253	aMCI	left	/prot/MCI/Data/aMCI/sub253/sub253_l${roi}_z3+tlrc	\
sub254	aMCI	left	/prot/MCI/Data/aMCI/sub254/sub254_l${roi}_z3+tlrc	\
sub256	aMCI	left	/prot/MCI/Data/aMCI/sub256/sub256_l${roi}_z3+tlrc	\
sub257	aMCI	left	/prot/MCI/Data/aMCI/sub257/sub257_l${roi}_z3+tlrc	\
sub260	aMCI	left	/prot/MCI/Data/aMCI/sub260/sub260_l${roi}_z3+tlrc	\
sub261	aMCI	left	/prot/MCI/Data/aMCI/sub261/sub261_l${roi}_z3+tlrc	\
sub262	aMCI	left	/prot/MCI/Data/aMCI/sub262/sub262_l${roi}_z3+tlrc	\
sub263	aMCI	left	/prot/MCI/Data/aMCI/sub263/sub263_l${roi}_z3+tlrc	\
sub264	aMCI	left	/prot/MCI/Data/aMCI/sub264/sub264_l${roi}_z3+tlrc	\
sub266	aMCI	left	/prot/MCI/Data/aMCI/sub266/sub266_l${roi}_z3+tlrc	\
sub270	aMCI	left	/prot/MCI/Data/aMCI/sub270/sub270_l${roi}_z3+tlrc	\
sub271	aMCI	left	/prot/MCI/Data/aMCI/sub271/sub271_l${roi}_z3+tlrc	\
sub272	aMCI	left	/prot/MCI/Data/aMCI/sub272/sub272_l${roi}_z3+tlrc	\
sub01	svMCI	right	/prot/MCI/Data/svMCI/sub01/sub01_r${roi}_z3+tlrc	\
sub03	svMCI	right	/prot/MCI/Data/svMCI/sub03/sub03_r${roi}_z3+tlrc	\
sub04	svMCI	right	/prot/MCI/Data/svMCI/sub04/sub04_r${roi}_z3+tlrc	\
sub05	svMCI	right	/prot/MCI/Data/svMCI/sub04/sub04_r${roi}_z3+tlrc	\
sub06	svMCI	right	/prot/MCI/Data/svMCI/sub04/sub04_r${roi}_z3+tlrc	\
sub08	svMCI	right	/prot/MCI/Data/svMCI/sub08/sub08_r${roi}_z3+tlrc	\
sub09	svMCI	right	/prot/MCI/Data/svMCI/sub09/sub09_r${roi}_z3+tlrc	\
sub10	svMCI	right	/prot/MCI/Data/svMCI/sub10/sub10_r${roi}_z3+tlrc	\
sub11	svMCI	right	/prot/MCI/Data/svMCI/sub11/sub11_r${roi}_z3+tlrc	\
sub12	svMCI	right	/prot/MCI/Data/svMCI/sub11/sub11_r${roi}_z3+tlrc	\
sub13	svMCI	right	/prot/MCI/Data/svMCI/sub13/sub13_r${roi}_z3+tlrc	\
sub14	svMCI	right	/prot/MCI/Data/svMCI/sub14/sub14_r${roi}_z3+tlrc	\
sub15	svMCI	right	/prot/MCI/Data/svMCI/sub15/sub15_r${roi}_z3+tlrc	\
sub16	svMCI	right	/prot/MCI/Data/svMCI/sub16/sub16_r${roi}_z3+tlrc	\
sub19	svMCI	right	/prot/MCI/Data/svMCI/sub19/sub19_r${roi}_z3+tlrc	\
sub21	svMCI	right	/prot/MCI/Data/svMCI/sub21/sub21_r${roi}_z3+tlrc	\
sub22	svMCI	right	/prot/MCI/Data/svMCI/sub21/sub21_r${roi}_z3+tlrc	\
sub25	svMCI	right	/prot/MCI/Data/svMCI/sub21/sub21_r${roi}_z3+tlrc	\
sub26	svMCI	right	/prot/MCI/Data/svMCI/sub26/sub26_r${roi}_z3+tlrc	\
sub29	svMCI	right	/prot/MCI/Data/svMCI/sub29/sub29_r${roi}_z3+tlrc	\
sub30	svMCI	right	/prot/MCI/Data/svMCI/sub30/sub30_r${roi}_z3+tlrc	\
sub31	svMCI	right	/prot/MCI/Data/svMCI/sub31/sub31_r${roi}_z3+tlrc	\
sub32	svMCI	right	/prot/MCI/Data/svMCI/sub32/sub32_r${roi}_z3+tlrc	\
sub33	svMCI	right	/prot/MCI/Data/svMCI/sub33/sub33_r${roi}_z3+tlrc	\
sub35	svMCI	right	/prot/MCI/Data/svMCI/sub35/sub35_r${roi}_z3+tlrc	\
sub36	svMCI	right	/prot/MCI/Data/svMCI/sub36/sub36_r${roi}_z3+tlrc	\
sub37	svMCI	right	/prot/MCI/Data/svMCI/sub37/sub37_r${roi}_z3+tlrc	\
sub38	svMCI	right	/prot/MCI/Data/svMCI/sub38/sub38_r${roi}_z3+tlrc	\
sub39	svMCI	right	/prot/MCI/Data/svMCI/sub39/sub39_r${roi}_z3+tlrc	\
sub41	svMCI	right	/prot/MCI/Data/svMCI/sub41/sub41_r${roi}_z3+tlrc	\
sub43	svMCI	right	/prot/MCI/Data/svMCI/sub43/sub43_r${roi}_z3+tlrc	\
sub44	svMCI	right	/prot/MCI/Data/svMCI/sub44/sub44_r${roi}_z3+tlrc	\
sub45	svMCI	right	/prot/MCI/Data/svMCI/sub45/sub45_r${roi}_z3+tlrc	\
sub46	svMCI	right	/prot/MCI/Data/svMCI/sub46/sub46_r${roi}_z3+tlrc	\
sub48	svMCI	right	/prot/MCI/Data/svMCI/sub48/sub48_r${roi}_z3+tlrc	\
sub50	svMCI	right	/prot/MCI/Data/svMCI/sub50/sub50_r${roi}_z3+tlrc	\
sub51	svMCI	right	/prot/MCI/Data/svMCI/sub51/sub51_r${roi}_z3+tlrc	\
sub53	svMCI	right	/prot/MCI/Data/svMCI/sub53/sub53_r${roi}_z3+tlrc	\
sub01	svMCI	left	/prot/MCI/Data/svMCI/sub01/sub01_l${roi}_z3+tlrc	\
sub03	svMCI	left	/prot/MCI/Data/svMCI/sub03/sub03_l${roi}_z3+tlrc	\
sub04	svMCI	left	/prot/MCI/Data/svMCI/sub04/sub04_l${roi}_z3+tlrc	\
sub05	svMCI	left	/prot/MCI/Data/svMCI/sub04/sub04_r${roi}_z3+tlrc	\
sub06	svMCI	left	/prot/MCI/Data/svMCI/sub04/sub04_r${roi}_z3+tlrc	\
sub08	svMCI	left	/prot/MCI/Data/svMCI/sub08/sub08_l${roi}_z3+tlrc	\
sub09	svMCI	left	/prot/MCI/Data/svMCI/sub09/sub09_l${roi}_z3+tlrc	\
sub10	svMCI	left	/prot/MCI/Data/svMCI/sub10/sub10_l${roi}_z3+tlrc	\
sub11	svMCI	left	/prot/MCI/Data/svMCI/sub11/sub11_l${roi}_z3+tlrc	\
sub12	svMCI	left	/prot/MCI/Data/svMCI/sub11/sub11_l${roi}_z3+tlrc	\
sub13	svMCI	left	/prot/MCI/Data/svMCI/sub13/sub13_l${roi}_z3+tlrc	\
sub14	svMCI	left	/prot/MCI/Data/svMCI/sub14/sub14_l${roi}_z3+tlrc	\
sub15	svMCI	left	/prot/MCI/Data/svMCI/sub15/sub15_l${roi}_z3+tlrc	\
sub16	svMCI	left	/prot/MCI/Data/svMCI/sub16/sub16_l${roi}_z3+tlrc	\
sub19	svMCI	left	/prot/MCI/Data/svMCI/sub19/sub19_l${roi}_z3+tlrc	\
sub21	svMCI	left	/prot/MCI/Data/svMCI/sub21/sub21_l${roi}_z3+tlrc	\
sub22	svMCI	left	/prot/MCI/Data/svMCI/sub21/sub21_l${roi}_z3+tlrc	\
sub25	svMCI	left	/prot/MCI/Data/svMCI/sub21/sub21_l${roi}_z3+tlrc	\
sub26	svMCI	left	/prot/MCI/Data/svMCI/sub26/sub26_l${roi}_z3+tlrc	\
sub29	svMCI	left	/prot/MCI/Data/svMCI/sub29/sub29_l${roi}_z3+tlrc	\
sub30	svMCI	left	/prot/MCI/Data/svMCI/sub30/sub30_l${roi}_z3+tlrc	\
sub31	svMCI	left	/prot/MCI/Data/svMCI/sub31/sub31_l${roi}_z3+tlrc	\
sub32	svMCI	left	/prot/MCI/Data/svMCI/sub32/sub32_l${roi}_z3+tlrc	\
sub33	svMCI	left	/prot/MCI/Data/svMCI/sub33/sub33_l${roi}_z3+tlrc	\
sub35	svMCI	left	/prot/MCI/Data/svMCI/sub35/sub35_l${roi}_z3+tlrc	\
sub36	svMCI	left	/prot/MCI/Data/svMCI/sub36/sub36_l${roi}_z3+tlrc	\
sub37	svMCI	left	/prot/MCI/Data/svMCI/sub37/sub37_l${roi}_z3+tlrc	\
sub38	svMCI	left	/prot/MCI/Data/svMCI/sub38/sub38_l${roi}_z3+tlrc	\
sub39	svMCI	left	/prot/MCI/Data/svMCI/sub39/sub39_l${roi}_z3+tlrc	\
sub41	svMCI	left	/prot/MCI/Data/svMCI/sub41/sub41_l${roi}_z3+tlrc	\
sub43	svMCI	left	/prot/MCI/Data/svMCI/sub43/sub43_l${roi}_z3+tlrc	\
sub44	svMCI	left	/prot/MCI/Data/svMCI/sub44/sub44_l${roi}_z3+tlrc	\
sub45	svMCI	left	/prot/MCI/Data/svMCI/sub45/sub45_l${roi}_z3+tlrc	\
sub46	svMCI	left	/prot/MCI/Data/svMCI/sub46/sub46_l${roi}_z3+tlrc	\
sub48	svMCI	left	/prot/MCI/Data/svMCI/sub48/sub48_l${roi}_z3+tlrc	\
sub50	svMCI	left	/prot/MCI/Data/svMCI/sub50/sub50_l${roi}_z3+tlrc	\
sub51	svMCI	left	/prot/MCI/Data/svMCI/sub51/sub51_l${roi}_z3+tlrc	\
sub53	svMCI	left	/prot/MCI/Data/svMCI/sub53/sub53_l${roi}_z3+tlrc	

done






