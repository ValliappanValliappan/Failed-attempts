import tensorflow
import pandas
import tempfile
columns=["Age","Numberofsexualpartners", "Firstsexualintercourse",
         "Numofpregnancies","Smokes?", "Smokesyears","Smokespacksyear", "HormonalContraceptives",
         "HormonalContraceptivesyears", "IUD", "IUDyears", "STDs", "STDsnumber", "STDscondylomatosis",
         "STDscervicalcondylomatosis", "STDsvaginalcondylomatosis","STDsvulvoperinealcondylomatosis",
         "STDssyphilis", "STDspelvicinflammatorydisease","STDsgenitalherpes","STDsmolluscumcontagiosum",
         "STDsAIDS", "STDsHIV","STDsHepatitisB","STDsHPV","STDsNumberofdiagnosis",'STDsTimesincefirstdiagnosis',
         "STDsTimesincelastdiagnosis","DxCancer","DxCIN","DxHPV","Dx","Label"]#Label is the result of Schiller test
training_data=pandas.read_csv("/Users/valli/Downloads/risk_factors_cervical_cancer.csv", names=columns, skipinitialspace=True, skiprows=1)
print(training_data.dtypes)
def input_fn(training_data):

#All are continuous columns
    dictOfColumnNameToTensorWithItsValues={"Age":tensorflow.constant(training_data.Age.values),"Numberofsexualpartners":tensorflow.constant(training_data.Numberofsexualpartners.values),"Firstsexualintercourse":tensorflow.constant(training_data.Firstsexualintercourse.values),
                                           "Numofpregnancies":tensorflow.constant(training_data.Numofpregnancies.values),"Smokesyears":tensorflow.constant(training_data.Smokesyears.values),"Smokespacksyear":tensorflow.constant(training_data.Smokespacksyear.values),
                                           "HormonalContraceptivesyears": tensorflow.constant(training_data.HormonalContraceptivesyears.values),"IUDyears":tensorflow.constant(training_data.IUDyears.values),"STDscondylomatosis":tensorflow.constant(training_data.STDscondylomatosis.values),
                                           "STDscervicalcondylomatosis": tensorflow.constant(training_data.STDscervicalcondylomatosis.values),"STDsvaginalcondylomatosis":tensorflow.constant(training_data.STDsvaginalcondylomatosis.values),"STDsvulvoperinealcondylomatosis":tensorflow.constant(training_data.STDsvulvoperinealcondylomatosis.values),
                                           "STDssyphilis": tensorflow.constant(training_data.STDssyphilis.values),"STDspelvicinflammatorydisease":tensorflow.constant(training_data.STDspelvicinflammatorydisease.values),"STDsgenitalherpes":tensorflow.constant(training_data.STDsgenitalherpes.values),
                                           "STDsmolluscumcontagiosum": tensorflow.constant(training_data.STDsmolluscumcontagiosum.values),"STDsAIDS":tensorflow.constant(training_data.STDsAIDS.values),"STDsHIV":tensorflow.constant(training_data.STDsHIV.values),
                                           "STDsHepatitisB": tensorflow.constant(training_data.STDsHepatitisB.values),"DxCancer":tensorflow.constant(training_data.DxCancer.values),"STDsHPV":tensorflow.constant(training_data.STDsHPV.values),"DxCIN":tensorflow.constant(training_data.DxCIN.values),
                                           "DxHPV": tensorflow.constant(training_data.DxHPV.values),"Dx": tensorflow.constant(training_data.Dx.values)}
    labelTensor=tensorflow.constant(training_data.Label.values)
    print("Achaaa")
    return dictOfColumnNameToTensorWithItsValues, labelTensor
def input_fn_train():
    return input_fn(training_data)
model_dir=tempfile
age=tensorflow.contrib.layers.real_valued_column("Age")
num_Of_Partners=tensorflow.contrib.layers.real_valued_column("Numberofsexualpartners")
first_intercourse=tensorflow.contrib.layers.real_valued_column("Firstsexualintercourse")
pregnancies=tensorflow.contrib.layers.real_valued_column("Numofpregnancies")
smokes_years = tensorflow.contrib.layers.real_valued_column("Smokesyears")
smokes_per_year = tensorflow.contrib.layers.real_valued_column("Smokespacksyear")
hormonal_contraceptives_years = tensorflow.contrib.layers.real_valued_column("HormonalContraceptivesyears")
iud_years = tensorflow.contrib.layers.real_valued_column("IUDyears")
condylomatosis = tensorflow.contrib.layers.sparse_column_with_keys("STDscondylomatosis",keys=["0", "1"])
cervical_condylomatosis = tensorflow.contrib.layers.sparse_column_with_keys("STDscervicalcondylomatosis",keys=["0", "1"])
vaginal_condylomatosis = tensorflow.contrib.layers.sparse_column_with_keys("STDsvaginalcondylomatosis",keys=["0", "1"])
vulvoperineal_condylomatosis = tensorflow.contrib.layers.sparse_column_with_keys("STDsvulvoperinealcondylomatosis",keys=["0", "1"])
syphilis = tensorflow.contrib.layers.sparse_column_with_keys("STDssyphilis",keys=["0", "1"])
PID = tensorflow.contrib.layers.sparse_column_with_keys("STDspelvicinflammatorydisease",keys=["0", "1"])
genital_herpes = tensorflow.contrib.layers.sparse_column_with_keys("STDsgenitalherpes",keys=["0", "1"])
MC = tensorflow.contrib.layers.sparse_column_with_keys("STDsmolluscumcontagiosum",keys=["0", "1"])
AIDS = tensorflow.contrib.layers.sparse_column_with_keys("STDsAIDS",keys=["0", "1"])
HIV = tensorflow.contrib.layers.sparse_column_with_keys("STDsHIV",keys=["0", "1"])
HB = tensorflow.contrib.layers.sparse_column_with_keys("STDsHepatitisB",keys=["0", "1"])
HPV = tensorflow.contrib.layers.sparse_column_with_keys("STDsHPV",keys=["0", "1"])
cancer = tensorflow.contrib.layers.sparse_column_with_keys("DxCancer",keys=["0", "1"])
CIN = tensorflow.contrib.layers.sparse_column_with_keys("DxCIN",keys=["0", "1"])
dx_hpv = tensorflow.contrib.layers.sparse_column_with_keys("DxHPV",keys=["0", "1"])
dx = tensorflow.contrib.layers.sparse_column_with_keys("Dx",keys=["0", "1"])#might be diagnosis of cervical cancer. So keeping it
print("Good until here...")
prodigy=tensorflow.contrib.learn.LinearClassifier(feature_columns=[age,num_Of_Partners,first_intercourse,pregnancies,smokes_years,smokes_per_year,hormonal_contraceptives_years,
                                                                   iud_years,condylomatosis,cervical_condylomatosis,vaginal_condylomatosis,vulvoperineal_condylomatosis,
                                                                   syphilis,PID,genital_herpes,MC,AIDS,HB,HIV,HPV,cancer,CIN,dx_hpv,dx],model_dir=model_dir)
prodigy.fit(input_fn=input_fn_train(), steps=200)
print("No errors...")