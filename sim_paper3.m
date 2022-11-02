 aaa= imread('aaa.png');
    aaa= im2double(aaa);
     aaaa= imread('aaaa.png');
    aaaa= im2double(aaaa);
    
     w = 512;
scale = 0.23; % used to adjust PSF/OTF width
[PSFo,OTFo] = PsfOtf(w,scale); 

s1a = aaa.*aaaa; % superposed signal (0 phase)
 figure;
    imshow(s1a,[])
S1aT = ifft2( fft2(s1a).*fftshift(OTFo) );

    figure;
    imshow(S1aT,[])
                imwrite(im2uint16(mat2gray(S1aT)),['SIM3.png'],'png');

    Kotf = OTFedgeF(OTFo);
fS1aTnoisy =abs(fftshift(fft2(S1aT)));
fS1aTnoisy=fS1aTnoisy/max(max(fS1aTnoisy));
    fS1aTnoisy(257,257)=0.1;

    figure;
    imshow(fS1aTnoisy,[])
            imwrite(im2uint16(mat2gray(fS1aTnoisy)),['fSIM3.png'],'png');
