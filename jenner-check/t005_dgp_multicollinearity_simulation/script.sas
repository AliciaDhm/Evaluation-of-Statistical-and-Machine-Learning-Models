/* MULTICOLLINEARITY DGP from "Simulations and metrics.sas".
   Replication count reduced (MC=1000 -> 100) for a quick captured run;
   the Toeplitz-correlated generating logic is otherwise unchanged. */

proc iml;
call randseed(12345);

N  = 200;
P  = 50;
MC = 100;

Beta = j(P, 1, 0);
Beta[1:6] = {1, -0.35, 0.15, 0.27, 0.57, -0.14};

Mu = j(1, P, 0);

r = {1, 0.8, 0.75, 0.7, 0.65, 0.6};   
V1 = toeplitz(r);                
Varcovar = I(P);
Varcovar[1:6, 1:6] = V1;

simulated_data = j(N*MC, 2+P, .);
a = 1;

do iteration = 1 to MC;
	X = RandNormal(N, Mu, Varcovar);

    eps = normal(j(N,1,0)) * 0.1;
    Y   = X * Beta + eps;

    simulated_data[a:a+N-1, 1]     = iteration;
    simulated_data[a:a+N-1, 2]     = Y;
    simulated_data[a:a+N-1, 3:2+P] = X;

    a = a + N;
end;

cname = {"Iteration_ID" "Y"};
do i = 1 to P;
    cname = cname || cats("X", i);
end;

create DGP_Multicolinearite from simulated_data[colname=cname];
append from simulated_data;
close DGP_Multicolinearite;

quit;

title "DGP Multicolinearite - resume (Y et predicteurs correles X1-X6)";
proc means data=DGP_Multicolinearite n mean std; var Y X1 X2 X3 X6 X50; run;
proc corr data=DGP_Multicolinearite; var X1 X2 X3 X4 X5 X6; run;
title;
