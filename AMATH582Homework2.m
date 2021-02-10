%Load in Songs
[GNR, GNRfs] = audioread('GNR.m4a');
tr_gnr = length(GNR)/GNRfs; % record time in seconds


[PF, PFfs] = audioread('Floyd.m4a');
PF = PF(1:end-1);
tr_PF = length(PF)/PFfs; % record time in seconds

%GNR

L = tr_gnr; n=length(GNR);
t2 = linspace(0,L,n+1); t = t2(1:n);
k = (1/L)*[0:n/2-1  -n/2:-1];
ks=fftshift(k);
tslide=0:0.1:tr_gnr;
Sgt_spec = zeros(length(tslide),n);
maxFreq = zeros(length(tslide),1);
for j = 1:length(tslide)
    gab = exp(-1000*(t-tslide(j)).^2);  %Gabor
    Sg=gab.*transpose(GNR);
    Sgt = fft(Sg);
    AbsSgt = fftshift(abs(Sgt));
    [maxv, idx] = max(AbsSgt);
    maxFreq(j) = abs(ks(idx));
    Sgtfilt = fft(Sg).*fftshift(exp(-1*(ks-abs(maxFreq(j))).^2));
    Sgt_spec(j,:) = abs(fftshift(Sgtfilt));
    subplot(2,1,1), plot(t, Sg, 'k')
    subplot(2,1,2), plot(ks, AbsSgt)
    drawnow
end

figure(3)
pcolor(tslide, ks, log((abs(Sgt_spec.')+1))), shading interp, colormap(hot)
set(gca, 'Ylim', [0 1000])
title('Sweet Child O Mine', 'Fontsize', 12)
xlabel('Time (t)', 'Fontsize', 12)
ylabel('Frequency (Hz)', 'Fontsize', 12)

guitarnotes = maxFreq(maxFreq < 1100 & maxFreq > 250);



%Pink Floyd

%Bass Line
L = tr_PF; n=length(PF);
t2 = linspace(0,L,n+1); t = t2(1:n);
k = (1/L)*[0:n/2-1  -n/2:-1];
ks=fftshift(k);
tslide=0:0.3:tr_PF;
Sgt_spec = zeros(length(tslide),n);
maxFreq = zeros(length(tslide),1);
for j = 1:length(tslide)
    gab = exp(-100*(t-tslide(j)).^2);  %Gabor
    Sg=gab.*transpose(PF);
    Sgt = fft(Sg);
    AbsSgt = fftshift(abs(Sgt));
    [maxv, idx] = max(AbsSgt);
    maxFreq(j) = abs(ks(idx));
    Sgtfilt = fft(Sg).*fftshift(exp(-1*(ks-maxFreq(j)).^2));
    Sgt_spec(j,:) = abs(fftshift(Sgtfilt));
end
figure(4)
pcolor(tslide, ks, log((abs(Sgt_spec.')+1))), shading interp, colormap(hot)
set(gca, 'Ylim', [50 150])
title('Comfortably Numb Bass', 'Fontsize', 12)
xlabel('Time (t)', 'Fontsize', 12)
ylabel('Frequency (Hz)', 'Fontsize', 12)

bassnotes = maxFreq(maxFreq < 200);

%Remove Bass
L = tr_PF; n=length(PF);
k = (1/L)*[0:n/2-1  -n/2:-1];
ks = fftshift(k);
s = PF;
sf = fft(s);
FPF = fftshift(sf);
for j = 1:length(ks)
    if abs(ks(j)) < 160
        FPF(j) = 0;
    end
end
subplot(2,1,1), plot(ks, abs(FPF));
reverse = ifft(ifftshift(FPF));

%Guitar Solo
filtPF = reverse(1:length(reverse));
filttr_PF = length(filtPF)/PFfs;
L = filttr_PF; n = length(filtPF);
t2 = linspace(0,L,n+1); t = t2(1:n);
k = (1/L)*[0:n/2-1  -n/2:-1];
ks = fftshift(k);
tslide = 0:0.3:filttr_PF;
Sgt_spec = zeros(length(tslide),n);
maxFreq = zeros(length(tslide),1);
for j = 1:length(tslide)
    gab = exp(-100*(t-tslide(j)).^2);  %Gabor
    Sg=gab.*transpose(filtPF);
    Sgt = fft(Sg);
    AbsSgt = fftshift(abs(Sgt));
    [maxv, idx] = max(AbsSgt);
    maxFreq(j) = abs(ks(idx));
    Sgtfilt = fft(Sg).*fftshift(exp(-1*(ks-maxFreq(j)).^2));
    Sgt_spec(j,:) = abs(fftshift(Sgtfilt));
end


figure(5)
pcolor(tslide, ks, log((abs((Sgt_spec.')+1)))), shading interp, colormap(hot)
set(gca, 'Ylim', [200 1000])
title('Comfortably Numb Guitar Solo', 'Fontsize', 12)
xlabel('Time (t)', 'Fontsize', 12)
ylabel('Frequency (Hz)', 'Fontsize', 12)

solonotes = maxFreq(maxFreq < 1000);

