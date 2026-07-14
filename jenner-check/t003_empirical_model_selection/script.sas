title "1. Sélection STEPWISE avec critère AIC";
proc glmselect data=WORK.DIABETES plots=(CriterionPanel ASEPlot CoefficientPanel) seed=12345;
    partition fraction(validate=0.3);
   
    model Y = AGE SEX BMI BP S1 S2 S3 S4 S5 S6 /
          selection=stepwise(select=AIC choose=validate)
          stats=all;
run;

title "2. Sélection STEPWISE avec critère SBC";
proc glmselect data=WORK.DIABETES plots=(CriterionPanel ASEPlot CoefficientPanel) seed=12345;
    partition fraction(validate=0.3);
   
    model Y = AGE SEX BMI BP S1 S2 S3 S4 S5 S6 /
          selection=stepwise(select=SBC choose=validate)
          stats=all;
run;


title "3. Régression LASSO";
proc glmselect data=WORK.DIABETES plots=(CriterionPanel ASEPlot CoefficientPanel) seed=12345;
    partition fraction(validate=0.3);
   
    model Y = AGE SEX BMI BP S1 S2 S3 S4 S5 S6 /
          selection=lasso(stop=SBC choose=CV)
          cvmethod=random(10);
run;

title "4. Régression ELASTIC NET";
proc glmselect data=WORK.DIABETES plots=(CriterionPanel ASEPlot CoefficientPanel) seed=12345;
    partition fraction(validate=0.3);
   
    model Y = AGE SEX BMI BP S1 S2 S3 S4 S5 S6 /
          selection=elasticnet(stop=SBC choose=CV)
          cvmethod=random(10);
run;

title;
