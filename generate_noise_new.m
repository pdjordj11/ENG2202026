%
% Generate Uniform and Normal noise sequences
%
clc; clear all; close all;
%
% n_points is the number of data samples
%
n_points = 1000;
%
% Uniform and Normal noise
%
% Generate values from the uniform distribution on the
% interval (a, b).
%        r = a + (b-a).*rand(100,1);
a = -1;
b = 1;
uniform = a + (b-a).*rand(n_points,1);
%
%
% Generate values from the Normal distribution
% with mean mu and standard deviation std
%
mu = 0;
std = 2;
normal = mu + std.*randn(n_points,1);
%
% Save files to disk
%
save uniform_data uniform
save normal_data normal
%
%
N = n_points;
xn = [0:1:N-1];
noiseunif = uniform;
noisegauss = normal;
%
var_noisegauss = var(noisegauss)
cov_noisegauss = cov(noisegauss)
dot_noisegauss = noisegauss'*noisegauss/N
corr_coeff_noisegauss = corrcoef(noisegauss)
autocorr_noisegauss = corrcoef(noisegauss,noisegauss)
[cross_corr_noisegauss lags] = xcorr(noisegauss,noisegauss);
[maxvalue indexvalue] = max(cross_corr_noisegauss)
%
figure(10);
plot(xn,noiseunif,'b',xn,noisegauss,'r');
title('Uniform and Gaussian Noise')
xlabel('Samples')
ylabel('Amplitude')
legend('Uniform','Gaussian','Location','SE')
grid on;
%
figure(11);
histogram(noiseunif,100);
title('Uniform Noise')
xlabel('Samples')
ylabel('Amplitude')
grid minor;
%
figure(12);
histogram(noisegauss,100);
title('Gaussian Noise')
ylabel('Amplitude')
xlabel('Samples')
grid minor;
%
figure(13)
plot(lags,cross_corr_noisegauss/maxvalue,'r','LineWidth',1.5)
grid minor

disp('>>> END generate_noise_new.m')
