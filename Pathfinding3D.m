clc
clear all
%close all
x = [2000 2000 1600 1600 2000];   % mm
y = [ 500 -500  500    0  500];   % mm
z = [1600 1600  900  900 1600];   % mm
t = [0 1 2 3 4];                  % s

%% ===================== X-AKSE =====================
AAx = zeros(18,18);
BBx = zeros(18,1);
AAx(1,1:5) = F4(t(1));                                         BBx(1) = x(1);
AAx(2,1:5) = F4Dot(t(1));
AAx(3,1:5) = F4DDot(t(1));
AAx(4,1:5) = F4(t(2));                                         BBx(4) = x(2);
AAx(5,1:5) = F4(t(2));        AAx(5,6:9) = -F3(t(2));
AAx(6,1:5) = F4Dot(t(2));     AAx(6,6:9) = -F3Dot(t(2));
AAx(7,1:5) = F4DDot(t(2));    AAx(7,6:9) = -F3DDot(t(2));
AAx(8,6:9) = F3(t(3));                                         BBx(8) = x(3);
AAx(9,6:9) = F3(t(3));        AAx(9,10:13) = -F3(t(3));
AAx(10,6:9) = F3Dot(t(3));    AAx(10,10:13) = -F3Dot(t(3));
AAx(11,6:9) = F3DDot(t(3));   AAx(11,10:13) = -F3DDot(t(3));
AAx(12,10:13) = F3(t(4));                                      BBx(12) = x(4);
AAx(13,10:13) = F3(t(4));     AAx(13,14:18) = -F4(t(4));
AAx(14,10:13) = F3Dot(t(4));  AAx(14,14:18) = -F4Dot(t(4));
AAx(15,10:13) = F3DDot(t(4)); AAx(15,14:18) = -F4DDot(t(4));
AAx(16,14:18) = F4(t(5));                                      BBx(16) = x(5);
AAx(17,14:18) = F4Dot(t(5));
AAx(18,14:18) = F4DDot(t(5));
coeffx = AAx\BBx;
ax = coeffx(1:5);  bx = coeffx(6:9);  cx = coeffx(10:13);  dx = coeffx(14:18);

%% ===================== Y-AKSE =====================
AAy = zeros(18,18);
BBy = zeros(18,1);
AAy(1,1:5) = F4(t(1));                                         BBy(1) = y(1);
AAy(2,1:5) = F4Dot(t(1));
AAy(3,1:5) = F4DDot(t(1));
AAy(4,1:5) = F4(t(2));                                         BBy(4) = y(2);
AAy(5,1:5) = F4(t(2));        AAy(5,6:9) = -F3(t(2));
AAy(6,1:5) = F4Dot(t(2));     AAy(6,6:9) = -F3Dot(t(2));
AAy(7,1:5) = F4DDot(t(2));    AAy(7,6:9) = -F3DDot(t(2));
AAy(8,6:9) = F3(t(3));                                         BBy(8) = y(3);
AAy(9,6:9) = F3(t(3));        AAy(9,10:13) = -F3(t(3));
AAy(10,6:9) = F3Dot(t(3));    AAy(10,10:13) = -F3Dot(t(3));
AAy(11,6:9) = F3DDot(t(3));   AAy(11,10:13) = -F3DDot(t(3));
AAy(12,10:13) = F3(t(4));                                      BBy(12) = y(4);
AAy(13,10:13) = F3(t(4));     AAy(13,14:18) = -F4(t(4));
AAy(14,10:13) = F3Dot(t(4));  AAy(14,14:18) = -F4Dot(t(4));
AAy(15,10:13) = F3DDot(t(4)); AAy(15,14:18) = -F4DDot(t(4));
AAy(16,14:18) = F4(t(5));                                      BBy(16) = y(5);
AAy(17,14:18) = F4Dot(t(5));
AAy(18,14:18) = F4DDot(t(5));
coeffy = AAy\BBy;
ay = coeffy(1:5);  by = coeffy(6:9);  cy = coeffy(10:13);  dy = coeffy(14:18);

