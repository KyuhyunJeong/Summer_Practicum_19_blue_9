/*set up the base path and library*/
%let path=C:\Users\kjeong3\Documents\GitHub\MSA_Summer_Practicum\Original_Data\Data;
libname Summer "&Path";
libname MA "&Path\MA";
libname NC "&Path\NC";
libname OR "&Path\OR";



data MA_marriage(keep = Zip
  Total_over_15 Married_over_15 Widowed_over_15 Divorced_over_15 Separated_over_15 Never_over_15 total
  Total_over_15_M Married_over_15_M Widowed_over_15_M Divorced_over_15_M Separated_over_15_M Never_over_15_M total_M
  Total_over_15_F Married_over_15_F Widowed_over_15_F Divorced_over_15_F Separated_over_15_F Never_over_15_F total_F);
	set MA.Acs_16_5yr_s1201_with_ann2(rename=(zip=chr_zip));
	zip = input(chr_zip,8.);
	Total_over_15 = input(HC01_EST_VC01, 7.);
	Married_over_15 = input(HC02_EST_VC01, 7.1);
	Widowed_over_15 = input(HC03_EST_VC01, 7.1);
	Divorced_over_15 = input(HC04_EST_VC01, 7.1);
	Separated_over_15 = input(HC05_EST_VC01, 7.1);
	Never_over_15 = input(HC06_EST_VC01, 7.1);
	total = Married_over_15 + Widowed_over_15 + Divorced_over_15 + Separated_over_15 + Never_over_15;
	Total_over_15_M = input(HC01_EST_VC03, 7.);
	Married_over_15_M = input(HC02_EST_VC03, 7.1);
	Widowed_over_15_M = input(HC03_EST_VC03, 7.1);
	Divorced_over_15_M = input(HC04_EST_VC03, 7.1);
	Separated_over_15_M = input(HC05_EST_VC03, 7.1);
	Never_over_15_M = input(HC06_EST_VC03, 7.1);
	total_M = Married_over_15_M + Widowed_over_15_M + Divorced_over_15_M + Separated_over_15_M + Never_over_15_M;
	Total_over_15_F = input(HC01_EST_VC10, 7.);
	Married_over_15_F = input(HC02_EST_VC10, 7.1);
	Widowed_over_15_F = input(HC03_EST_VC10, 7.1);
	Divorced_over_15_F = input(HC04_EST_VC10, 7.1);
	Separated_over_15_F = input(HC05_EST_VC10, 7.1);
	Never_over_15_F = input(HC06_EST_VC10, 7.1);
	total_F = Married_over_15_F + Widowed_over_15_F + Divorced_over_15_F + Separated_over_15_F + Never_over_15_F;
	State = 'MA';
run;

data NC_marriage(keep = Zip
  Total_over_15 Married_over_15 Widowed_over_15 Divorced_over_15 Separated_over_15 Never_over_15 total
  Total_over_15_M Married_over_15_M Widowed_over_15_M Divorced_over_15_M Separated_over_15_M Never_over_15_M total_M
  Total_over_15_F Married_over_15_F Widowed_over_15_F Divorced_over_15_F Separated_over_15_F Never_over_15_F total_F);
	set NC.Acs_16_5yr_s1201_with_ann2(rename=(zip=chr_zip));
	zip = input(chr_zip,8.);
	Total_over_15 = input(HC01_EST_VC01, 7.);
	Married_over_15 = input(HC02_EST_VC01, 7.1);
	Widowed_over_15 = input(HC03_EST_VC01, 7.1);
	Divorced_over_15 = input(HC04_EST_VC01, 7.1);
	Separated_over_15 = input(HC05_EST_VC01, 7.1);
	Never_over_15 = input(HC06_EST_VC01, 7.1);
	total = Married_over_15 + Widowed_over_15 + Divorced_over_15 + Separated_over_15 + Never_over_15;
	Total_over_15_M = input(HC01_EST_VC03, 7.);
	Married_over_15_M = input(HC02_EST_VC03, 7.1);
	Widowed_over_15_M = input(HC03_EST_VC03, 7.1);
	Divorced_over_15_M = input(HC04_EST_VC03, 7.1);
	Separated_over_15_M = input(HC05_EST_VC03, 7.1);
	Never_over_15_M = input(HC06_EST_VC03, 7.1);
	total_M = Married_over_15_M + Widowed_over_15_M + Divorced_over_15_M + Separated_over_15_M + Never_over_15_M;
	Total_over_15_F = input(HC01_EST_VC10, 7.);
	Married_over_15_F = input(HC02_EST_VC10, 7.1);
	Widowed_over_15_F = input(HC03_EST_VC10, 7.1);
	Divorced_over_15_F = input(HC04_EST_VC10, 7.1);
	Separated_over_15_F = input(HC05_EST_VC10, 7.1);
	Never_over_15_F = input(HC06_EST_VC10, 7.1);
	total_F = Married_over_15_F + Widowed_over_15_F + Divorced_over_15_F + Separated_over_15_F + Never_over_15_F;
	State = 'NC';
run;

