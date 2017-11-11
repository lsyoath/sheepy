rtpath=/prot/MCI/Data

ROIs='vCa GP NAC vmPu dCa dlPu'

GrpLME_3way_aMCI_NC+tlrc
FBriks='2 6'

n=120; nh=`echo $n/3 | bc`; df=`echo $nh-1 | bc`

dist=3.1; pth1=.01 ; th1=6.968 ; th2=3.037; vol=`ccalc -eval "3*3*3"`

Clust=60

echo $th1 $th2

cd ${rtpath}/MCfc
