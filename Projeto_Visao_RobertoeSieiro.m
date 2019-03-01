
%Alunos: Roberto Afonso Sapucaia Oliveira de Araujo
%Rafael Pontes Sieiro


clear;
clc;
video_out=Movie('quad.avi');
video_out.size();

%procurando o vermelho
primeiro = video_out.grab();
[cls, cxy] = colorkmeans(primeiro, 10);

i  = 1;
while i < 10
    
    if (strcmp(colorname(cxy(:,i), 'xy'), 'indianred1'));
        buscado = i;
        break;
    end
    i = i+1;
end

ALVO = (cls == buscado);
blob =  iblobs(ALVO,'area',[1000,10000]);
centroid = [blob.uc blob.vc];
trajetoria = [centroid];

h = 0;
while 1
    h = h+1;
    im=video_out.grab();  
    if isempty(im), break; end
    
    cls = colorkmeans(im, cxy);
    ALVO = (cls == buscado);
    
    blob =  iblobs(ALVO,'area',[500,10000]);
    if length(blob)>1
        blob = blob(1);
    end

    
 
    
    
    
    image(im);
    
     hold on
  
    trajetoria = [trajetoria; centroid];
    plot2(trajetoria, 'LineWidth', 3, 'Color', 'r');
    hold on
    centroid = [blob.uc blob.vc];
    plot(centroid(1), centroid(2), 'gx'); plot(centroid(1), centroid(2), 'go'); 
    hold on
    
    U00 = blob.area;
    U20 = blob.moments.u20;
    U02 = blob.moments.u02;
    U11 = blob.moments.u11;
    MATRIZ = [U20 U11; U11 U02];

    
    plot_ellipse(4*MATRIZ/U00, centroid, 'r');
   

end

    