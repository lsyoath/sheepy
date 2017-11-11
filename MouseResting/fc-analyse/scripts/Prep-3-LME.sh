#*****Parameters need to change******
rtpath='/prot/MCI'
gResult=${rtpath}/fc
#ROIs='Vis Vss DC DCP DRP VRP aHipp pHipp'
ROIs='Vis DC'

#************************************
na=''

cd ${gResult}

for roi in ${ROIs}
do


  rm -f GrpLME_${roi}*
 3dLME -prefix GrpLME_${roi} -jobs 8 \
	-mask  $rtpath/masks/CommonGMmask+tlrc \
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
	Subj	group	hem	InputFile \
sub101	NC	right	/prot/MCI/NC/sub101/sub101_right${roi}_z+tlrc   \
sub102	NC	right	/prot/MCI/NC/sub102/sub102_right${roi}_z+tlrc	\
sub104	NC	right	/prot/MCI/NC/sub104/sub104_right${roi}_z+tlrc	\
sub105	NC	right	/prot/MCI/NC/sub105/sub105_right${roi}_z+tlrc	\
sub106	NC	right	/prot/MCI/NC/sub106/sub106_right${roi}_z+tlrc	\
sub107	NC	right	/prot/MCI/NC/sub107/sub107_right${roi}_z+tlrc   \
sub109	NC	right	/prot/MCI/NC/sub109/sub109_right${roi}_z+tlrc	\
sub111	NC	right	/prot/MCI/NC/sub111/sub111_right${roi}_z+tlrc	\
sub112	NC	right	/prot/MCI/NC/sub112/sub112_right${roi}_z+tlrc	\
sub117	NC	right	/prot/MCI/NC/sub117/sub117_right${roi}_z+tlrc	\
sub120	NC	right	/prot/MCI/NC/sub120/sub120_right${roi}_z+tlrc	\
sub121	NC	right	/prot/MCI/NC/sub121/sub121_right${roi}_z+tlrc	\
sub126	NC	right	/prot/MCI/NC/sub126/sub126_right${roi}_z+tlrc	\
sub127	NC	right	/prot/MCI/NC/sub127/sub127_right${roi}_z+tlrc	\
sub132	NC	right	/prot/MCI/NC/sub132/sub132_right${roi}_z+tlrc	\
sub133	NC	right	/prot/MCI/NC/sub133/sub133_right${roi}_z+tlrc	\
sub134	NC	right	/prot/MCI/NC/sub134/sub134_right${roi}_z+tlrc	\
sub139	NC	right	/prot/MCI/NC/sub139/sub139_right${roi}_z+tlrc	\
sub141	NC	right	/prot/MCI/NC/sub141/sub141_right${roi}_z+tlrc	\
sub143	NC	right	/prot/MCI/NC/sub143/sub143_right${roi}_z+tlrc	\
sub145	NC	right	/prot/MCI/NC/sub145/sub145_right${roi}_z+tlrc	\
sub146	NC	right	/prot/MCI/NC/sub146/sub146_right${roi}_z+tlrc	\
sub147	NC	right	/prot/MCI/NC/sub147/sub147_right${roi}_z+tlrc	\
sub149	NC	right	/prot/MCI/NC/sub149/sub149_right${roi}_z+tlrc	\
sub150	NC	right	/prot/MCI/NC/sub150/sub150_right${roi}_z+tlrc	\
sub155	NC	right	/prot/MCI/NC/sub155/sub155_right${roi}_z+tlrc	\
sub156	NC	right	/prot/MCI/NC/sub156/sub156_right${roi}_z+tlrc	\
sub157	NC	right	/prot/MCI/NC/sub157/sub157_right${roi}_z+tlrc	\
sub159	NC	right	/prot/MCI/NC/sub159/sub159_right${roi}_z+tlrc	\
sub161	NC	right	/prot/MCI/NC/sub161/sub161_right${roi}_z+tlrc	\
sub163	NC	right	/prot/MCI/NC/sub163/sub163_right${roi}_z+tlrc	\
sub168	NC	right	/prot/MCI/NC/sub168/sub168_right${roi}_z+tlrc	\
sub169	NC	right	/prot/MCI/NC/sub169/sub169_right${roi}_z+tlrc	\
sub170	NC	right	/prot/MCI/NC/sub170/sub170_right${roi}_z+tlrc	\
sub171	NC	right	/prot/MCI/NC/sub171/sub171_right${roi}_z+tlrc	\
sub173	NC	right	/prot/MCI/NC/sub173/sub173_right${roi}_z+tlrc	\
sub176	NC	right	/prot/MCI/NC/sub176/sub176_right${roi}_z+tlrc	\
sub177	NC	right	/prot/MCI/NC/sub177/sub177_right${roi}_z+tlrc	\
sub181	NC	right	/prot/MCI/NC/sub181/sub181_right${roi}_z+tlrc	\
sub182	NC	right	/prot/MCI/NC/sub182/sub182_right${roi}_z+tlrc	\
sub101	NC	left	/prot/MCI/NC/sub101/sub101_left${roi}_z+tlrc   \
sub102	NC	left	/prot/MCI/NC/sub102/sub102_left${roi}_z+tlrc	\
sub104	NC	left	/prot/MCI/NC/sub104/sub104_left${roi}_z+tlrc	\
sub105	NC	left	/prot/MCI/NC/sub105/sub105_left${roi}_z+tlrc	\
sub106	NC	left	/prot/MCI/NC/sub106/sub106_left${roi}_z+tlrc	\
sub107	NC	left	/prot/MCI/NC/sub107/sub107_left${roi}_z+tlrc	\
sub109	NC	left	/prot/MCI/NC/sub109/sub109_left${roi}_z+tlrc	\
sub111	NC	left	/prot/MCI/NC/sub111/sub111_left${roi}_z+tlrc	\
sub112	NC	left	/prot/MCI/NC/sub112/sub112_left${roi}_z+tlrc	\
sub117	NC	left	/prot/MCI/NC/sub117/sub117_left${roi}_z+tlrc	\
sub120	NC	left	/prot/MCI/NC/sub120/sub120_left${roi}_z+tlrc	\
sub121	NC	left	/prot/MCI/NC/sub121/sub121_left${roi}_z+tlrc	\
sub126	NC	left	/prot/MCI/NC/sub126/sub126_left${roi}_z+tlrc	\
sub127	NC	left	/prot/MCI/NC/sub127/sub127_left${roi}_z+tlrc	\
sub132	NC	left	/prot/MCI/NC/sub132/sub132_left${roi}_z+tlrc	\
sub133	NC	left	/prot/MCI/NC/sub133/sub133_left${roi}_z+tlrc	\
sub134	NC	left	/prot/MCI/NC/sub134/sub134_left${roi}_z+tlrc	\
sub139	NC	left	/prot/MCI/NC/sub139/sub139_left${roi}_z+tlrc	\
sub141	NC	left	/prot/MCI/NC/sub141/sub141_left${roi}_z+tlrc	\
sub143	NC	left	/prot/MCI/NC/sub143/sub143_left${roi}_z+tlrc	\
sub145	NC	left	/prot/MCI/NC/sub145/sub145_left${roi}_z+tlrc	\
sub146	NC	left	/prot/MCI/NC/sub146/sub146_left${roi}_z+tlrc	\
sub147	NC	left	/prot/MCI/NC/sub147/sub147_left${roi}_z+tlrc	\
sub149	NC	left	/prot/MCI/NC/sub149/sub149_left${roi}_z+tlrc	\
sub150	NC	left	/prot/MCI/NC/sub150/sub150_left${roi}_z+tlrc	\
sub155	NC	left	/prot/MCI/NC/sub155/sub155_left${roi}_z+tlrc	\
sub156	NC	left	/prot/MCI/NC/sub156/sub156_left${roi}_z+tlrc	\
sub157	NC	left	/prot/MCI/NC/sub157/sub157_left${roi}_z+tlrc	\
sub159	NC	left	/prot/MCI/NC/sub159/sub159_left${roi}_z+tlrc	\
sub161	NC	left	/prot/MCI/NC/sub161/sub161_left${roi}_z+tlrc	\
sub163	NC	left	/prot/MCI/NC/sub163/sub163_left${roi}_z+tlrc	\
sub168	NC	left	/prot/MCI/NC/sub168/sub168_left${roi}_z+tlrc	\
sub169	NC	left	/prot/MCI/NC/sub169/sub169_left${roi}_z+tlrc	\
sub170	NC	left	/prot/MCI/NC/sub170/sub170_left${roi}_z+tlrc	\
sub171	NC	left	/prot/MCI/NC/sub171/sub171_left${roi}_z+tlrc	\
sub173	NC	left	/prot/MCI/NC/sub173/sub173_left${roi}_z+tlrc	\
sub176	NC	left	/prot/MCI/NC/sub176/sub176_left${roi}_z+tlrc	\
sub177	NC	left	/prot/MCI/NC/sub177/sub177_left${roi}_z+tlrc	\
sub181	NC	left	/prot/MCI/NC/sub181/sub181_left${roi}_z+tlrc	\
sub182	NC	left	/prot/MCI/NC/sub182/sub182_left${roi}_z+tlrc	\
sub202	aMCI	right	/prot/MCI/aMCI/sub202/sub202_right${roi}_z+tlrc	\
sub203	aMCI	right	/prot/MCI/aMCI/sub203/sub203_right${roi}_z+tlrc	\
sub204	aMCI	right	/prot/MCI/aMCI/sub204/sub204_right${roi}_z+tlrc	\
sub205	aMCI	right	/prot/MCI/aMCI/sub205/sub205_right${roi}_z+tlrc	\
sub207	aMCI	right	/prot/MCI/aMCI/sub207/sub207_right${roi}_z+tlrc	\
sub208	aMCI	right	/prot/MCI/aMCI/sub208/sub208_right${roi}_z+tlrc	\
sub210	aMCI	right	/prot/MCI/aMCI/sub210/sub210_right${roi}_z+tlrc	\
sub212	aMCI	right	/prot/MCI/aMCI/sub212/sub212_right${roi}_z+tlrc	\
sub213	aMCI	right	/prot/MCI/aMCI/sub213/sub213_right${roi}_z+tlrc	\
sub215	aMCI	right	/prot/MCI/aMCI/sub215/sub215_right${roi}_z+tlrc	\
sub216	aMCI	right	/prot/MCI/aMCI/sub216/sub216_right${roi}_z+tlrc	\
sub220	aMCI	right	/prot/MCI/aMCI/sub220/sub220_right${roi}_z+tlrc	\
sub225	aMCI	right	/prot/MCI/aMCI/sub225/sub225_right${roi}_z+tlrc	\
sub226	aMCI	right	/prot/MCI/aMCI/sub226/sub226_right${roi}_z+tlrc	\
sub227	aMCI	right	/prot/MCI/aMCI/sub227/sub227_right${roi}_z+tlrc	\
sub229	aMCI	right	/prot/MCI/aMCI/sub229/sub229_right${roi}_z+tlrc	\
sub235	aMCI	right	/prot/MCI/aMCI/sub235/sub235_right${roi}_z+tlrc	\
sub236	aMCI	right	/prot/MCI/aMCI/sub236/sub236_right${roi}_z+tlrc	\
sub237	aMCI	right	/prot/MCI/aMCI/sub237/sub237_right${roi}_z+tlrc	\
sub239	aMCI	right	/prot/MCI/aMCI/sub239/sub239_right${roi}_z+tlrc	\
sub240	aMCI	right	/prot/MCI/aMCI/sub240/sub240_right${roi}_z+tlrc	\
sub244	aMCI	right	/prot/MCI/aMCI/sub244/sub244_right${roi}_z+tlrc	\
sub247	aMCI	right	/prot/MCI/aMCI/sub247/sub247_right${roi}_z+tlrc	\
sub248	aMCI	right	/prot/MCI/aMCI/sub248/sub248_right${roi}_z+tlrc	\
sub249	aMCI	right	/prot/MCI/aMCI/sub249/sub249_right${roi}_z+tlrc	\
sub251	aMCI	right	/prot/MCI/aMCI/sub251/sub251_right${roi}_z+tlrc	\
sub252	aMCI	right	/prot/MCI/aMCI/sub252/sub252_right${roi}_z+tlrc	\
sub253	aMCI	right	/prot/MCI/aMCI/sub253/sub253_right${roi}_z+tlrc	\
sub254	aMCI	right	/prot/MCI/aMCI/sub254/sub254_right${roi}_z+tlrc	\
sub256	aMCI	right	/prot/MCI/aMCI/sub256/sub256_right${roi}_z+tlrc	\
sub257	aMCI	right	/prot/MCI/aMCI/sub257/sub257_right${roi}_z+tlrc	\
sub260	aMCI	right	/prot/MCI/aMCI/sub260/sub260_right${roi}_z+tlrc	\
sub261	aMCI	right	/prot/MCI/aMCI/sub261/sub261_right${roi}_z+tlrc	\
sub262	aMCI	right	/prot/MCI/aMCI/sub262/sub262_right${roi}_z+tlrc	\
sub263	aMCI	right	/prot/MCI/aMCI/sub263/sub263_right${roi}_z+tlrc	\
sub264	aMCI	right	/prot/MCI/aMCI/sub264/sub264_right${roi}_z+tlrc	\
sub266	aMCI	right	/prot/MCI/aMCI/sub266/sub266_right${roi}_z+tlrc	\
sub270	aMCI	right	/prot/MCI/aMCI/sub270/sub270_right${roi}_z+tlrc	\
sub271	aMCI	right	/prot/MCI/aMCI/sub271/sub271_right${roi}_z+tlrc	\
sub272	aMCI	right	/prot/MCI/aMCI/sub272/sub272_right${roi}_z+tlrc	\
sub202	aMCI	left	/prot/MCI/aMCI/sub202/sub202_left${roi}_z+tlrc	\
sub203	aMCI	left	/prot/MCI/aMCI/sub203/sub203_left${roi}_z+tlrc	\
sub204	aMCI	left	/prot/MCI/aMCI/sub204/sub204_left${roi}_z+tlrc	\
sub205	aMCI	left	/prot/MCI/aMCI/sub205/sub205_left${roi}_z+tlrc	\
sub207	aMCI	left	/prot/MCI/aMCI/sub207/sub207_left${roi}_z+tlrc	\
sub208	aMCI	left	/prot/MCI/aMCI/sub208/sub208_left${roi}_z+tlrc	\
sub210	aMCI	left	/prot/MCI/aMCI/sub210/sub210_left${roi}_z+tlrc	\
sub212	aMCI	left	/prot/MCI/aMCI/sub212/sub212_left${roi}_z+tlrc	\
sub213	aMCI	left	/prot/MCI/aMCI/sub213/sub213_left${roi}_z+tlrc	\
sub215	aMCI	left	/prot/MCI/aMCI/sub215/sub215_left${roi}_z+tlrc	\
sub216	aMCI	left	/prot/MCI/aMCI/sub216/sub216_left${roi}_z+tlrc	\
sub220	aMCI	left	/prot/MCI/aMCI/sub220/sub220_left${roi}_z+tlrc	\
sub225	aMCI	left	/prot/MCI/aMCI/sub225/sub225_left${roi}_z+tlrc	\
sub226	aMCI	left	/prot/MCI/aMCI/sub226/sub226_left${roi}_z+tlrc	\
sub227	aMCI	left	/prot/MCI/aMCI/sub227/sub227_left${roi}_z+tlrc	\
sub229	aMCI	left	/prot/MCI/aMCI/sub229/sub229_left${roi}_z+tlrc	\
sub235	aMCI	left	/prot/MCI/aMCI/sub235/sub235_left${roi}_z+tlrc	\
sub236	aMCI	left	/prot/MCI/aMCI/sub236/sub236_left${roi}_z+tlrc	\
sub237	aMCI	left	/prot/MCI/aMCI/sub237/sub237_left${roi}_z+tlrc	\
sub239	aMCI	left	/prot/MCI/aMCI/sub239/sub239_left${roi}_z+tlrc	\
sub240	aMCI	left	/prot/MCI/aMCI/sub240/sub240_left${roi}_z+tlrc	\
sub244	aMCI	left	/prot/MCI/aMCI/sub244/sub244_left${roi}_z+tlrc	\
sub247	aMCI	left	/prot/MCI/aMCI/sub247/sub247_left${roi}_z+tlrc	\
sub248	aMCI	left	/prot/MCI/aMCI/sub248/sub248_left${roi}_z+tlrc	\
sub249	aMCI	left	/prot/MCI/aMCI/sub249/sub249_left${roi}_z+tlrc	\
sub251	aMCI	left	/prot/MCI/aMCI/sub251/sub251_left${roi}_z+tlrc	\
sub252	aMCI	left	/prot/MCI/aMCI/sub252/sub252_left${roi}_z+tlrc	\
sub253	aMCI	left	/prot/MCI/aMCI/sub253/sub253_left${roi}_z+tlrc	\
sub254	aMCI	left	/prot/MCI/aMCI/sub254/sub254_left${roi}_z+tlrc	\
sub256	aMCI	left	/prot/MCI/aMCI/sub256/sub256_left${roi}_z+tlrc	\
sub257	aMCI	left	/prot/MCI/aMCI/sub257/sub257_left${roi}_z+tlrc	\
sub260	aMCI	left	/prot/MCI/aMCI/sub260/sub260_left${roi}_z+tlrc	\
sub261	aMCI	left	/prot/MCI/aMCI/sub261/sub261_left${roi}_z+tlrc	\
sub262	aMCI	left	/prot/MCI/aMCI/sub262/sub262_left${roi}_z+tlrc	\
sub263	aMCI	left	/prot/MCI/aMCI/sub263/sub263_left${roi}_z+tlrc	\
sub264	aMCI	left	/prot/MCI/aMCI/sub264/sub264_left${roi}_z+tlrc	\
sub266	aMCI	left	/prot/MCI/aMCI/sub266/sub266_left${roi}_z+tlrc	\
sub270	aMCI	left	/prot/MCI/aMCI/sub270/sub270_left${roi}_z+tlrc	\
sub271	aMCI	left	/prot/MCI/aMCI/sub271/sub271_left${roi}_z+tlrc	\
sub272	aMCI	left	/prot/MCI/aMCI/sub272/sub272_left${roi}_z+tlrc	\
sub01	svMCI	right	/prot/MCI/svMCI/sub01/sub01_right${roi}_z+tlrc	\
sub03	svMCI	right	/prot/MCI/svMCI/sub03/sub03_right${roi}_z+tlrc	\
sub04	svMCI	right	/prot/MCI/svMCI/sub04/sub04_right${roi}_z+tlrc	\
sub05	svMCI	right	/prot/MCI/svMCI/sub05/sub05_right${roi}_z+tlrc	\
sub06	svMCI	right	/prot/MCI/svMCI/sub06/sub06_right${roi}_z+tlrc	\
sub08	svMCI	right	/prot/MCI/svMCI/sub08/sub08_right${roi}_z+tlrc	\
sub09	svMCI	right	/prot/MCI/svMCI/sub09/sub09_right${roi}_z+tlrc	\
sub10	svMCI	right	/prot/MCI/svMCI/sub10/sub10_right${roi}_z+tlrc	\
sub11	svMCI	right	/prot/MCI/svMCI/sub11/sub11_right${roi}_z+tlrc	\
sub12	svMCI	right	/prot/MCI/svMCI/sub12/sub12_right${roi}_z+tlrc	\
sub13	svMCI	right	/prot/MCI/svMCI/sub13/sub13_right${roi}_z+tlrc	\
sub14	svMCI	right	/prot/MCI/svMCI/sub14/sub14_right${roi}_z+tlrc	\
sub15	svMCI	right	/prot/MCI/svMCI/sub15/sub15_right${roi}_z+tlrc	\
sub16	svMCI	right	/prot/MCI/svMCI/sub16/sub16_right${roi}_z+tlrc	\
sub19	svMCI	right	/prot/MCI/svMCI/sub19/sub19_right${roi}_z+tlrc	\
sub21	svMCI	right	/prot/MCI/svMCI/sub21/sub21_right${roi}_z+tlrc	\
sub22	svMCI	right	/prot/MCI/svMCI/sub22/sub22_right${roi}_z+tlrc	\
sub25	svMCI	right	/prot/MCI/svMCI/sub25/sub25_right${roi}_z+tlrc	\
sub26	svMCI	right	/prot/MCI/svMCI/sub26/sub26_right${roi}_z+tlrc	\
sub29	svMCI	right	/prot/MCI/svMCI/sub29/sub29_right${roi}_z+tlrc	\
sub30	svMCI	right	/prot/MCI/svMCI/sub30/sub30_right${roi}_z+tlrc	\
sub31	svMCI	right	/prot/MCI/svMCI/sub31/sub31_right${roi}_z+tlrc	\
sub32	svMCI	right	/prot/MCI/svMCI/sub32/sub32_right${roi}_z+tlrc	\
sub33	svMCI	right	/prot/MCI/svMCI/sub33/sub33_right${roi}_z+tlrc	\
sub35	svMCI	right	/prot/MCI/svMCI/sub35/sub35_right${roi}_z+tlrc	\
sub36	svMCI	right	/prot/MCI/svMCI/sub36/sub36_right${roi}_z+tlrc	\
sub37	svMCI	right	/prot/MCI/svMCI/sub37/sub37_right${roi}_z+tlrc	\
sub38	svMCI	right	/prot/MCI/svMCI/sub38/sub38_right${roi}_z+tlrc	\
sub39	svMCI	right	/prot/MCI/svMCI/sub39/sub39_right${roi}_z+tlrc	\
sub41	svMCI	right	/prot/MCI/svMCI/sub41/sub41_right${roi}_z+tlrc	\
sub43	svMCI	right	/prot/MCI/svMCI/sub43/sub43_right${roi}_z+tlrc	\
sub44	svMCI	right	/prot/MCI/svMCI/sub44/sub44_right${roi}_z+tlrc	\
sub45	svMCI	right	/prot/MCI/svMCI/sub45/sub45_right${roi}_z+tlrc	\
sub46	svMCI	right	/prot/MCI/svMCI/sub46/sub46_right${roi}_z+tlrc	\
sub48	svMCI	right	/prot/MCI/svMCI/sub48/sub48_right${roi}_z+tlrc	\
sub50	svMCI	right	/prot/MCI/svMCI/sub50/sub50_right${roi}_z+tlrc	\
sub51	svMCI	right	/prot/MCI/svMCI/sub51/sub51_right${roi}_z+tlrc	\
sub53	svMCI	right	/prot/MCI/svMCI/sub53/sub53_right${roi}_z+tlrc	\
sub55	svMCI	right	/prot/MCI/svMCI/sub55/sub55_right${roi}_z+tlrc	\
sub56	svMCI	right	/prot/MCI/svMCI/sub56/sub56_right${roi}_z+tlrc	\
sub01	svMCI	left	/prot/MCI/svMCI/sub01/sub01_left${roi}_z+tlrc	\
sub03	svMCI	left	/prot/MCI/svMCI/sub03/sub03_left${roi}_z+tlrc	\
sub04	svMCI	left	/prot/MCI/svMCI/sub04/sub04_left${roi}_z+tlrc	\
sub05	svMCI	left	/prot/MCI/svMCI/sub05/sub05_left${roi}_z+tlrc	\
sub06	svMCI	left	/prot/MCI/svMCI/sub06/sub06_left${roi}_z+tlrc	\
sub08	svMCI	left	/prot/MCI/svMCI/sub08/sub08_left${roi}_z+tlrc	\
sub09	svMCI	left	/prot/MCI/svMCI/sub09/sub09_left${roi}_z+tlrc	\
sub10	svMCI	left	/prot/MCI/svMCI/sub10/sub10_left${roi}_z+tlrc	\
sub11	svMCI	left	/prot/MCI/svMCI/sub11/sub11_left${roi}_z+tlrc	\
sub12	svMCI	left	/prot/MCI/svMCI/sub12/sub12_left${roi}_z+tlrc	\
sub13	svMCI	left	/prot/MCI/svMCI/sub13/sub13_left${roi}_z+tlrc	\
sub14	svMCI	left	/prot/MCI/svMCI/sub14/sub14_left${roi}_z+tlrc	\
sub15	svMCI	left	/prot/MCI/svMCI/sub15/sub15_left${roi}_z+tlrc	\
sub16	svMCI	left	/prot/MCI/svMCI/sub16/sub16_left${roi}_z+tlrc	\
sub19	svMCI	left	/prot/MCI/svMCI/sub19/sub19_left${roi}_z+tlrc	\
sub21	svMCI	left	/prot/MCI/svMCI/sub21/sub21_left${roi}_z+tlrc	\
sub22	svMCI	left	/prot/MCI/svMCI/sub22/sub22_left${roi}_z+tlrc	\
sub25	svMCI	left	/prot/MCI/svMCI/sub25/sub25_left${roi}_z+tlrc	\
sub26	svMCI	left	/prot/MCI/svMCI/sub26/sub26_left${roi}_z+tlrc	\
sub29	svMCI	left	/prot/MCI/svMCI/sub29/sub29_left${roi}_z+tlrc	\
sub30	svMCI	left	/prot/MCI/svMCI/sub30/sub30_left${roi}_z+tlrc	\
sub31	svMCI	left	/prot/MCI/svMCI/sub31/sub31_left${roi}_z+tlrc	\
sub32	svMCI	left	/prot/MCI/svMCI/sub32/sub32_left${roi}_z+tlrc	\
sub33	svMCI	left	/prot/MCI/svMCI/sub33/sub33_left${roi}_z+tlrc	\
sub35	svMCI	left	/prot/MCI/svMCI/sub35/sub35_left${roi}_z+tlrc	\
sub36	svMCI	left	/prot/MCI/svMCI/sub36/sub36_left${roi}_z+tlrc	\
sub37	svMCI	left	/prot/MCI/svMCI/sub37/sub37_left${roi}_z+tlrc	\
sub38	svMCI	left	/prot/MCI/svMCI/sub38/sub38_left${roi}_z+tlrc	\
sub39	svMCI	left	/prot/MCI/svMCI/sub39/sub39_left${roi}_z+tlrc	\
sub41	svMCI	left	/prot/MCI/svMCI/sub41/sub41_left${roi}_z+tlrc	\
sub43	svMCI	left	/prot/MCI/svMCI/sub43/sub43_left${roi}_z+tlrc	\
sub44	svMCI	left	/prot/MCI/svMCI/sub44/sub44_left${roi}_z+tlrc	\
sub45	svMCI	left	/prot/MCI/svMCI/sub45/sub45_left${roi}_z+tlrc	\
sub46	svMCI	left	/prot/MCI/svMCI/sub46/sub46_left${roi}_z+tlrc	\
sub48	svMCI	left	/prot/MCI/svMCI/sub48/sub48_left${roi}_z+tlrc	\
sub50	svMCI	left	/prot/MCI/svMCI/sub50/sub50_left${roi}_z+tlrc	\
sub51	svMCI	left	/prot/MCI/svMCI/sub51/sub51_left${roi}_z+tlrc	\
sub53	svMCI	left	/prot/MCI/svMCI/sub53/sub53_left${roi}_z+tlrc	\
sub55	svMCI	left	/prot/MCI/svMCI/sub55/sub55_left${roi}_z+tlrc	\
sub56	svMCI	left	/prot/MCI/svMCI/sub56/sub56_left${roi}_z+tlrc

done
