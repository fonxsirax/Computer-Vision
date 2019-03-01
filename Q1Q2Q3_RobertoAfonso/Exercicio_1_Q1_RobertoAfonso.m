cam = CentralCamera('focal', 0.015, 'pixel', 10e-6, 'resolution', [1280 1024], 'centre', [640 512], 'name', 'mycamera');

P = [0.3, 0.4, 3.0]';
% create an edge representation of the cube
[X,Y,Z] = mkcube(0.2, 'T', transl([0, 0, 1.0]), 'edge');

cam.mesh(X, Y, Z);
 
Tcam = transl(-1,0,0.5)*troty(0.8); 
cam.mesh(X, Y, Z, 'Tcam', Tcam);

Tcam = transl(-1.1,0,0)*troty(1.1); 
cam.mesh(X, Y, Z, 'Tcam', Tcam);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cam2 = CentralCamera('focal', 0.015, 'pixel', 10e-6, 'resolution', [1280 1024], 'centre', [640 512], 'name', 'mycamera');


theta = [0:100]/100*2*pi; 
[X,Y,Z] = mkcube(0.2, [], 'edge');

for th=theta 
    T_cube = transl(0, 0, 1.5)*trotx(0)*troty(th*1.3)*trotz(0) ;  %rodando em y em volta do centro
    cam2.mesh( X, Y, Z, 'Tobj', T_cube ); 
    pause(0.01);
    cam2.clf;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


