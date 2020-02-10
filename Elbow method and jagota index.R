#what is to be done

#Decide the number of clusters (k)
#Select k random points from the data as centroids
#Assign all the points to the nearest cluster centroid
#Calculate the centroid of newly formed clusters
#Repeat steps 3 and 4

#Runs until the centroids of newly formed clusters do not change 
#or the maximum number of iterations are reached

plot(x = iris$Petal.Length, y = iris$Petal.Width, pch=21,
     bg=c(1,2,3)[unclass(iris$Species)], xlab = "Petal Length",
     ylab="Petal Width")
no.datapoints=length(iris$Species)
j_func=c(seq(1,10))
j_calc=0
for (k in 1:10) 
  {
  iriscluster=kmeans(iris[,3:4],centers = k)
    for (j in 1:k) 
      {
      for (i in 1:no.datapoints) 
        {
        if(iriscluster$cluster[i]==j)
          {
          d=(dist(rbind(iriscluster$centers[j,],iris[i,3:4])))^2
          j_calc=j_calc+d
        }
      }
    }
  j_func[k]=j_calc/no.datapoints
  j_calc=0
}
plot(x = c(1:10),y = j_func,type = "l",xlab = "K_values", 
     ylab = "Cost values", main="Elbow method")

#elbow function for K-medoids

no.datapoints=length(iris$Species) #finding the number of data points
j_func=c(seq(1,10))
j_calc=0 
# using 3 loops to calculate the value of J
for (k in 1:10) 
{
  dfcluster=pam(iris[,1:4], k)
  for (j in 1:k) 
  {
    for (i in 1:no.datapoints) 
    {
      if(dfcluster$clustering[i]==j)
      {
        d=(dist(rbind(dfcluster$medoids[j,],iris[i,1:4])))^2
        j_calc=j_calc+d
      }
    }
  }
  j_func[k]=j_calc/no.datapoints
  j_calc=0
}
j_func
plot(x = c(1:10),y = j_func,type = "l",xlab = "K_values", 
     ylab = "Cost values", main="Elbow method")




#Jagota Index

no.datapoints=length(iris$Species)
j_func=c(seq(1,10))
j_calc=0
count=0
sum=0
for (k in 1:10) 
{
  iriscluster=kmeans(iris[,3:4],centers = k)
  for (j in 1:k) 
  {
    for (i in 1:no.datapoints) 
    {
      if(iriscluster$cluster[i]==j)
      {
        count=count+1
        d=(dist(rbind(iriscluster$centers[j,],iris[i,3:4])))
        j_calc=j_calc+d
      }
    }
    clus_xi=j_calc/count
    j_calc=0
    count=0
    sum=sum+clus_xi
  }
  j_func[k]=sum
  sum=0
}
plot(x = c(1:10),y = j_func,type = "l",xlab = "K_values", 
     ylab = "Q", main="Cluster quality measure")


#Finding elbow for USarrest attributes Murder and Assault.

no.datapoints=length(USArrests$Murder)
j_func=c(seq(1,10))
j_calc=0
for (k in 1:10) 
{
  UScluster=kmeans(USArrests[,1:2],centers = k)
  for (j in 1:k) 
  {
    for (i in 1:no.datapoints) 
    {
      if(UScluster$cluster[i]==j)
      {
        d=(dist(rbind(UScluster$centers[j,],USArrests[i,1:2])))^2
        j_calc=j_calc+d
      }
    }
  }
  j_func[k]=j_calc/no.datapoints
  j_calc=0
}

plot(x = c(1:10),y = j_func,type = "l",xlab = "K_values", 
     ylab = "Cost values", main="Elbow method")


#Finding elbow for USarrest attributes Rape and Urban pop.

no.datapoints=length(USArrests$Murder)
j_func=c(seq(1,10))
j_calc=0
for (k in 1:10) 
{
  UScluster=kmeans(USArrests[,3:4],centers = k)
  for (j in 1:k) 
  {
    for (i in 1:no.datapoints) 
    {
      if(UScluster$cluster[i]==j)
      {
        d=(dist(rbind(UScluster$centers[j,],USArrests[i,3:4])))^2
        j_calc=j_calc+d
      }
    }
  }
  j_func[k]=j_calc/no.datapoints
  j_calc=0
}

plot(x = c(1:10),y = j_func,type = "l",xlab = "K_values", 
     ylab = "Cost values", main="Elbow method")

