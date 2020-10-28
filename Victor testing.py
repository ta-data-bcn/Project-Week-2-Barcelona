#!/usr/bin/env python
# coding: utf-8

# In[25]:


import pandas as pd
import numpy as np
import os


# In[26]:


pwd


# In[27]:


os.chdir("C:\\Users\\GiantsV3\\Documents\\Ironhack\\Week2\\Project-Week-2-Barcelona")


# In[28]:


accidents = pd.read_csv("datasets/1.-Transportation/accidents-2017.csv")


# In[29]:


accidents


# In[37]:


accidents[(accidents["Month"] == "December") & (accidents["Part of the day"].isin(["Morning","Night"]))]


# In[8]:


accidents.info()


# In[9]:


accidents.drop(["Id", "Neighborhood Name", "Street", "Hour", "Longitude", "Latitude"], axis=1, inplace=True)


# In[10]:


accidents.head()


# In[11]:


December = accidents[accidents["Month"]=="December"]


# In[14]:


December.info()


# In[15]:


NYE = December[December["Day"]==(31)]


# In[16]:


NYE.info()


# In[19]:


NYE_index = NYE.index


# In[22]:


accidents


# In[23]:


accidents.drop(axis=0, index=NYE_index, inplace=True)


# In[24]:


accidents.info()


# In[40]:


st_juan = accidents[(accidents["Month"] == "June") & (accidents["Day"].isin([23, 24]))]
st_juan


# In[42]:


merce = accidents[(accidents["Month"] == "September") & (accidents["Day"].isin([22, 23, 24, 25]))]
merce


# In[43]:


christimas_eve = accidents[(accidents["Month"] == "December") & (accidents["Day"].isin([24, 25]))]
christimas_eve


# In[44]:


december_6_to_8 = accidents[(accidents["Month"] == "December") & (accidents["Day"].isin([6, 7, 8]))]
december_6_to_8


# In[59]:


holy_week = accidents[(accidents["Month"] == "April") & (accidents["Day"].isin([14, 15, 16, 17]))]
holy_week


# In[46]:


day_of_catalonia_long_weekend = accidents[(accidents["Month"] == "September") & (accidents["Day"].isin([8, 9, 10, 11]))]
day_of_catalonia_long_weekend


# In[47]:


august = accidents[(accidents["Month"] == "August")]
august


# In[62]:


holy_week.drop(holy_week.index[0])

