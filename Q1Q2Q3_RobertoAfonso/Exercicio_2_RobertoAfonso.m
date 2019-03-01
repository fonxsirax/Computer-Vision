lena = iread('lena.pgm');
idisp(lena);
%piscar 5 vezes transladando o cilio ate abaixo do olho
for loop = 1:5
    cilio = lena(256:260,250:285);
    for j = 257:273
        lena(j:j+4,250:285) = cilio;
        drawnow
        image(lena);
    end
    lena = iread('lena.pgm');
end
lena = iread('lena.pgm');
idisp(lena);