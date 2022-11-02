clear all; 
close all;
a= zeros(512,512);
  a(:,:)=0.6;
  aaaa= imread('aaaa.png');
    aaaa= im2double(aaaa);
   figure;
    imshow(aaaa,[]);
     figure;
    imshow(a,[]);
    
      w = 512;
scale = 0.23; % used to adjust PSF/OTF width
[PSFo,OTFo] = PsfOtf(w,scale); 

s1a = aaaa.*a; % superposed signal (0 phase)
 figure;
    imshow(s1a,[])
S1aT = ifft2( fft2(s1a).*fftshift(OTFo) );

   NoiseLevel = 15; % in percentage

    aNoise = NoiseLevel/100; % corresponds to 15% noise
nS1aT = random('norm', 0, aNoise*std2(S1aT), w , w);
NoiseFrac = 1; %may be set to 0 to avoid noise addition
S1aTnoisy = S1aT + NoiseFrac*nS1aT;

 
 figure;
    imshow(S1aTnoisy,[])
    
    imshow(S1aTnoisy,[])
        imwrite(im2uint16(mat2gray(S1aTnoisy)),['SIM2.png'],'png');
        
     Kotf = OTFedgeF(OTFo);
    fS1aTnoisy =abs(fftshift(fft2(S1aT)));
fS1aTnoisy=fS1aTnoisy/max(max(fS1aTnoisy));
    fS1aTnoisy(257,257)=0.1;

    figure;
    imshow(fS1aTnoisy,[])
        imwrite(im2uint16(mat2gray(fS1aTnoisy)),['fSIM2.png'],'png');

