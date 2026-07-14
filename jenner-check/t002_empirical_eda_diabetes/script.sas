/* EXPLANATORY DATA ANALYSIS */

ods graphics on;

proc contents data=DIABETES varnum;
run;

proc freq data=DIABETES;
    tables SEX / missing;
run;

proc means data=DIABETES n nmiss mean std min p25 median p75 max;
    var AGE BMI BP S1 S2 S3 S4 S5 S6 Y;
run;
proc corr data=DIABETES pearson;
    var AGE SEX BMI BP S1 S2 S3 S4 S5 S6;
run;

proc corr data=DIABETES pearson best=5;
    var AGE SEX BMI BP S1 S2 S3 S4 S5 S6;
    with Y;
run;
proc reg data=DIABETES;
    model Y = AGE SEX BMI BP S1 S2 S3 S4 S5 S6 / vif collin;
run;
quit;

ods graphics off;
