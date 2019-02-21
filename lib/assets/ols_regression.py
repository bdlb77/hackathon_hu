import pylab as pl
import scipy as sp
from numpy.linalg import inv
from numpy.linalg import solve
from numpy import genfromtxt
from scipy.io import loadmat
import numpy as np
from scipy.spatial.distance import cdist
import csv
import random

def train_ols(X_train, Y_train):
    ''' Trains ordinary least squares (ols) regression
    Input:       X_train  -  DxN array of N data points with D features
                 Y        -  D2xN array of length N with D2 multiple labels
    Output:      W        -  DxD2 array, linear mapping used to estimate labels
                             with sp.dot(W.T, X)
    '''
    W = solve(X_train @ X_train.T, X_train @Y_train.T)
    return W

def apply_ols(W, X_test):
    ''' Applys ordinary least squares (ols) regression
    Input:       X_test    -  DxN array of N data points with D features
                 W        -  DxD2 array, linear mapping used to estimate labels
                             trained with train_ols
    Output:     Y_test    -  D2xN array
    '''
    Y_test = W.T @ X_test
    return Y_test



X = genfromtxt('applicants.csv', delimiter=',')



X_test = genfromtxt('one_applicant.csv', delimiter=',')



print(X)

x_train = sp.array([[ 1,  0,  1 , 0],[ 1,  1,  0, 0]])


x_test = sp.array([[ 1,  0.5,  0, 1, 0],[ 1,  0,  1 , 1, 0]])

y_label = sp.random.normal(0.5,1,X.shape[1])

for i in range(0,y_label.shape[0]):
	y_label[i] = random.randint(0,1)


print(y_label)

print (x_train)

W = train_ols(X, y_label)

y_est = apply_ols(W,X_test)

print(y_est)
