
# coding: utf-8

# In[3]:

import matplotlib.pyplot as plt
import numpy as np
get_ipython().magic('matplotlib inline')


# In[6]:

from sklearn.datasets import load_digits #import datasets
digits = load_digits()
digits.keys()   #returns keys of the digits dictionary


# In[7]:

digits.images.shape #checks the dimension of image array with 1797 values in 8x8 pixels


# In[9]:

digits.images[0]


# In[10]:

plt.matshow(digits.images[0], cmap = plt.cm.Greys)


# In[11]:

digits.data.shape #checks the dimension of data and digits.data has same information as digits.images only reshaped to 1797x64 i.e each image is single row has 64 values in it 


# In[13]:

digits.target.shape #one entry for each image in dataset


# In[14]:

digits.target  #Data is always a numpy array (or sparse matrix) of shape(n_samples, n_features )


# In[18]:

#split the data in training and test set, the train_test_split simply splits the data with 25% for testing


from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(digits.data, digits.target)


# In[19]:

#All algorithms are implemented in calsses. which contains ytraining procedures as well as the models

from sklearn.svm import LinearSVC

#Instantitate the object and set the parameters
svm =  LinearSVC(C=0.1) #setting the regularization parameters, this object encapsulates the algorithm for train and support svm and will also hold anything that is learnt from the data such as coeeficients

#fit the model

svm.fit(X_train, y_train)

#apply the model

print(svm.predict(X_train)) #applying to training data, using predict method to predict the classifier
print(y_train)


# In[20]:

#score method to evaluate the prediction, computes accurancy, takes the data and corresponding labels as arguements
svm.score(X_train, y_train)


# In[21]:

svm.score(X_test, y_test)


# In[28]:

#trying random forest
from sklearn.ensemble import RandomForestClassifier #importing
rf = RandomForestClassifier(n_estimators =50, random_state = 1) #instantiating object and setting the no. of trees=50, setting random state = 1
rf.fit(X_train, y_train)
rf.predict(X_test)
rf.score(X_test, y_test)


# In[ ]:



