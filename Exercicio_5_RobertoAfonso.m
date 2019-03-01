% Roberto Afonso Sapucaia Oliveira de Araujo

% 1)
im = iread('piramide.png', 'double');
%transformada de hough
h = Hough(im,'suppress',5); 
lines = h.lines();
idisp(im); 
lines(1:4).plot();