%% ===================== Z-AKSE =====================
AAz = zeros(18,18);
BBz = zeros(18,1);
AAz(1,1:5) = F4(t(1));                                         BBz(1) = z(1);
AAz(2,1:5) = F4Dot(t(1));
AAz(3,1:5) = F4DDot(t(1));
AAz(4,1:5) = F4(t(2));                                         BBz(4) = z(2);
AAz(5,1:5) = F4(t(2));        AAz(5,6:9) = -F3(t(2));
AAz(6,1:5) = F4Dot(t(2));     AAz(6,6:9) = -F3Dot(t(2));
AAz(7,1:5) = F4DDot(t(2));    AAz(7,6:9) = -F3DDot(t(2));
AAz(8,6:9) = F3(t(3));                                         BBz(8) = z(3);
AAz(9,6:9) = F3(t(3));        AAz(9,10:13) = -F3(t(3));
AAz(10,6:9) = F3Dot(t(3));    AAz(10,10:13) = -F3Dot(t(3));
AAz(11,6:9) = F3DDot(t(3));   AAz(11,10:13) = -F3DDot(t(3));
AAz(12,10:13) = F3(t(4));                                      BBz(12) = z(4);
AAz(13,10:13) = F3(t(4));     AAz(13,14:18) = -F4(t(4));
AAz(14,10:13) = F3Dot(t(4));  AAz(14,14:18) = -F4Dot(t(4));
AAz(15,10:13) = F3DDot(t(4)); AAz(15,14:18) = -F4DDot(t(4));
AAz(16,14:18) = F4(t(5));                                      BBz(16) = z(5);
AAz(17,14:18) = F4Dot(t(5));
AAz(18,14:18) = F4DDot(t(5));
coeffz = AAz\BBz;
az = coeffz(1:5);  bz = coeffz(6:9);  cz = coeffz(10:13);  dz = coeffz(14:18);

%% SAMPLING 
tsamp1 = linspace(t(1),t(2),100);
tsamp2 = linspace(t(2),t(3),100);
tsamp3 = linspace(t(3),t(4),100);
tsamp4 = linspace(t(4),t(5),100);
for i = 1:length(tsamp1)
    xsamp1(i) = F4(tsamp1(i))*ax;
    ysamp1(i) = F4(tsamp1(i))*ay;
    zsamp1(i) = F4(tsamp1(i))*az;
end
for i = 1:length(tsamp2)
    xsamp2(i) = F3(tsamp2(i))*bx;
    ysamp2(i) = F3(tsamp2(i))*by;
    zsamp2(i) = F3(tsamp2(i))*bz;
end
for i = 1:length(tsamp3)
    xsamp3(i) = F3(tsamp3(i))*cx;
    ysamp3(i) = F3(tsamp3(i))*cy;
    zsamp3(i) = F3(tsamp3(i))*cz;
end
for i = 1:length(tsamp4)
    xsamp4(i) = F4(tsamp4(i))*dx;
    ysamp4(i) = F4(tsamp4(i))*dy;
    zsamp4(i) = F4(tsamp4(i))*dz;
end

%% PLOT 
plot3(x,y,z,'o')
hold on
plot3(xsamp1,ysamp1,zsamp1,'--')
plot3(xsamp2,ysamp2,zsamp2,'--')
plot3(xsamp3,ysamp3,zsamp3,'--')
plot3(xsamp4,ysamp4,zsamp4,'--')
text(x,y,z,{'  P1','  P2','  P3','  P4','  P5'})
grid on
axis equal
xlabel('x [mm]'); ylabel('y [mm]'); zlabel('z [mm]')
title('3D-bane gjennom P1-P5')

%% ===================== OUTPUT: plottede posisjoner =====================
tall = [tsamp1 tsamp2 tsamp3 tsamp4]';
xall = [xsamp1 xsamp2 xsamp3 xsamp4]';
yall = [ysamp1 ysamp2 ysamp3 ysamp4]';
zall = [zsamp1 zsamp2 zsamp3 zsamp4]';

[tall, iu] = unique(tall);                 % remove duplicated knot times
xall = xall(iu); yall = yall(iu); zall = zall(iu);

Tt = table(tall, 'VariableNames', {'t_s'});
Tx = table(xall, 'VariableNames', {'x_mm'});
Ty = table(yall, 'VariableNames', {'y_mm'});
Tz = table(zall, 'VariableNames', {'z_mm'});

writetable(Tt, 'tid.csv')
writetable(Tx, 'posisjon_x.csv')
writetable(Ty, 'posisjon_y.csv')
writetable(Tz, 'posisjon_z.csv')
function [out] = F4(t)
out =   [1   t    t.^2    t.^3     t.^4];
end
function [out] = F4Dot(t)
out =   [0   1    2*t    3*t.^2   4*t.^3];
end
function [out] = F4DDot(t)
out = [0   0    2      6*t     12*t.^2];
end
function [out] = F3(t)
out =   [1   t    t.^2    t.^3];
end
function [out] = F3Dot(t)
out =   [0   1    2*t    3*t.^2];
end
function [out] = F3DDot(t)
out = [0   0    2      6*t];
end