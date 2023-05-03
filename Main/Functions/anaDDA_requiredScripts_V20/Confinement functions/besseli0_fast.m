function I0 = besseli0_fast(x,scaleflag)
if ~exist('scaleflag','var')
    scaleflag=0;
end

if max(x(:))<3.75 && min(x(:))>-3.75
x=x./3.75;
x=x.^2;
I0=1.0+x.*(3.5156229+x.*(3.0899424+x.*(1.2067492+x.*(0.2659732+x.*(0.360768e-1+x.*0.45813e-2)))));
else
ax = abs(x);

I0 = zeros(size(x));
% ax<3.75
k = find(ax<3.75);
y=x(k)./3.75;
y=y.^2;
I0(k)=1.0+y.*(3.5156229+y.*(3.0899424+y.*(1.2067492+y.*(0.2659732+y.*(0.360768e-1+y.*0.45813e-2)))));
if scaleflag
    I0(k)=I0(k)./exp(ax(k));
end
% ax>=3.75
k = find(ax>=3.75);
y=3.75./ax(k);
if scaleflag
    I0(k)=1./sqrt(ax(k)).*(0.39894228+y.*(0.1328592e-1+y.*(0.225319e-2+y.*(-0.157565e-2+y.*(0.916281e-2+y.*(-0.2057706e-1+y.*(0.2635537e-1+y.*(-0.1647633e-1+y.*0.392377e-2))))))));
else
    I0(k)=exp(ax(k))./sqrt(ax(k)).*(0.39894228+y.*(0.1328592e-1+y.*(0.225319e-2+y.*(-0.157565e-2+y.*(0.916281e-2+y.*(-0.2057706e-1+y.*(0.2635537e-1+y.*(-0.1647633e-1+y.*0.392377e-2))))))));
end
end