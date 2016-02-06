
# coding: utf-8

# In[ ]:

import matplotlib.pyplot as plt
import numpy as np
get_ipython().magic('matplotlib inline')


# In[1]:

#regression

#loading data

from sklearn.datasets import load_boston
boston = load_boston()
boston.keys()


# In[2]:

print(boston.DESCR)


# In[3]:

boston.data.shape


# In[4]:

boston.target.shape


# In[5]:

boston.target


# In[11]:

#spliting the dataset for training and testing

from sklearn.cross_validation import train_test_split
X_train, X_test, y_train,  y_test = train_test_split(boston.data, boston.target)

#importing ridge model

from sklearn.linear_model import Ridge

ridge = Ridge()

ridge.fit(X_train, y_train)


# In[12]:

pred_test = ridge.predict(X_test)
pred_test


# In[13]:

ridge.score(X_test, y_test)


# In[14]:

#MSE

from sklearn.metrics import mean_squared_error
mean_squared_error(y_test, pred_test)


# In[16]:

#RandomForestRegresion

from sklearn.ensemble import RandomForestRegressor
rf = RandomForestRegressor()

rf.fit(X_train, y_train)

rf.score(X_test, y_test)

mean_squared_error(y_test, rf.predict(X_test))


# In[ ]:



