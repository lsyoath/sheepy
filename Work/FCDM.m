function FCDM(DataPath,MaskPath,IsNeedGlobalReg,ResultsDir)
%This function uses to compute the functional connectivity density(nodal degree)
%INPUTS:
%   DataPath - where the BOLD images (for extracting time courses) stored;
%   MaskPath - where the brain mask stored;
%   IsNeedGlobalReg - 1/0: regress/not regress the global signal;
%   ResultsDir - where the resulting NodePara will be stored

theElapsedTime = cputime;
subjects = [166778;162699;162569;166794;167125;167165;161784;167394;167580;167448;
            167699;167776;167888;148815;166711;167587;167926;167928;167811;159750;
            164847;167520;168009;167971;160201;168442;168556;168469;168306;143916;
            168778;168776;167977;169158;169312;169379;169315;169102;169575;169400;
            169373;169267;169250;149523;169324;169513;169017;169573;]


sub_num = length(subjects);
%load mask
[err Mask MaskInfo errmeg] = BrikLoad(MaskPath);
BrainSize = size(Mask);
[nDim1 nDim2 nDim3] =size(Mask);
MaskOneDim = reshape(Mask,1,[]);

%generate time course
for i = 1:sub_num
    cd([DataPath '/' num2str(subjects(i,:))]);
    filename = [num2str(subjects(i,:)) '-BOLD-GMmasked+tlrc']
    [err AllVolume info errmeg] = BrikLoad(filename);
    [nDim1 nDim2 nDim3 nTimePoints] = size(AllVolume);
    AllVolume = permute(AllVolume,[4,1,2,3]);
    AllVolume = reshape(AllVolume,nTimePoints,[]);
    AllVolume = AllVolume(:,find(MaskOneDim));
    
    %*****ruling out the effects of head motion, WM and CSF signal by regression
    fname = dir(['*BOLD-motion.1D']);
    HP = load(fname.name);
    fname = dir('*-WMtc.txt');
    WM = textread(fname.name);
    WM(:,2) = [];
    fname = dir('*-CSFtc.txt');
    CSF = textread(fname.name);
    CSF(:,2) = [];
    
    if IsNeedGlobalReg==1
        fname = dir('*-Globaltc.txt');
        GlobalTC = textread(fname.name);
    else
        GlobalTC = [];
    end
    
    covariable = [HP WM CSF GlobalTC];
    size(covariable)
    [AllVolume] = gretna_glm(AllVolume, covariable, 'r');%ruling out the effects of head motion and global signal by regress
    MTC{i,1} = AllVolume.r;
end
 cd(ResultsDir)
if IsNeedGlobalReg==1
save(['MTC_glb.mat'],'MTC')
else
save(['MTC.mat'],'MTC')
end
rm AllVolume

%% Rmatrix and nodal strength
for i = 1:sub_num  
        Rmatrix=IPN_calLCM(TC{i},1);
        % or to generate a 300*10000 correlation matrix:
        roiTC=TC{i}(1:300,:);
        Rmatrix=IPN_fastCorr(roiTC,TC{i});
        
        
        Rmatrix(isnan(Rmatrix))=0;
        Rmatrix(find(Rmatrix<0))=0;
        fprintf(['Computing nodal para for Sub' num2str(i)])
        for k=1:length(thresh)  
            k
            Bmatrix=sparse(gretna_R2b(Rmatrix,'s',thresh(k)));            
            Node_Para(k).deg(:,i) =sum(Bmatrix,2);           
        end
end


cd(ResultsDir)
if IsNeedGlobalReg==1   
save(['Node_para_glb.mat'], 'Node_Para')
else
    save(['Node_para.mat'], 'Node_Para')
end


theElapsedTime =cputime-theElapsedTime;
fprintf('\n\t Functional connectivity density compution over, elapsed time: % seconds. \n', theElapsedTime);

