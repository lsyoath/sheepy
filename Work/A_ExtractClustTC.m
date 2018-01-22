function A_ExtractClustTC(DataPath,MaskPrefix,outname)

% % *****************************************************
% DataPath='/prot/380_Networks2/RatAtlas/data'
% MaskPrefix='/prot/380_Networks2/RatAtlas/atlas/atlas_final110_RSres+orig'
% outname='/prot/380_Networks2/RatAtlas/ResultsForA/TCs_RS1_2wax_110_censored.mat'
% censorfile='/prot/380_Networks2/RatAtlas/ResultsForA/censormat_RS1.mat'
% 
% DataPath='/prot/380_Networks2/RatAtlas/data'
% MaskPrefix='/prot/380_Networks2/RatAtlas/atlas/atlas_final110_RSres+orig'
% outname='/prot/380_Networks2/RatAtlas/ResultsForA/TCs_STIM1_2wax_110_censored.mat'
% censorfile='/prot/380_Networks2/RatAtlas/ResultsForA/censormat_STIM1.mat'
% 
%DataPath='/prot/380_Networks/RatAtlas/NIAdata'
%MaskPrefix='/prot/380_Networks/RatAtlas/fc/HIP_mean_fcmask+orig'
%outname='/prot/380_Networks/RatAtlas/NIAdata/fc/TCs_HIP_AI.mat'


% MaskPrefix='9modules_112_DKIres.nii'
% outname='/prot/380_Networks2/RatAtlas/ResultsForA/TCs_9modules.mat'

%DataPath='/prot/380_Networks/RatAtlas/NIAdata'
%MaskPrefix='/prot/380_Networks/RatAtlas/NIAdata/fc/ACC_AI-Y_DiffClustMask+orig'
%outname='/prot/380_Networks/RatAtlas/NIAdata/fc/TCs_HIPGrpnetwork_AI.mat'
%******************************************************

theElapsedTime = cputime;

	   
subjects={'D13'  'D25'  'D35' 'AU2'  'D14'  'D26'  'D37'  ...
      'D01'  'D15'  'D27'  'D40'  ...
      'D05'  'D16'  'D28'  'D42'  ...
      'D06'  'D17'  'D29'  'D43'  ...
      'D07'    'D30'  'D44' ...
      'D10'  'D20'  'D31'  'D46' ...
      'D11'  'D22'  'D32'  'D47' ...
      'D12'  'D23'  'D34'  'D48'}; 

subjects={'AI4' 'D13'  'D25' 'D35'
      'AU2' 'D14'  'D26'  'D37'
      'D01' 'D15'  'D27'  'D40'
      'D05'  'D16'  'D28'  'D42'
      'D06'  'D17'  'D29'  'D43'
      'D07'  'D19'  'D30'  'D44'
      'D10'  'D20'  'D31'  'D46'
      'D11'  'D22'  'D32'  'D47'
      'D12'  'D23'  'D34'  'D48'}
subjects={'D43' 'D47' 'D48' 'AI4' 'D10' 'D22' 'D28' 'D31' 'D32' 'D34' 'D37' 'D07'}
subjects={'D42' 'D44' 'D46' 'D12' 'D19' 'D27' 'D29' 'D35' 'D05'}
subjects={'D11' 'D13' 'D14' 'D15' 'D16' 'D17' 'D20' 'D23' 'D25' 'D26' 'D30' 'D06'}


%'D19' 
sub_num = length(subjects)
session={'1' '2'};
%load mask
[err Mask MaskInfo errmeg] = BrikLoad(MaskPrefix);
BrainSize = size(Mask);
[nDim1 nDim2 nDim3] =size(Mask);
MaskOneDim = reshape(Mask,1,[]);


%% generate time course

for i = 1:sub_num
    fprintf(['extracting time course for subject' subjects{i}])
    fprintf('\n')
    cd([DataPath '/' subjects{i}]);
for j=1:2
%     filename = ['fMRI_' session{j} '_rs_denoise_align_affine_rm10_volreg_despike_blur_rmsk_3dallineate_detrend_rmmotion_filter+orig']
     filename = [subjects{i} '-lCA1_zmean+orig']%deconvolve_errts_spm3+orig']
    [err AllVolume info errmeg] = BrikLoad(filename);
    [nDim1 nDim2 nDim3 nTimePoints] = size(AllVolume);
    AllVolume = permute(AllVolume,[4,1,2,3]);
    AllVolume = reshape(AllVolume,nTimePoints,[]);
for k=1:max(MaskOneDim(:))
    temp=AllVolume(:,find(MaskOneDim==k));
    tc(k,:,j)=mean(temp,2);
end
end
   
    TCs{i}=tc;
    clear tc
end

save(outname, 'TCs')


theElapsedTime =cputime-theElapsedTime;
fprintf('\n\t TCs extraction over, elapsed time: % seconds. \n', theElapsedTime);