data OR_marriage(keep = Zip
  Total_over_15 Married_over_15 Widowed_over_15 Divorced_over_15 Separated_over_15 Never_over_15 total
  Total_over_15_M Married_over_15_M Widowed_over_15_M Divorced_over_15_M Separated_over_15_M Never_over_15_M total_M
  Total_over_15_F Married_over_15_F Widowed_over_15_F Divorced_over_15_F Separated_over_15_F Never_over_15_F total_F);
	set OR.Acs_16_5yr_s1201_with_ann2(rename=(zip=chr_zip));
	zip = input(chr_zip,8.);
	Total_over_15 = input(HC01_EST_VC01, 7.);
	Married_over_15 = input(HC02_EST_VC01, 7.1);
	Widowed_over_15 = input(HC03_EST_VC01, 7.1);
	Divorced_over_15 = input(HC04_EST_VC01, 7.1);
	Separated_over_15 = input(HC05_EST_VC01, 7.1);
	Never_over_15 = input(HC06_EST_VC01, 7.1);
	total = Married_over_15 + Widowed_over_15 + Divorced_over_15 + Separated_over_15 + Never_over_15;
	Total_over_15_M = input(HC01_EST_VC03, 7.);
	Married_over_15_M = input(HC02_EST_VC03, 7.1);
	Widowed_over_15_M = input(HC03_EST_VC03, 7.1);
	Divorced_over_15_M = input(HC04_EST_VC03, 7.1);
	Separated_over_15_M = input(HC05_EST_VC03, 7.1);
	Never_over_15_M = input(HC06_EST_VC03, 7.1);
	total_M = Married_over_15_M + Widowed_over_15_M + Divorced_over_15_M + Separated_over_15_M + Never_over_15_M;
	Total_over_15_F = input(HC01_EST_VC10, 7.);
	Married_over_15_F = input(HC02_EST_VC10, 7.1);
	Widowed_over_15_F = input(HC03_EST_VC10, 7.1);
	Divorced_over_15_F = input(HC04_EST_VC10, 7.1);
	Separated_over_15_F = input(HC05_EST_VC10, 7.1);
	Never_over_15_F = input(HC06_EST_VC10, 7.1);
	total_F = Married_over_15_F + Widowed_over_15_F + Divorced_over_15_F + Separated_over_15_F + Never_over_15_F;
	State = 'OR';
run;

data Summer.marriage;
	set MA_marriage NC_marriage OR_marriage;
run;

/*data NC_school(keep = Zip*/
/*  Num_3yrs Pct_3yrs Num_3yrs_pub Pct_3yrs_pup Num_3yrs_pri Pct_3yrs_pri*/
/*  Num_high Pct_high Num_high_pub Pct_high_pub Num_high_pri Pct_high_pri*/
/*  Num_univ Pct_univ Num_univ_pub Pct_univ_pub Num_univ_pri Pct_univ_pri*/
/*  Num_grad Pct_grad Num_grad_pub Pct_grad_pub Num_grad_pri Pct_grad_pri*/
/*  Num_1824 Pct_1824 Num_1824_pub Pct_1824_pub Num_1824_pri Pct_1824_pri*/
/*  );*/
/*  	*/
/*	set NC.Acs_16_5yr_s1401_with_ann2;*/
/*	Num_3yrs 	 = 	HC01_EST_VC01;*/
/*	Pct_3yrs 	 = 	HC02_EST_VC01;*/
/*	Num_3yrs_pub = 	HC03_EST_VC01;*/
/*	if find(HC04_EST_VC01, '.')>1 then*/
/*	Pct_3yrs_pup = 	input(HC04_EST_VC01, 7.1);*/
/*	else Pct_3yrs_pup = 	input(HC04_EST_VC01, 8.);*/
/*	Num_3yrs_pri = 	HC05_EST_VC01;*/
/*	Pct_3yrs_pri = 	input(HC06_EST_VC01, 7.1);*/
/**/
/*	Num_high 	 = 	HC01_EST_VC07;*/
/*	Pct_high 	 = 	input(HC02_EST_VC07, 7.1);*/
/*	Num_high_pub = 	HC03_EST_VC07;*/
/*	Pct_high_pup = 	input(HC04_EST_VC07, 7.1);*/
/*	Num_high_pri = 	HC05_EST_VC07;*/
/*	Pct_high_pri = 	input(HC06_EST_VC07, 7.1);*/
/**/
/*	Num_coll 	 = 	HC01_EST_VC08;*/
/*	Pct_coll 	 = 	input(HC02_EST_VC08, 7.1);*/
/*	Num_coll_pub = 	HC03_EST_VC08;*/
/*	Pct_coll_pup = 	input(HC04_EST_VC08, 7.1);*/
/*	Num_coll_pri = 	HC05_EST_VC08;*/
/*	Pct_coll_pri = 	input(HC06_EST_VC08, 7.1);*/
/**/
/*	Num_grad 	 = 	HC01_EST_VC09;*/
/*	Pct_grad 	 = 	input(HC02_EST_VC09, 7.1);*/
/*	Num_grad_pub = 	HC03_EST_VC09;*/
/*	Pct_grad_pup = 	input(HC04_EST_VC09, 7.1);*/
/*	Num_grad_pri = 	HC05_EST_VC09;*/
/*	Pct_grad_pri = 	input(HC06_EST_VC09, 7.1);*/
/*	*/
/*	Num_1824 	 = 	HC01_EST_VC40;*/
/*	Pct_1824 	 = 	input(HC02_EST_VC40, 7.1);*/
/*	Num_1824_pub = 	HC03_EST_VC40;*/
/*	Pct_1824_pup = 	input(HC04_EST_VC40, 7.1);*/
/*	Num_1824_pri = 	HC05_EST_VC40;*/
/*	Pct_1824_pri = 	input(HC06_EST_VC40, 7.1);*/
/**/
/*	State = 'NC';*/
/*run;*/
