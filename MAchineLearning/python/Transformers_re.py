
# coding: utf-8

# In[1]:

import matplotlib as plt
import numpy as np
get_ipython().magic('matplotlib inline')


# In[2]:

#Transformers allow you to change the representation of your data, many transformers are used for preprocessing
#loading data from sklearn 

from sklearn.datasets import load_boston
boston = load_boston()
boston.keys()


# In[3]:

#split data into training and test set

from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test =  train_test_split(boston.data, boston.target)


# In[5]:

np.set_printoptions(suppress=True)  #detailed look of the data, and can see that the data values are on diff scales, this not a good format for many models to useas they assume features to be on same scale
print(X_train)


# In[7]:



print("mean : %s" % X_train.mean(axis=0))
print("Standar deviation %s" % X_train.std(axis=0))


# In[13]:

#performing preprocesing

from sklearn.preprocessing import StandardScaler #for zero mean and std 1
scaler = StandardScaler() 


scaler.fit(X_train) #estimates the mean and std

X_scaled = scaler.transform(X_train) #transforming into scaled version 
print(X_train.shape)


print("mean : %s" % X_scaled.mean(axis=0))
print("Standar deviation %s" % X_scaled.std(axis=0))


# In[ ]:



