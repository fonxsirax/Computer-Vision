imagem = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0;0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0;0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0;0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];

area = mpq(imagem, 0, 0);
%
uc = mpq(imagem, 1, 0)/mpq(imagem, 0, 0);
vc = mpq(imagem, 0, 1)/mpq(imagem, 0, 0);
centroide = [uc, vc];
%
u20 = upq(imagem, 2, 0); 
u02 = upq(imagem, 0, 2); 
u11 = upq(imagem, 1, 1); 
Momento = [u20 u11; u11 u02]

%Autovalores e autovetores da matriz J.
lambda = eig(Momento);

%Raio máximo e mínimo da elipse.
raioMaximo = 2*sqrt(lambda(2)/area);
raioMinimo = 2*sqrt(lambda(1)/area);

%Orientação da imagem
blob = imoments(imagem)

%Centroide e elipse equivalente.
idisp(imagem);
plot_ellipse(4*Momento/area, [uc, vc], 'r');
plot(uc, vc, 'gx'); plot(uc, vc, 'go'); 