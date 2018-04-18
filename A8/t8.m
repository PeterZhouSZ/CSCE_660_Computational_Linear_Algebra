% test code for HW8

%clear
rng default

% small problem
H = rand (10) > 0.8 
sum (H)
[x1,c1] = google (H) ;
fprintf ('# iterations: %d\n', c1) ;

% Harvard web pages (n=500)
Prob = ssget (1172)
H = Prob.A ;

tic
[x2,c2] = google (H) ;
toc
fprintf ('# iterations: %d\n', c2) ;
[~, order] = sort (x2, 'descend') ;
n = size (H,1) ;
for k = 1:n
    i = order (k) ;
    fprintf ('%3d %3d: %0.3e %s\n', k, i, x2 (i), Prob.aux.nodename (i,:)) ;
end

% large problem from Google
Prob = ssget (2301)
H = Prob.A ;
disp (Prob.notes)
tic
[x3,c3] = google (H) ;
toc
fprintf ('# iterations: %d\n', c3) ;
sum (x3)

save h8 x1 x2 x3