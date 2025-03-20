clear all;
close all;
deltap=-3*10^12:0.001*10^12:3*10^12;
deltac1=1.0*10^9;
deltac2=2.0*10^9;
omega_c=5.0*10^11;
g21=2.0*10^9;
g31=1.0*10^9;
g41=4.2*10^11;
K=1.4*10^17;
omegap=10.08*10^14;
omega_d=2*10^11;
c=3*10^8;
Delta1 = deltap; 
Delta2 = Delta1 +deltac1;
Delta3 = Delta2 +deltac2; 
Dp = (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2) - abs(omega_d)^2;
D = (Delta1 + 1i*g21/2) .* (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2)- abs(omega_c)^2 .* (Delta3 + 1i*g41/2)- abs(omega_d)^2 .* (Delta1 + 1i*g21/2);
A=((2.*c.*K)./(omegap));
l=3.90*10^12;
chi1=((-A.*Dp)./D);
X=(abs(omega_c).^2)*(abs(Delta3 + 1i*g41/2).^2);
Y=abs(omega_d)*abs(omega_c);
chi3 =- l*chi1*((abs(Dp).^2 + X+ Y.^2)/ abs(D).^2);
plot(deltap./10.^11, real(chi3));
hold on;

omega_c=5.0*10^11;
omega_d=4*10^11;
Dp = (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2) - abs(omega_d)^2;
D = (Delta1 + 1i*g21/2) .* (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2)- abs(omega_c)^2 .* (Delta3 + 1i*g41/2)- abs(omega_d)^2 .* (Delta1 + 1i*g21/2);
A=((2.*c.*K)./(omegap));
l=3.90*10^12;
chi1=((-A.*Dp)./D);
X=(abs(omega_c).^2)*(abs(Delta3 + 1i*g41/2).^2);
Y=abs(omega_d)*abs(omega_c);
chi3 =- l*chi1*((abs(Dp).^2 + X + Y.^2)/ abs(D).^2);

plot(deltap./10.^11, real(chi3));

hold on;


omega_c=5.0*10^11;
omega_d=6*10^11;
Dp = (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2) - abs(omega_d)^2;
D = (Delta1 + 1i*g21/2) .* (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2)- abs(omega_c)^2 .* (Delta3 + 1i*g41/2)- abs(omega_d)^2 .* (Delta1 + 1i*g21/2);
A=((2.*c.*K)./(omegap));
l=3.90*10^12;
chi1=((-A.*Dp)./D);
X=(abs(omega_c).^2)*(abs(Delta3 + 1i*g41/2).^2);
Y=abs(omega_d)*abs(omega_c);
chi3 =- l*chi1*((abs(Dp).^2 + X + Y.^2)/ abs(D).^2);
plot(deltap./10.^11, real(chi3));
hold on;


omega_c=5.0*10^11;
omega_d=8*10^11;
Dp = (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2) - abs(omega_d)^2;
D = (Delta1 + 1i*g21/2) .* (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2)- abs(omega_c)^2 .* (Delta3 + 1i*g41/2)- abs(omega_d)^2 .* (Delta1 + 1i*g21/2);
A=((2.*c.*K)./(omegap));
l=3.90*10^12;
chi1=((-A.*Dp)./D);
X=(abs(omega_c).^2)*(abs(Delta3 + 1i*g41/2).^2);
Y=abs(omega_d)*abs(omega_c);
chi3 =- l*chi1*((abs(Dp).^2 + X+ Y.^2)/ abs(D).^2);
plot(deltap./10.^11, real(chi3));
hold on;
omega_c=5.0*10^11;
omega_d=10*10^11;
Dp = (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2) - abs(omega_d)^2;
D = (Delta1 + 1i*g21/2) .* (Delta2 + 1i*g31/2) .* (Delta3 + 1i*g41/2)- abs(omega_c)^2 .* (Delta3 + 1i*g41/2)- abs(omega_d)^2 .* (Delta1 + 1i*g21/2);
A=((2.*c.*K)./(omegap));
l=3.90*10^12;
chi1=((-A.*Dp)./D);
X=(abs(omega_c).^2)*(abs(Delta3 + 1i*g41/2).^2);
Y=abs(omega_d)*abs(omega_c);
chi3 =- l*chi1*((abs(Dp).^2 + X + Y.^2)/ abs(D).^2);
plot(deltap./10.^11, real(chi3));
hold on;
xlabel('\Delta_p');
ylabel('Re \chi^{(3)}');
title('\Delta_p vs \chi^{(3)}');
grid on;