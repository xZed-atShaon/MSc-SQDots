clear all;
n = 2^13;                   % number of grid points
twidth = 20;              % width of time window [ps]
c = 299792458*1e6/1e12;     % speed of light [\mum/ps]
wavelength = 12.059;           % reference wavelength [\mum]
w0 = (2.0.*pi.*c)./wavelength; % reference frequency [2*pi*THz]
T = linspace(-twidth/2, twidth/2, n); % time grid
% === input pulse
power = 200.0;              % peak power of input [W]
t0 = 0.6;                % duration of input [ps]
A = sqrt(power).*sech(T./t0); % === fibre parameters
flength = 1.0189e-6;             % fibre length [m]
% betas = [beta2, beta3, ...] in units [ps^2/m, ps^3/m ...]
phi = 0;

[Beta20, Beta30, Gamma1]= beta_values_phi(phi);
%[Beta20, Beta30, Gamma1]= beta_values_phi(1,phi);

betas = [real(Beta20*1e24),real(Beta30*1e36)];
gamma = Gamma1;

fprintf("\nBeta2_0 = %.3e", betas(1));
fprintf("\nBeta3_0 = %.3e", betas(2));
fprintf("\nGamma = %.3e\n", gamma);
loss = 0;                   % loss [dB/m]
% === Raman response
fr = 0;                  % fractional Raman contribution
tau1 = 0; tau2 = 0;
RT = (tau1.^2+tau2.^2)./tau1./tau2.^2.*exp(-T./tau2).*sin(T./tau1);
RT(T<0) = 0;          % heaviside step function
%RT = RT/trapz(T,RT);  % normalise RT to unit integral
% === simulation parameters
nsaves = 200;     % number of length steps to save field at
% propagate field
[Z, AT, AW, W] = gnlse(T, A, w0, gamma, betas, loss, ...
                       fr, RT, flength, nsaves);
% === plot output
figure(1);
lIW = 10.*log10(abs(AW).^2); % log scale spectral intensity
mlIW = max(max(lIW));       % max value, for scaling plot
WL = 2.*pi.*c./W; iis = (WL>0 & WL<50); % wavelength grid
subplot(1,2,1);             
pcolor(WL(iis), Z, lIW(:,iis)); % plot as pseudocolor map
caxis([mlIW-40.0, mlIW]);  xlim([1,49]); shading interp; 
xlabel('Wavelength (\mum)'); ylabel('Distance (m)');

lIT = 10*log10(abs(AT).^2); % log scale temporal intensity
mlIT = max(max(lIT));       % max value, for scaling plot
subplot(1,2,2);
pcolor(T, Z, lIT);          % plot as pseudocolor map
caxis([mlIT-40.0, mlIT]);  xlim([-10,10]); shading interp;
xlabel('Delay (ps)'); ylabel('Distance (m)');