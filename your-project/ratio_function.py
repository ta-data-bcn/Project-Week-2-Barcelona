#!/usr/bin/env python
# coding: utf-8

# In[4]:


import pandas as pd


# In[10]:


holidays = pd.read_csv("datasets/1.-Transportation/acc_with_hol.csv")
non_holidays = pd.read_csv("datasets/1.-Transportation/acc_without_hol.csv")


# In[18]:


n_hol_day = len(holidays["Date"].unique())
def hol_ratio(x):
    return x / n_hol_day


# In[34]:


n_non_day = len(non_holidays["Date"].unique())

def no_hol_ratio(x):
    return x / n_non_day


# In[ ]:




