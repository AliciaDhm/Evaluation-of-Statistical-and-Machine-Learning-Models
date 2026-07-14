/* DGP GAUSSIEN — Monte Carlo data-generating process from
   "Simulations and metrics.sas". Replication count reduced (MC=1000 -> 100)
   for a quick captured run; the generating logic is otherwise unchanged. */

proc iml;

call randseed(12345);
n  = 200;
p  = 50;
MC = 100;

Beta = j(p, 1, 0);
Beta[1:6] = {1, -0.35, 0.15, 0.27, 0.57, -0.14};

Mu       = j(1, p, 0);
Varcovar = I(p);

simulated_data = j(n*MC, 2+p, .);
a = 1;

do iteration = 1 to MC;
  X   = RandNormal(n, Mu, Varcovar);
  eps = normal(j(n, 1, 0))*0.1;
  Y   = X * Beta + eps;

  simulated_data[a:a+n-1, 1]     = iteration;
  simulated_data[a:a+n-1, 2]     = Y;
  simulated_data[a:a+n-1, 3:2+p] = X;
  a = a + n;
end;

cname = {"Iteration_ID" "Y"};
do i = 1 to p;
  cname = cname || cats("X", i);
end;

create DGP_Gaussien from simulated_data[colname=cname];
append from simulated_data;
close DGP_Gaussien;

quit;

title "DGP Gaussien - resume (Y et premiers predicteurs)";
proc means data=DGP_Gaussien n mean std; var Y X1 X2 X6 X50; run;
title;
