/*set up the base path and library*/
%let path=C:\Users\kjeong3\Documents\GitHub\MSA_Summer_Practicum\Original_Data\Data;
libname Summer "&Path";
libname MA "&Path\MA";
libname NC "&Path\NC";
libname OR "&Path\OR";

data NA_marriage;
	set NA.Acs_16_5yr_s1201_with_ann2;
run;

data NC_marriage;
	set NC.Acs_16_5yr_s1201_with_ann2;
run;

data OR_marriage(keep = Zip
  Total_over_15 Married_over_15 Widowed_over_15 Divorced_over_15 Separated_over_15 Never_over_15 total);
	set OR.Acs_16_5yr_s1201_with_ann2;
	Total_over_15 = input(HC01_EST_VC01, 7);
	Married_over_15 = input(HC01_EST_VC02, 7.1);
	Widowed_over_15 = input(HC01_EST_VC03, 7.1);
	Divorced_over_15 = input(HC01_EST_VC04, 7.1);
	Separated_over_15 = input(HC01_EST_VC05, 7.1);
	Never_over_15 = input(HC01_EST_VC06, 7.1);
	total = Married_over_15 + Widowed_over_15 + Divorced_over_15 + Separated_over_15 + Never_over_15;
run;

proc print data=OR_marriage (obs=10);
	var Zip total Total_over_15 Married_over_15 Widowed_over_15
		Divorced_over_15 Separated_over_15 Never_over_15;
run;

proc summary data=OR_marriage;
	var n_HC01_EST_VC39;
	output out=totals sum=;
run;

