function P = spm_z2p(Z,df,STAT,n)
% Compute the p-value of a test statistic
% FORMAT P = spm_z2p(Z,df,STAT,n)
%
% Z     - test statistic {minimum over n values}
% df    - [df{interest} df{error}]
% STAT  - Statistical field
%         'Z' - Gaussian field
%         'T' - T - field
%         'X' - Chi squared field
%         'F' - F - field
% n     - number of conjoint tests
%
% P     - p-value  - P(STAT > Z)
%__________________________________________________________________________

% Guillaume Flandin
% Copyright (C) 2014-2022 Wellcome Centre for Human Neuroimaging


if nargin < 4, n    = 1;   end
if nargin < 2, STAT = 'Z'; end

if      STAT == 'Z'
    P = (1 - spm_Ncdf(Z)).^n;
elseif  STAT == 'T'
    P = (spm_Tcdf(-Z,df(2))).^n;
elseif  STAT == 'X'
    P = (1 - spm_Xcdf(Z,df(2))).^n;
elseif  STAT == 'F'
    P = (1 - spm_Fcdf(Z,df)).^n;
elseif  STAT == 'P'
    P = Z;
end
