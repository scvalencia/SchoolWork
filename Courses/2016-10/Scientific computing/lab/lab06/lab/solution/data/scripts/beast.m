x1 = [1 2 5 6 7 8 10 13 17];
f1 = [3.0 3.7 3.9 4.2 5.7 6.6 7.1 6.7 4.5];
fpo1 = 1.0;
fpn1 = -0.67;

S1 = clamped(x1, f1, fpo1, fpn1);

slice1 = @(i) x1(i):0.001:x1(i + 1);
value1 = @(i) polyval(S1(i,:), slice1(i));

plot(slice1(1), value1(1), slice1(2), value1(2), slice1(3), value1(3), slice1(4), value1(4), slice1(5), value1(5), slice1(6), value1(6), slice1(7), value1(7), slice1(8), value1(8));
saveas(gcf, '../img/curve1.png');

x2 = [17 20 23 24 25 27 27.7];
f2 = [4.5 7.0 6.1 5.6 5.8 5.2 4.1];
fpo2 = 3;
fpn2 = -4;

S2 = clamped(x2, f2, fpo2, fpn2);

slice2 = @(i) x2(i):0.001:x2(i + 1);
value2 = @(i) polyval(S2(i,:), slice2(i));

plot(slice2(1), value2(1), slice2(2), value2(2), slice2(3), value2(3), slice2(4), value2(4), slice2(5), value2(5), slice2(6), value2(6));
saveas(gcf, '../img/curve2.png');
 
x3 = [27.7 28 29 30];
f3 = [4.1 4.3 4.1 3.0];
fpo3 = 0.33;
fpn3 = -1.5;

S3 = clamped(x3, f3, fpo3, fpn3);

slice3 = @(i) x3(i):0.001:x3(i + 1);
value3 = @(i) polyval(S3(i,:), slice3(i));

plot(slice3(1), value3(1), slice3(2), value3(2), slice3(3), value3(3));
saveas(gcf, '../img/curve3.png');

plot(slice1(1), value1(1), slice1(2), value1(2), slice1(3), value1(3), slice1(4), value1(4), slice1(5), value1(5), slice1(6), value1(6), slice1(7), value1(7), slice1(8), value1(8));
hold on
plot(slice2(1), value2(1), slice2(2), value2(2), slice2(3), value2(3), slice2(4), value2(4), slice2(5), value2(5), slice2(6), value2(6));
hold on
plot(slice3(1), value3(1), slice3(2), value3(2), slice3(3), value3(3));
saveas(gcf, '../img/beastcurve.png');