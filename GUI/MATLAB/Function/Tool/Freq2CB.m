%
%	Frequency -> Bark and CB (Critical-Band)
%	IRINO Toshio
%	28 Mar. 95
%	Ref: Zwicker, E. and Terhardt, E.:" Analytical expressions for 
%	critical-band rate and critical bandwidth as a function of frequency"
%	JASA, 68(5), Nov. 1980.
%
%	function [Bark, CB] = Freq2CB(cf),
%	INPUT	cf: frequency
%	OUTPUT  Bark : Critical-band rate
%		CB   : Critical-band width
%
function [Bark, CB] = Freq2CB(cf)

cfmin = 20;
cfmax = 15000;
if min(cf) < cfmin | max(cf) > cfmax, 
error(['CB Frequency Range :  ' int2str(cfmin) ' <= cf <= ' int2str(cfmax)]);
end;

%%%%%% ERB %%%%%%%%
Fkhz = cf/1000;
Bark = 13*atan(0.76*Fkhz) + 3.5*atan((Fkhz/7.5).^2);
% 
% Approximation for 0.6 - 7 kHz
% Bark = 8.7 + 14.2*log10(Fkhz);
%
CB   = 25 + 75*(1 + 1.4*(Fkhz).^2).^0.69;


return

%%%% Test %%%%

fr = 20:10000;
semilogx(fr, Freq2CB(fr))
grid
